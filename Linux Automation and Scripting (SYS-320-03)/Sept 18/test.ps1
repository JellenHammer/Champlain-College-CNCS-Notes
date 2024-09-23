. (Join-Path $PSScriptRoot event_logs.ps1)

clear
$ErrorActionPreference = "SilentlyContinue"

$loginoutsTable = Get-Logins
$loginoutsTable