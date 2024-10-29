

function Get-Logins {
param ($days)
$logins = Get-EventLog -LogName System -Message "User Log*" -After (Get-Date).AddDays($days) 

$logintable = @()
for($i=0; $i -lt $logins.Count; $i++){
#Creating event property value
$event = ""
	if($logins[$i].InstanceID -eq "7001") {$event="Logon"}
	if($logins[$i].InstanceID -eq "7002") {$event="Logoff"}

$user_sid = $logins.ReplacementStrings[1]
$Sec_ID = New-Object System.Security.Principal.SecurityIdentifier($user_sid)
$user = $Sec_ID.Translate([System.Security.Principal.NTAccount])

$logintable += [PSCustomObject]@{
			"Time" = $logins[$i].Time
		        "ID" = $logins[$i].InstanceID
			"Event" = $event;
			"User" = $user;
			}
$logintable
			}
}

