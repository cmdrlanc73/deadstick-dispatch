# DEADSTICK-OS: focused Nova skin and theme comparison
# Reads the existing Blank and DS9 ZIP archives without extracting or modifying them.
# Produces a skin-specific report for deciding the visual theme implementation scope.

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem

$work = Join-Path $env:TEMP 'DEADSTICK-NOVA-REVIEW'
$reportDir = 'C:\DEADSTICK-NOVA-STAGING'
$reportPath = Join-Path $reportDir 'DEADSTICK-NOVA-SKIN-REVIEW.txt'

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

function Get-NormalizedEntryMap {
    param([System.IO.Compression.ZipArchive]$Zip)

    $map = @{}
    foreach ($entry in $Zip.Entries) {
        $name = $entry.FullName.Replace('\', '/').TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($name) -or $name.EndsWith('/')) {
            continue
        }
        $map[$name] = $entry
    }
    return ,$map
}

function Get-EntrySha256 {
    param([System.IO.Compression.ZipArchiveEntry]$Entry)

    $stream = $Entry.Open()
    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        $bytes = $sha.ComputeHash($stream)
        return ([System.BitConverter]::ToString($bytes)).Replace('-', '')
    }
    finally {
        $sha.Dispose()
        $stream.Dispose()
    }
}

function Add-Section {
    param(
        [System.Collections.Generic.List[string]]$Lines,
        [string]$Heading
    )
    $Lines.Add('')
    $Lines.Add(('=' * 72))
    $Lines.Add($Heading)
    $Lines.Add(('=' * 72))
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
            Map = (Get-NormalizedEntryMap -Zip $zip)
        }
    }

    $lines = New-Object 'System.Collections.Generic.List[string]'
    $lines.Add('DEADSTICK-OS — NOVA 2.7.19 SKIN / THEME REVIEW')
    $lines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')")
    $lines.Add('READ-ONLY: ZIP contents were streamed in place; nothing was extracted or changed.')
    $lines.Add('')

    foreach ($archive in $archives) {
        $lines.Add("=== $($archive.Name) ===")
        $lines.Add("Archive: $($archive.Path)")
        $lines.Add("Files: $($archive.Map.Count)")

        $viewPrefix = 'nova2/application/views/'
        $viewFiles = @($archive.Map.Keys | Where-Object { $_.StartsWith($viewPrefix, [StringComparison]::OrdinalIgnoreCase) } | Sort-Object)
        $skinNames = @(
            $viewFiles |
            ForEach-Object {
                $relative = $_.Substring($viewPrefix.Length)
                ($relative -split '/')[0]
            } |
            Sort-Object -Unique
        )

        $lines.Add("Skin directories: $($skinNames -join ', ')")
        foreach ($skinName in $skinNames) {
            $skinPrefix = "$viewPrefix$skinName/"
            $skinFiles = @($viewFiles | Where-Object { $_.StartsWith($skinPrefix, [StringComparison]::OrdinalIgnoreCase) })
            $rootFiles = @(
                $skinFiles |
                ForEach-Object { $_.Substring($skinPrefix.Length) } |
                Where-Object { $_ -notmatch '/' } |
                Sort-Object
            )
            $sectionNames = @(
                $skinFiles |
                ForEach-Object {
                    $relative = $_.Substring($skinPrefix.Length)
                    if ($relative -match '/') { ($relative -split '/')[0] }
                } |
                Where-Object { $_ } |
                Sort-Object -Unique
            )

            $lines.Add("  Skin: $skinName")
            $lines.Add("    Files: $($skinFiles.Count)")
            $lines.Add("    Section/subfolders: $($sectionNames -join ', ')")
            $lines.Add("    Root files: $($rootFiles -join ', ')")

            $skinYmlPath = "$skinPrefix" + 'skin.yml'
            if ($archive.Map.ContainsKey($skinYmlPath)) {
                $lines.Add('    --- skin.yml ---')
                $reader = New-Object System.IO.StreamReader($archive.Map[$skinYmlPath].Open())
                try {
                    foreach ($line in ($reader.ReadToEnd() -split '\r?\n')) {
                        $lines.Add("      $line")
                    }
                }
                finally {
                    $reader.Dispose()
                }
            }
        }

        $lines.Add('')
        $lines.Add('  View file inventory (relative paths):')
        foreach ($viewFile in $viewFiles) {
            $relative = $viewFile.Substring($viewPrefix.Length)
            $length = $archive.Map[$viewFile].Length
            $lines.Add(("    {0}  [{1} bytes]" -f $relative, $length))
        }

        foreach ($assetName in @('blank', 'ds9')) {
            $assetPrefix = "nova2/application/assets/common/$assetName/"
            $assetFiles = @($archive.Map.Keys | Where-Object { $_.StartsWith($assetPrefix, [StringComparison]::OrdinalIgnoreCase) })
            $lines.Add("  Common asset set '$assetName': $($assetFiles.Count) files")
        }
    }

    $blank = $archives | Where-Object Name -eq 'Blank' | Select-Object -First 1
    $ds9 = $archives | Where-Object Name -eq 'DS9' | Select-Object -First 1

    Add-Section -Lines $lines -Heading 'SKIN PATH COMPARISON'
    $blankViews = @($blank.Map.Keys | Where-Object { $_.StartsWith('nova2/application/views/', [StringComparison]::OrdinalIgnoreCase) })
    $ds9Views = @($ds9.Map.Keys | Where-Object { $_.StartsWith('nova2/application/views/', [StringComparison]::OrdinalIgnoreCase) })
    $blankViewSet = @{}
    $ds9ViewSet = @{}
    foreach ($path in $blankViews) { $blankViewSet[$path] = $true }
    foreach ($path in $ds9Views) { $ds9ViewSet[$path] = $true }

    $onlyBlankViews = @($blankViews | Where-Object { -not $ds9ViewSet.ContainsKey($_) } | Sort-Object)
    $onlyDs9Views = @($ds9Views | Where-Object { -not $blankViewSet.ContainsKey($_) } | Sort-Object)
    $sharedViews = @($blankViews | Where-Object { $ds9ViewSet.ContainsKey($_) } | Sort-Object)

    $lines.Add("Blank skin/view files: $($blankViews.Count)")
    $lines.Add("DS9 skin/view files:   $($ds9Views.Count)")
    $lines.Add("View paths only in Blank: $($onlyBlankViews.Count)")
    foreach ($path in $onlyBlankViews) { $lines.Add("  BLANK ONLY  $path") }
    $lines.Add("View paths only in DS9: $($onlyDs9Views.Count)")
    foreach ($path in $onlyDs9Views) { $lines.Add("  DS9 ONLY    $path") }

    Add-Section -Lines $lines -Heading 'SHARED SKIN FILE CONTENT COMPARISON'
    $changedViews = @()
    $sameViews = 0
    foreach ($path in $sharedViews) {
        $blankHash = Get-EntrySha256 -Entry $blank.Map[$path]
        $ds9Hash = Get-EntrySha256 -Entry $ds9.Map[$path]
        if ($blankHash -eq $ds9Hash) {
            $sameViews++
        }
        else {
            $changedViews += $path
            $lines.Add("CONTENT DIFFERS  $path")
            $lines.Add("  Blank SHA256: $blankHash")
            $lines.Add("  DS9 SHA256:   $ds9Hash")
        }
    }
    $lines.Add("Shared view files with identical content: $sameViews")
    $lines.Add("Shared view files with different content: $($changedViews.Count)")
    if ($changedViews.Count -eq 0) {
        $lines.Add('All shared application/views files are byte-for-byte identical.')
    }

    Add-Section -Lines $lines -Heading 'COMMON THEME / GENRE ASSET PATHS'
    foreach ($assetName in @('blank', 'ds9')) {
        $assetPrefix = "nova2/application/assets/common/$assetName/"
        $blankAssets = @($blank.Map.Keys | Where-Object { $_.StartsWith($assetPrefix, [StringComparison]::OrdinalIgnoreCase) } | Sort-Object)
        $ds9Assets = @($ds9.Map.Keys | Where-Object { $_.StartsWith($assetPrefix, [StringComparison]::OrdinalIgnoreCase) } | Sort-Object)
        $lines.Add("Asset set: $assetName")
        $lines.Add("  Blank archive: $($blankAssets.Count) files")
        $lines.Add("  DS9 archive:   $($ds9Assets.Count) files")
    }

    Add-Section -Lines $lines -Heading 'INTERPRETATION GUARDRAILS'
    $lines.Add('- This report distinguishes Nova skin/view files from common genre/theme assets.')
    $lines.Add('- A matching path is not assumed to have matching content; shared view files are SHA-256 compared.')
    $lines.Add('- The report does not infer application behavior from filenames.')
    $lines.Add('- Nothing in either ZIP archive is extracted, overwritten, or modified.')

    $lines | Set-Content -LiteralPath $reportPath -Encoding UTF8

    Write-Host ''
    Write-Host 'Focused skin comparison complete.'
    Write-Host "Report: $reportPath"
    Write-Host "Blank view files: $($blankViews.Count)"
    Write-Host "DS9 view files:   $($ds9Views.Count)"
    Write-Host "Shared view content differences: $($changedViews.Count)"
    Write-Host 'No archives were extracted or modified.'
}
finally {
    foreach ($archive in $archives) {
        if ($archive.Zip) { $archive.Zip.Dispose() }
    }
}
