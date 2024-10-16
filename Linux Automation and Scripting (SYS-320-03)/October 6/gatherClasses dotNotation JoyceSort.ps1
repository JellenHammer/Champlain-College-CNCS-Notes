. (Join-Path $PSScriptRoot gatherClasses.ps1)
. (Join-Path $PSScriptRoot Translator.ps1)

clear
$ErrorActionPreference = "SilentlyContinue"

$FullTable = gatherClasses
$FullTable = daysTranslator $FullTable

$FullTable | Where-Object {($_.Location -ilike "JOYC 310") -and ($_.days -contains "Monday") } | 
Sort-Object "Time Start" | ` Select-Object "Time Start", "Time End", "Class Code"