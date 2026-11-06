# DEADSTICK-OS: complete read-only Nova package comparison
# Hashes every file present in both Blank and DS9 archives, without extraction.
# Also reports paths unique to either archive and highlights configuration/genre files.

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem

$work = Join-Path $env:TEMP 'DEADSTICK-NOVA-REVIEW'
$reportDir = 'C:\DEADSTICK-NOVA-STAGING'
$reportPath = Join-Path $reportDir 'DEADSTICK-NOVA-FULL-DIFF.txt'

$packages = @(
    @{ Name = 'Blank'; Path = (Join-Path $work 'nova-2.7.19-blank.zip') },
    @{ Name = 'DS9';   Path = (Join-Path $work 'nova-2.7.19-ds9.zip') }
)

foreach ($package in $packages) {
    if (-not (Test-Path -LiteralPath $package.Path -PathType Leaf)) {
        throw "Missing reference archive: $($package.Path). Run the original package inspection first."
    }
}

New-Item -ItemType Directory -Path $reportDir -Force | Out-Null

function Get-EntryMap {
    param([System.IO.Compression.ZipArchive]$Zip)
    $map = @{}
    foreach ($entry in $Zip.Entries) {
        $name = $entry.FullName.Replace('\', '/').TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($name) -or $name.EndsWith('/')) { continue }
        $map[$name] = $entry
    }
    return ,$map
}

function Get-EntrySha256 {
    param([System.IO.Compression.ZipArchiveEntry]$Entry)
    $stream = $Entry.Open()
    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        return ([System.BitConverter]::ToString($sha.ComputeHash($stream))).Replace('-', '')
    }
    finally {
        $sha.Dispose()
        $stream.Dispose()
    }
}

function Add-TextFile {
    param(
        [System.Collections.Generic.List[string]]$Lines,
        [string]$Label,
        [System.IO.Compression.ZipArchiveEntry]$Entry
    )
    if (-not $Entry) {
        $Lines.Add("MISSING: $Label")
        return
    }
    $Lines.Add("--- $Label ($($Entry.Length) bytes) ---")
    $reader = New-Object System.IO.StreamReader($Entry.Open())
    try {
        $content = $reader.ReadToEnd()
        $contentLines = $content -split '\r?\n'
        $limit = [Math]::Min($contentLines.Count, 100)
        for ($i = 0; $i -lt $limit; $i++) { $Lines.Add($contentLines[$i]) }
        if ($contentLines.Count -gt $limit) {
            $Lines.Add("[TRUNCATED: $($contentLines.Count) total lines]")
        }
    }
    finally {
        $reader.Dispose()
    }
    $Lines.Add('')
}

$archives = @()
try {
    foreach ($package in $packages) {
        Write-Host "Opening $($package.Name) archive read-only..."
        $zip = [System.IO.Compression.ZipFile]::OpenRead($package.Path)
        $archives += [pscustomobject]@{
            Name = $package.Name
            Path = $package.Path
            Zip = $zip
            Map = (Get-EntryMap -Zip $zip)
        }
    }

    $blank = $archives | Where-Object Name -eq 'Blank' | Select-Object -First 1
    $ds9 = $archives | Where-Object Name -eq 'DS9' | Select-Object -First 1

    $blankPaths = @($blank.Map.Keys)
    $ds9Paths = @($ds9.Map.Keys)
    $blankSet = @{}
    $ds9Set = @{}
    foreach ($path in $blankPaths) { $blankSet[$path] = $true }
    foreach ($path in $ds9Paths) { $ds9Set[$path] = $true }

    $onlyBlank = @($blankPaths | Where-Object { -not $ds9Set.ContainsKey($_) } | Sort-Object)
    $onlyDs9 = @($ds9Paths | Where-Object { -not $blankSet.ContainsKey($_) } | Sort-Object)
    $shared = @($blankPaths | Where-Object { $ds9Set.ContainsKey($_) } | Sort-Object)

    $lines = New-Object 'System.Collections.Generic.List[string]'
    $lines.Add('DEADSTICK-OS — NOVA 2.7.19 COMPLETE PACKAGE DIFFERENCE REVIEW')
    $lines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')")
    $lines.Add('READ-ONLY: all files were streamed from ZIP entries; nothing was extracted or changed.')
    $lines.Add('')
    $lines.Add("Blank file count: $($blankPaths.Count)")
    $lines.Add("DS9 file count:   $($ds9Paths.Count)")
    $lines.Add("Shared paths:     $($shared.Count)")
    $lines.Add("Blank-only paths: $($onlyBlank.Count)")
    $lines.Add("DS9-only paths:   $($onlyDs9.Count)")
    $lines.Add('')

    Write-Host "Comparing contents of $($shared.Count) shared files..."
    $changed = New-Object 'System.Collections.Generic.List[string]'
    $identicalCount = 0
    $changedBytes = 0
    $index = 0
    foreach ($path in $shared) {
        $index++
        if (($index % 500) -eq 0) {
            Write-Host "  Compared $index / $($shared.Count)..."
        }
        $blankHash = Get-EntrySha256 -Entry $blank.Map[$path]
        $ds9Hash = Get-EntrySha256 -Entry $ds9.Map[$path]
        if ($blankHash -eq $ds9Hash) {
            $identicalCount++
        }
        else {
            $changed.Add($path)
            $changedBytes += [Math]::Max($blank.Map[$path].Length, $ds9.Map[$path].Length)
        }
    }

    $lines.Add("Shared files with identical content: $identicalCount")
    $lines.Add("Shared files with different content: $($changed.Count)")
    $lines.Add("Approximate total bytes across changed shared files: $changedBytes")
    $lines.Add('')
    $lines.Add('=== SHARED-PATH CONTENT DIFFERENCES ===')
    if ($changed.Count -eq 0) {
        $lines.Add('Every shared path is byte-for-byte identical.')
    }
    else {
        foreach ($path in $changed) {
            $lines.Add("DIFFERENT: $path")
            $lines.Add("  Blank SHA256: $(Get-EntrySha256 -Entry $blank.Map[$path])")
            $lines.Add("  DS9 SHA256:   $(Get-EntrySha256 -Entry $ds9.Map[$path])")
            $lines.Add("  Blank bytes:  $($blank.Map[$path].Length)")
            $lines.Add("  DS9 bytes:    $($ds9.Map[$path].Length)")
        }
    }

    $lines.Add('')
    $lines.Add('=== PATHS ONLY IN BLANK ===')
    foreach ($path in $onlyBlank) { $lines.Add("BLANK ONLY: $path") }

    $lines.Add('')
    $lines.Add('=== PATHS ONLY IN DS9 ===')
    foreach ($path in $onlyDs9) { $lines.Add("DS9 ONLY: $path") }

    $lines.Add('')
    $lines.Add('=== DIFFERENCE COUNTS BY TOP-LEVEL AREA ===')
    $areaRows = @()
    foreach ($area in @('nova2/application/', 'nova2/nova/', 'nova2/system/', 'other')) {
        $b = @($onlyBlank | Where-Object {
            if ($area -eq 'other') { $_ -notmatch '^nova2/(application|nova|system)/' } else { $_.StartsWith($area) }
        }).Count
        $d = @($onlyDs9 | Where-Object {
            if ($area -eq 'other') { $_ -notmatch '^nova2/(application|nova|system)/' } else { $_.StartsWith($area) }
        }).Count
        if (($b + $d) -gt 0) {
            $lines.Add(("$area  Blank-only: {0}  DS9-only: {1}" -f $b, $d))
        }
    }

    $lines.Add('')
    $lines.Add('=== RELEVANT NOVA CONFIGURATION AND GENRE FILES ===')
    $special = @(
        'nova2/application/config/nova.php',
        'nova2/nova/modules/assets/install/genres/blank.php',
        'nova2/nova/modules/assets/install/genres/ds9.php'
    )
    foreach ($path in $special) {
        $bEntry = if ($blank.Map.ContainsKey($path)) { $blank.Map[$path] } else { $null }
        $dEntry = if ($ds9.Map.ContainsKey($path)) { $ds9.Map[$path] } else { $null }
        Add-TextFile -Lines $lines -Label "Blank: $path" -Entry $bEntry
        Add-TextFile -Lines $lines -Label "DS9: $path" -Entry $dEntry
    }

    $lines.Add('=== ASSET DIRECTORY COUNTS ===')
    foreach ($path in @(
        'nova2/application/assets/common/blank/',
        'nova2/application/assets/common/ds9/'
    )) {
        $bCount = @($blankPaths | Where-Object { $_.StartsWith($path, [StringComparison]::OrdinalIgnoreCase) }).Count
        $dCount = @($ds9Paths | Where-Object { $_.StartsWith($path, [StringComparison]::OrdinalIgnoreCase) }).Count
        $lines.Add("$path  Blank archive: $bCount  DS9 archive: $dCount")
    }

    $lines.Add('')
    $lines.Add('=== INTERPRETATION NOTES ===')
    $lines.Add('- This comparison hashes every same-path file in both archives, not only application/views.')
    $lines.Add('- Files in different directories are reported as path differences, not content differences.')
    $lines.Add('- Nova documents skins and genres as separate concepts; see https://anodyne-productions.com/docs/2.7/genres')
    $lines.Add('- Nothing in either ZIP archive is extracted, overwritten, or modified.')

    $lines | Set-Content -LiteralPath $reportPath -Encoding UTF8

    Write-Host ''
    Write-Host 'Complete package comparison finished.'
    Write-Host "Report: $reportPath"
    Write-Host "Shared paths: $($shared.Count)"
    Write-Host "Identical shared files: $identicalCount"
    Write-Host "Changed shared files: $($changed.Count)"
    Write-Host "Blank-only paths: $($onlyBlank.Count)"
    Write-Host "DS9-only paths: $($onlyDs9.Count)"
    Write-Host 'No archives were extracted or modified.'
}
finally {
    foreach ($archive in $archives) {
        if ($archive.Zip) { $archive.Zip.Dispose() }
    }
}
