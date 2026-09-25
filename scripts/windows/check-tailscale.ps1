$ErrorActionPreference = 'Stop'
$tailscale = Get-Command tailscale -ErrorAction SilentlyContinue
if (-not $tailscale) { throw 'tailscale command not found' }
& $tailscale.Source status
Write-Host ''
& $tailscale.Source ip -4
