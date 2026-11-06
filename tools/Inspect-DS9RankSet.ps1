# DEADSTICK-OS: exact read-only DS9 rank-set image count
# Counts PNG files in the DS9 genre's rank-set directories without extracting
# or modifying either Nova reference archive.

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem

$archivePath = Join-Path (Join-Path $env:TEMP 'DEADSTICK-NOVA-REVIEW') 'nova-2.7.19-ds9.zip'
$reportDir = 'C:\DEADSTICK-NOVA-STAGING'
$reportPath = Join-Path $reportDir 'DEADSTICK-DS9-RANKSET-COUNT.txt'
$rankRoot = 'nova2/application/assets/common/ds9/ranks/'

if (-not (Test-Path -LiteralPath $archivePath -PathType Leaf)) {
    throw "DS9 reference archive not found: $archivePath. Run the original package inspection first."
}

New-Item -ItemType Directory -Path $reportDir -Force | Out-Null

$zip = [System.IO.Compression.ZipFile]::OpenRead($archivePath)
try {
    $rankEntries = @(
        $zip.Entries |
        Where-Object {
            $_.FullName.StartsWith($rankRoot, [StringComparison]::OrdinalIgnoreCase) -and
            -not [string]::IsNullOrWhiteSpace($_.Name)
        }
    )

    $pngEntries = @($rankEntries | Where-Object { $_.Extension -ieq '.png' })
    $sets = @(
        $rankEntries |
        ForEach-Object {
            $relative = $_.FullName.Substring($rankRoot.Length)
            ($relative -split '/')[0]
        } |
        Where-Object { $_ } |
        Sort-Object -Unique
    )

    $lines = New-Object 'System.Collections.Generic.List[string]'
    $lines.Add('DEADSTICK-OS — DS9 RANK SET IMAGE COUNT')
    $lines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')")
    $lines.Add("Source: $archivePath")
    $lines.Add('READ-ONLY: ZIP entries were inspected in place; nothing was extracted or changed.')
    $lines.Add('')
    $lines.Add("Total files under DS9 ranks/: $($rankEntries.Count)")
    $lines.Add("Total PNG files under DS9 ranks/: $($pngEntries.Count)")
    $lines.Add("Rank-set directories: $($sets -join ', ')")
    $lines.Add('')

    foreach ($set in $sets) {
        $setPrefix = "$rankRoot$set/"
        $setFiles = @($rankEntries | Where-Object { $_.FullName.StartsWith($setPrefix, [StringComparison]::OrdinalIgnoreCase) })
        $setPngs = @($setFiles | Where-Object { $_.Extension -ieq '.png' })
        $lines.Add("=== Rank set: $set ===")
        $lines.Add("Files: $($setFiles.Count)")
        $lines.Add("PNG images: $($setPngs.Count)")
        foreach ($entry in ($setPngs | Sort-Object FullName)) {
            $lines.Add(("  {0}  [{1} bytes]" -f $entry.Name, $entry.Length))
        }

        $manifest = $setFiles | Where-Object { $_.Name -ieq 'rank.yml' } | Select-Object -First 1
        if ($manifest) {
            $lines.Add('  --- rank.yml ---')
            $reader = New-Object System.IO.StreamReader($manifest.Open())
            try {
                foreach ($line in ($reader.ReadToEnd() -split '\r?\n')) {
                    $lines.Add("  $line")
                }
            }
            finally {
                $reader.Dispose()
            }
        }
        $lines.Add('')
    }

    $lines | Set-Content -LiteralPath $reportPath -Encoding UTF8

    Write-Host ''
    Write-Host 'DS9 rank-set count complete.'
    Write-Host "Rank PNGs: $($pngEntries.Count)"
    Write-Host "Report: $reportPath"
    Write-Host 'No archives were extracted or modified.'
}
finally {
    $zip.Dispose()
}
