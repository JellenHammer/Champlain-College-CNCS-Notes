. (Join-Path $PSScriptRoot Apache-Logs.ps1)
. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot Event-Logs-Full.ps1)
. (Join-Path $PSScriptRoot String-Helper.ps1)

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
   
    if($choice -eq 1){

        $LogsUnformat = Get-Content 'C:\Users\champuser\CNCS-Tech-Portfolio\Linux Automation and Scripting (SYS-320-03)\October 17\access.log'
        $tableFull = @()

        for($i=0; $i -lt $LogsUnformat.Count; $i++){

        $line = $LogsUnformat[$i] -split " "

        <#$IP =  $lines[$i] -split " " | Select-Object -index 0
        $TIME =  $lines[$i] -split " " | Select-Object -index 3
        $METHOD =  $lines[$i] -split " " | Select-Object -index 4
        $REQUEST =  $lines[$i] -split " " | Select-Object -index 5,6,7
        $STATUS =  $lines[$i] -split " " | Select-Object -index 8
        $BROWSER =  $lines[$i] -split " " | Select-Object -index 18
        $REFERRER =  $lines[$i] -split " " | Select-Object -index 10#>
        

        $tableFull += [PSCustomObject]@{
                "IP" =  $line | Select-Object -index 0
                "Date/Time" =  $line | Select-Object -index 3
                "Method" =  $line | Select-Object -index 4
                "Request" =  $line | Select-Object -index 5, 6, 7
                "Status Code" =  $line | Select-Object -index 8
                "Browser" =  $line | Select-Object -index 18
                "Referrer" =  $line | Select-Object -index 10
        }
        }
        
return $tableFull | Format-Table
}
        

    elseif($choice -eq 2){
    # Need administrator access when running
        $name = Read-Host -Prompt "Please enter the username for the user's failed login logs"
        $chkUser = checkUser $name
            if($chkUser -ne $false){
            # TODO: Check the given username with the checkUser function.
            $timeSince = Read-Host -Prompt "Please enter the number of days to search back."
            $userLogins = getFailedLogins $timeSince
            # TODO: Change the above line in a way that, the days 90 should be taken from the user

            Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
        }
    }

     elseif($choice -eq 3){
         if (Get-Process -Name "chrome" -ErrorAction SilentlyContinue) {
            # SilentlyContinue continues the script without any error message in the case that Chrome is not open.
            echo "Stopping Google Chrome"
            Stop-Process -Name "chrome"
            }
       
        
         else {
            echo "Starting Google Chrome"
            Start-Process "C:\Program Files\Google\Chrome\Application\chrome.exe" "https://champlain.edu"
              }
        }

     elseif($choice -eq 4){
        $chkUser = checkUser $name
        if($chkUser -ne $false){
        # TODO: Check the given username with the checkUser function.
        $timeSince = Read-Host -Prompt "Please enter the number of days to search back."
        $userLogins = getFailedLogins $timeSince
        # TODO: Change the above line in a way that, the days 90 should be taken from the user

        Write-Host ($userLogins| Format-Table | Out-String) | Where-Object {$_.Count -gt 2 | Group-Object -Property User}
            }
            }

       elseif($choice -eq 5){
            Write-Host "Goodbye" | Out-String
            exit
            $operation = $false 
        }
      elseif($choice -ne 1..5){
      Write-Host "Please enter a valid input."
      }
      }
