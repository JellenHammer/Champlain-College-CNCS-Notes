. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot String-Helper.ps1)
. (Join-Path $PSScriptRoot ["Apache Logs (parsing)".ps1])


clear

$Prompt  = "Please choose your operation:`n"
$Prompt += "1 - Display the last 10 Apache logs`n"
$Prompt += "2 - Display the last 10 failed logins for all users`n"
$Prompt += "3 - Start Chrome / Navigate to Champlain.edu`n"
$Prompt += "4 - Display at risk users`n"
$Prompt += "5 - Exit`n"


$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 
    

 if($choice -eq 0){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
        Write-Host "Please enter your html page"
        $promptHTML = Read-Host
        Write-Host "Please enter your status code"
        $promptSTATUS = Read-Host
        Write-Host "Please enter your browser"
        $Browser = Read-Host
        Write-Host | Apache-Logs -page $promptHTML -statusCode $promptSTATUS -browser $Browser
        }
    }