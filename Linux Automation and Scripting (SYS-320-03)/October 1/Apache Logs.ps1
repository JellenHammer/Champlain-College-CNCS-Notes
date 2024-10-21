function Apache-Logs {
param (

[string] $page,
[string] $statusCode,
[string] $browser
)

$notfounds = Get-Content 'C:\Users\champuser\CNCS-Tech-Portfolio\Linux Automation and Scripting (SYS-320-03)\October 17\access.log'
$notfounds2 = $notfounds -split " "
$tableFull = @()
$tableFull += [PSCustomObject]@{
        "IP" = $notfounds2 | Select-Object -index 0
        "Date" = $notfounds2 | Select-Object -index 3
        "Request" = $notfounds2 | Select-Object -index 5,6,7
        "Status Code" = $notfounds2 | Select-Object -index 8
        "Browser" = $notfounds2 | Select-Object -index 21
}
 $tableFull | Format-Table

$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
$IP_ADDR = $notfounds2 | Select-Object -index 0
$ipsUnorganized = $regex.Matches($IP_ADDR)

$ips  = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [PSCustomObject]@{ "IP" = $ipsUnorganized -replace '[0-9]'.Value; }
    }
    $ipsoften = $ips | Where-Object { $_.IP -ilike "10.*" }
    $counts = $ipsoften | measure
    $counts | Select-Object Count
}
 Apache-Logs