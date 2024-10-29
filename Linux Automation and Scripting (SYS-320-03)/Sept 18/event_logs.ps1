function RiskUsers() {
#Not fully functional but I couldn't figure out how to get it to enumerate all users
param ($days)
$logins = Get-EventLog -LogName Security -InstanceID 4625 -After (Get-Date).AddDays($days) | Group-Object -property UserName | Where-Object {$_.Count -gt 1}
$logintable = @()
$user = $logins.ReplacementStrings[1] 
$logintable += [PSCustomObject]@{
			
			"At Risk" = "Yes"
			"User" = $user;
			}

}
$logintable