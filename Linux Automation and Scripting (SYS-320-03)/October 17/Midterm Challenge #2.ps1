function Midterm-2 {


$LogsUnformat = Get-Content 'C:\Users\champuser\CNCS-Tech-Portfolio\Linux Automation and Scripting (SYS-320-03)\October 17\access.log'
$tableFull = @()

for($i=0; $i -lt $LogsUnformat.Count; $i++){

$line = $LogsUnformat[$i] -split " "
        

$tableFull += [PSCustomObject]@{
        "IP" =  $line | Select-Object -index 0
        "Date/Time" =  $line | Select-Object -index 3
        "Method" =  $line | Select-Object -index 4
        "Request" =  $line | Select-Object -index 5, 7
        "Page" = $line | Select-Object -index 6
        "Status Code" =  $line | Select-Object -index 8
        "Browser" =  $line | Select-Object -index 18
        "Referrer" =  $line | Select-Object -index 10
}
}

return $tableFull | Format-Table
}