[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string]$Root
)

$ErrorActionPreference = 'Stop'

$directories = @(
    'ISO/Recovery',
    'ISO/Windows',
    'ISO/Linux',
    'Tools/Hardware',
    'Tools/Storage',
    'Tools/Windows',
    'Tools/Network',
    'Tools/Recovery',
    'Tools/Benchmark',
    'Drivers/Network',
    'Drivers/Storage',
    'Drivers/AMD',
    'Drivers/NVIDIA',
    'Drivers/Intel',
    'Firmware',
    'Images',
    'Logs',
    'Scripts',
    'Docs'
)

$resolvedRoot = [System.IO.Path]::GetFullPath($Root)

if (-not (Test-Path -LiteralPath $resolvedRoot)) {
    if ($PSCmdlet.ShouldProcess($resolvedRoot, 'Create toolkit root')) {
        New-Item -ItemType Directory -Path $resolvedRoot -Force | Out-Null
    }
}

foreach ($directory in $directories) {
    $path = Join-Path $resolvedRoot $directory
    if (-not (Test-Path -LiteralPath $path)) {
        if ($PSCmdlet.ShouldProcess($path, 'Create directory')) {
            New-Item -ItemType Directory -Path $path -Force | Out-Null
        }
    }
}

Write-Host "Toolkit layout is ready at: $resolvedRoot"
Write-Host 'No disk partitioning, formatting, or bootloader changes were performed.'
