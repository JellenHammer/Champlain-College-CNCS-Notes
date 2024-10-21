. (Join-Path $PSScriptRoot gatherClasses.ps1)
. (Join-Path $PSScriptRoot Translator.ps1)

clear
$ErrorActionPreference = "SilentlyContinue"

$FullTable = gatherClasses
$FullTable = daysTranslator $FullTable

$ITSInstructors = $FullTable | Where-Object {
($_."Class Code" -match "SYS*|NET*|SEC*|FOR*|CSI*|DAT*")} | Select-Object "Instructor" ` | Sort-Object "Instructor" -Unique 

$InstructorsITS = $ITSInstructors.Instructor 

$FullTable | Count {$_.Instructor -in $InstructorsITS} `
| Group-Object "Instructor" | Select-Object Count,Name | Sort-Object Count -Descending


