[CmdletBinding()]
param(
    [string]$InstallRoot = "$env:ProgramFiles\Sunshine",
    [int]$WebPort = 47990
)

$ErrorActionPreference = 'Stop'
$exe = Join-Path $InstallRoot 'sunshine.exe'

Write-Host "Install root: $InstallRoot"
if (Test-Path $exe) {
    $item = Get-Item $exe
    Write-Host "sunshine.exe: found ($([math]::Round($item.Length / 1MB, 1)) MB)"
} else {
    Write-Warning "sunshine.exe not found"
}

$services = Get-Service -ErrorAction SilentlyContinue | Where-Object {
    $_.Name -match 'sunshine' -or $_.DisplayName -match 'sunshine'
}
if ($services) {
    $services | Select-Object Name, Status, StartType | Format-Table -AutoSize
} else {
    Write-Warning 'No Sunshine service found; it may be running as a user process.'
}

$uri = "https://127.0.0.1:$WebPort/"
try {
    $response = Invoke-WebRequest -Uri $uri -SkipCertificateCheck -TimeoutSec 5
    Write-Host "Web UI: HTTP $($response.StatusCode)"
} catch {
    Write-Warning "Web UI check failed: $($_.Exception.Message)"
}
