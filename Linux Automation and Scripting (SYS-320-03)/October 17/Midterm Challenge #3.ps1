function Midterm-3 {

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


$Webreq = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.5/IOC.html
$trs = $Webreq.ParsedHTML.body.getElementsByTagName("tr")
$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){
    $tds0 = $trs[0].getElementsByTagName("td")
    $tds1 = $trs[1].getElementsByTagName("td")
    $tds2 = $trs[2].getElementsByTagName("td")
    $tds3 = $trs[3].getElementsByTagName("td")
    $tds4 = $trs[4].getElementsByTagName("td")
    $tds5 = $trs[5].getElementsByTagName("td")
    $tds6 = $trs[6].getElementsByTagName("td")
    $Pattern = $tds0[0].innerText, $tds1[0].innerText, $tds2[0].innerText, $tds3[0].innerText,$tds4[0].innerText, $tds5[0].innerText, $tds6[0].innerText
    $Explanation = $tds0[1].innerText, $tds1[1].innerText, $tds2[1].innerText, $tds3[1].innerText,$tds4[1].innerText, $tds5[1].innerText, $tds6[1].innerText

    $FullTable += [PSCustomObject]@{
                                    "Pattern" = $Pattern[$i]
                                    "Explanation" = $Explanation[$i]
                                   }
            }                    
foreach($term in $FullTable){
    return $tableFull | Where-Object -Contains $term | Format-Table
}
}