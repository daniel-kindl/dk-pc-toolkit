[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Root,

    [string]$OutputPath
)

$ErrorActionPreference = 'Stop'
$resolvedRoot = [System.IO.Path]::GetFullPath($Root)

if (-not (Test-Path -LiteralPath $resolvedRoot)) {
    throw "Toolkit root does not exist: $resolvedRoot"
}

if (-not $OutputPath) {
    $OutputPath = Join-Path $resolvedRoot 'Logs/toolkit-inventory.json'
}

$files = Get-ChildItem -LiteralPath $resolvedRoot -File -Recurse | ForEach-Object {
    $relativePath = [System.IO.Path]::GetRelativePath($resolvedRoot, $_.FullName)
    $hash = Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256

    [PSCustomObject]@{
        path = $relativePath.Replace('\\', '/')
        sizeBytes = $_.Length
        sha256 = $hash.Hash.ToLowerInvariant()
        modifiedUtc = $_.LastWriteTimeUtc.ToString('o')
    }
}

$inventory = [PSCustomObject]@{
    schemaVersion = 1
    generatedUtc = (Get-Date).ToUniversalTime().ToString('o')
    root = $resolvedRoot
    fileCount = @($files).Count
    files = @($files)
}

$outputDirectory = Split-Path -Parent $OutputPath
if ($outputDirectory) {
    New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
}

$inventory | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath $OutputPath -Encoding UTF8
Write-Host "Inventory written to: $OutputPath"
