function Apache-Logs-Full {
param (

[string] $page,
[string] $statusCode,
[string] $browser
)

$logsUnformatted = Get-Content C:\xampp\apache\logs\*.log | Select-String -Pattern $page | Select-String -Pattern $statusCode | Select-String -Pattern $browser
$logsSplit = $logsUnformatted -split " "

$tableFull = @()

$tableFull += [PSCustomObject]@{
        "IP" = $logsSplit | Select-Object -index 0
        "Date/Time" = $logsSplit | Select-Object -index 3
        "Method" = $logsSplit | Select-Object -index 4
        "Request" = $logsSplit | Select-Object -index 5,6,7
        "Status Code" = $logsSplit | Select-Object -index 8
        "Browser" = $logsSplit | Select-Object -index 21
        "Referrer" = $logsSplit | Select-Object -index 10
}
return $tableFull | Where-Object { $logsSplit.IP -ilike "10.*"
}
}
Apache-Logs-Full $page $status $browser