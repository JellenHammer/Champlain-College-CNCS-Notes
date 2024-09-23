$logins = Get-EventLog -LogName System -Message "User Log*"


$logintable = @()
for($i=0; $i -lt $logins.Count; $i++){
#Creating event property value
$event = ""
	if($logins[$i].InstanceID -eq "7001") {$event="Logon"}
	if($logins[$i].InstanceID -eq "7002") {$event="Logoff"}
 
$user = $logins[$i].ReplacementStrings[1]
$logintable += [PSCustomObject]@{
			
# Time is no longer working for some odd reason.
			"Time" = $logins[$i].Time
			"ID" = $logins[$i].InstanceID
			"Event" = $event;
			"User" = $user;
			}
}

$logintable