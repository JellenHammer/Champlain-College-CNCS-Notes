
$Prompt  = "Please choose your operation:`n"
$Prompt += "1 -Show the configuration`n"
$Prompt += "2 - Change the configuration`n"
$Prompt += "3 - Exit`n"


$operation = $true

while($operation){

 Write-Host $Prompt | Out-String
    $choice = Read-Host 

 elseif($choice -eq 2){}}