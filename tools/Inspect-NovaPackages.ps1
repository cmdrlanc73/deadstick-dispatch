# DEADSTICK-OS: read-only Nova package inspection
# Downloads the two reference archives to TEMP, reads ZIP entries without extracting
# them, and writes a comparison report to the staging directory.
# No application files, services, or existing archives are modified.

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem

$repo = 'https://raw.githubusercontent.com/cmdrlanc73/deadstick-dispatch/main'
$work = Join-Path $env:TEMP 'DEADSTICK-NOVA-REVIEW'
$reportDir = 'C:\DEADSTICK-NOVA-STAGING'
$reportPath = Join-Path $reportDir 'DEADSTICK-NOVA-PACKAGE-REVIEW.txt'

New-Item -ItemType Directory -Path $work -Force | Out-Null
New-Item -ItemType Directory -Path $reportDir -Force | Out-Null

$packages = @(
    @{ Name = 'Blank'; File = 'nova-2.7.19-blank.zip'; Url = "$repo/nova-2.7.19-blank.zip" },
    @{ Name = 'DS9';   File = 'nova-2.7.19-ds9.zip';    Url = "$repo/nova-2.7.19-ds9.zip" }
)

$archives = @()
foreach ($package in $packages) {
    $path = Join-Path $work $package.File
    if (-not (Test-Path -LiteralPath $path)) {
        Write-Host "Downloading $($package.Name) reference package..."
        Invoke-WebRequest -Uri $package.Url -OutFile $path -UseBasicParsing
    }

    $file = Get-Item -LiteralPath $path
    $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash
    $zip = [System.IO.Compression.ZipFile]::OpenRead($path)
    $entries = @($zip.Entries | Where-Object { $_.Name -ne '' } | Sort-Object FullName)
    $archives += [pscustomobject]@{
        Name = $package.Name
        Path = $path
        Size = $file.Length
        SHA256 = $hash
        Zip = $zip
        Entries = $entries
    }
}

try {
    $lines = [System.Collections.Generic.List[string]]::new()
    $lines.Add('DEADSTICK-OS — NOVA 2.7.19 PACKAGE REVIEW')
    $lines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')")
    $lines.Add('READ-ONLY: archives were inspected in place; nothing was extracted or changed.')
    $lines.Add('')

    foreach ($archive in $archives) {
        $uncompressed = ($archive.Entries | Measure-Object -Property Length -Sum).Sum
        $lines.Add("=== $($archive.Name) ===")
        $lines.Add("Archive: $($archive.Path)")
        $lines.Add("Compressed bytes: $($archive.Size)")
        $lines.Add("Uncompressed bytes: $uncompressed")
        $lines.Add("Files: $($archive.Entries.Count)")
        $lines.Add("SHA256: $($archive.SHA256)")
        $roots = $archive.Entries | ForEach-Object { ($_.FullName -split '/')[0] } | Sort-Object -Unique
        $lines.Add("Top-level entries: $($roots -join ', ')")
        $lines.Add('')

        $lines.Add('-- Application and framework directory counts --')
        foreach ($prefix in @('application/', 'nova/modules/', 'nova/ci/')) {
            $count = @($archive.Entries | Where-Object { $_.FullName.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase) }).Count
            $lines.Add("$prefix $count files")
        }
        $lines.Add('')

        $lines.Add('-- Important source files --')
        $wanted = @(
            'composer.json',
            'composer.lock',
            'application/config/routes.php',
            'application/config/nova_extensions.php',
            'application/config/nova_module.php',
            'application/controllers/Install.php',
            'nova/modules/core/controllers/nova_install.php',
            'application/config/config.php'
        )
        foreach ($name in $wanted) {
            $entry = $archive.Entries | Where-Object { $_.FullName -match ("(^|/)" + [regex]::Escape($name) + '$') } | Select-Object -First 1
            if ($entry) {
                $lines.Add("--- $($entry.FullName) ---")
                $reader = [System.IO.StreamReader]::new($entry.Open())
                try {
                    $text = $reader.ReadToEnd()
                    $contentLines = $text -split "`r?`n"
                    $limit = [Math]::Min($contentLines.Count, 180)
                    for ($i = 0; $i -lt $limit; $i++) { $lines.Add($contentLines[$i]) }
                    if ($contentLines.Count -gt $limit) { $lines.Add("[TRUNCATED: $($contentLines.Count) total lines]") }
                } finally { $reader.Dispose() }
                $lines.Add('')
            } else {
                $lines.Add("MISSING: $name")
            }
        }

        $lines.Add('-- Module and extension directory paths --')
        $paths = $archive.Entries | Where-Object {
            $_.FullName -match '(^|/)(modules|extensions)/' -or
            $_.FullName -match '(^|/)views/[^/]+/skin\.yml$'
        } | ForEach-Object { $_.FullName } | Select-Object -First 250
        foreach ($pathName in $paths) { $lines.Add($pathName) }
        $lines.Add('')
    }

    $blankPaths = @($archives[0].Entries | ForEach-Object { $_.FullName })
    $ds9Paths = @($archives[1].Entries | ForEach-Object { $_.FullName })
    $blankSet = [System.Collections.Generic.HashSet[string]]::new([string[]]$blankPaths, [StringComparer]::OrdinalIgnoreCase)
    $ds9Set = [System.Collections.Generic.HashSet[string]]::new([string[]]$ds9Paths, [StringComparer]::OrdinalIgnoreCase)

    $lines.Add('=== ARCHIVE PATH COMPARISON ===')
    $onlyBlank = @($blankPaths | Where-Object { -not $ds9Set.Contains($_) })
    $onlyDs9 = @($ds9Paths | Where-Object { -not $blankSet.Contains($_) })
    $lines.Add("Only in Blank: $($onlyBlank.Count) paths")
    $onlyBlank | Select-Object -First 300 | ForEach-Object { $lines.Add("  BLANK  $_") }
    $lines.Add("Only in DS9: $($onlyDs9.Count) paths")
    $onlyDs9 | Select-Object -First 300 | ForEach-Object { $lines.Add("  DS9    $_") }

    $lines | Set-Content -LiteralPath $reportPath -Encoding UTF8
    Write-Host ''
    Write-Host 'Inspection complete.'
    Write-Host "Report: $reportPath"
    Write-Host "Blank files: $($archives[0].Entries.Count)"
    Write-Host "DS9 files:   $($archives[1].Entries.Count)"
    Write-Host 'No archives were extracted or modified.'
}
finally {
    foreach ($archive in $archives) {
        if ($archive.Zip) { $archive.Zip.Dispose() }
    }
}
