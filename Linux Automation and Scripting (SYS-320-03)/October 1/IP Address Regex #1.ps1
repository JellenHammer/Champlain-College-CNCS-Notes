$notfounds = Get-Content C:\xampp\apache\logs\*.log | Select-String -Pattern ' 404'

$regex = [regex] "\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b"
$ipsUnorganized = $regex.Matches($notfounds)

$ips  = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [PSCustomObject]@{ "IP" = $ipsUnorganized -replace '[0-9]'.Value; }
    }
    $ipsoften = $ips | Where-Object { $_.IP -ilike "10.*" }
    $counts = $ipsoften | measure
    $counts | Select-Object Count, Name