. (Join-Path $PSScriptRoot Apache Logs.ps1)
. (Join-Path $PSScriptRoot "Apache Logs (parsing)".ps1)

clear
$ErrorActionPreference = "SilentlyContinue"

Apache-Logs -page index.html -statusCode 200 -browser chrome
Apache-Logs-Full -page poop.html -statusCode 404 -browser chrome