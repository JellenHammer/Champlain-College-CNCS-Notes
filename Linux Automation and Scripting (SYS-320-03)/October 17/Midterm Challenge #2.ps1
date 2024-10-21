function Midterm-2 {


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