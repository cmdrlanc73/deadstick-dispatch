# DEADSTICK-OS: inspect Nova's actual stock skin source
# Reads skin manifests, four section templates, CSS, and JS from the Blank ZIP.
# Does not extract, modify, or rewrite the Nova archive.

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem

$archivePath = Join-Path (Join-Path $env:TEMP 'DEADSTICK-NOVA-REVIEW') 'nova-2.7.19-blank.zip'
$reportDir = 'C:\DEADSTICK-NOVA-STAGING'
$reportPath = Join-Path $reportDir 'DEADSTICK-NOVA-THEME-SOURCE.txt'

if (-not (Test-Path -LiteralPath $archivePath -PathType Leaf)) {
    throw "Blank reference archive not found: $archivePath. Run the original package inspection first."
}

New-Item -ItemType Directory -Path $reportDir -Force | Out-Null

$zip = [System.IO.Compression.ZipFile]::OpenRead($archivePath)
try {
    $prefix = 'nova2/application/views/'
    $viewEntries = @(
        $zip.Entries |
        Where-Object {
            $_.FullName.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase) -and
            -not [string]::IsNullOrWhiteSpace($_.Name)
        }
    )

    $skinNames = @(
        $viewEntries |
        ForEach-Object {
            $relative = $_.FullName.Substring($prefix.Length)
            ($relative -split '/')[0]
        } |
        Sort-Object -Unique
    )

    $lines = New-Object 'System.Collections.Generic.List[string]'
    $lines.Add('DEADSTICK-OS — NOVA 2.7.19 STOCK THEME SOURCE REVIEW')
    $lines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')")
    $lines.Add("Source: $archivePath")
    $lines.Add('READ-ONLY: selected text files streamed from the ZIP; nothing was extracted or changed.')
    $lines.Add('')
    $lines.Add("Skin/view root folders: $($skinNames -join ', ')")
    $lines.Add('')

    $includedCount = 0
    foreach ($skin in $skinNames) {
        $skinPrefix = "$prefix$skin/"
        $entries = @(
            $viewEntries |
            Where-Object { $_.FullName.StartsWith($skinPrefix, [StringComparison]::OrdinalIgnoreCase) } |
            Where-Object {
                $relative = $_.FullName.Substring($skinPrefix.Length)
                $_.Name -eq 'skin.yml' -or
                $_.Name -match '^template_(admin|login|main|wiki)\.php$' -or
                $_.Extension -in @('.css', '.js')
            } |
            Sort-Object FullName
        )

        if ($entries.Count -eq 0) { continue }

        $lines.Add(('=' * 76))
        $lines.Add("SKIN: $skin")
        $lines.Add(('=' * 76))
        $lines.Add("Selected source files: $($entries.Count)")
        $lines.Add('')

        foreach ($entry in $entries) {
            $relative = $entry.FullName.Substring($skinPrefix.Length)
            $lines.Add(('~' * 76))
            $lines.Add("FILE: $relative")
            $lines.Add("BYTES: $($entry.Length)")
            $lines.Add(('~' * 76))

            $reader = New-Object System.IO.StreamReader($entry.Open())
            try {
                $content = $reader.ReadToEnd()
            }
            finally {
                $reader.Dispose()
            }

            $contentLines = $content -split '\r?\n'
            $maxLines = 350
            $limit = [Math]::Min($contentLines.Count, $maxLines)

            for ($i = 0; $i -lt $limit; $i++) {
                $lines.Add($contentLines[$i])
            }

            if ($contentLines.Count -gt $limit) {
                $lines.Add("[TRUNCATED: $($contentLines.Count) total lines; first $maxLines shown]")
            }

            $lines.Add('')
            $includedCount++
        }
    }

    $lines | Set-Content -LiteralPath $reportPath -Encoding UTF8

    Write-Host ''
    Write-Host 'Stock theme source review complete.'
    Write-Host "Report: $reportPath"
    Write-Host "Skin folders: $($skinNames.Count)"
    Write-Host "Source files included: $includedCount"
    Write-Host 'No archives were extracted or modified.'
}
finally {
    $zip.Dispose()
}
