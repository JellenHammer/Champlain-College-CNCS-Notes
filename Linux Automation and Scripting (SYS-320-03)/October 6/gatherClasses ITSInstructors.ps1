. (Join-Path $PSScriptRoot gatherClasses.ps1)
. (Join-Path $PSScriptRoot Translator.ps1)

clear
$ErrorActionPreference = "SilentlyContinue"

$FullTable = gatherClasses
$FullTable = daysTranslator $FullTable

$ITSInstructors = $FullTable | Where-Object {
($_."Class Code" -match "SYS*|NET*|SEC*|FOR*|CSI*|DAT*")} | Select-Object "Instructor" ` | Sort-Object "Instructor" -Unique 

$InstructorsITS = $ITSInstructors.Instructor 
for ($i = 0; $i -lt $InstructorsITS.Length; $i++) {
 if ($FullTable.Instructor -contains $InstructorsITS[$i]) {
    Select-Object "Instructor" | Select-Object Count,Name | Sort-Object Count -Descending
   }
}
