
function Get-Events {
$instance_id_1 = "15"
$instance_id_2 = "16"
$events_1 = Get-EventLog -LogName System -InstanceID "15"
$events_2 = Get-EventLog -LogName System -InstanceID "16"
$eventtable = @()
for($i=0; $i -lt $events.Count; $i++){
#Creating event property value
$eventtype = ""
	if($events_1[$i].InstanceID -eq "15") {$events_1="TPM"}
	if($events_2[$i].InstanceID -eq "16") {$events_2="Update"}
 
$user = "System"

$eventtable += [PSCustomObject]@{
			"Time" = $events[$i].Time
			"ID" = $events[$i].InstanceID
			"Event" = $eventtype;
			"User" = $user;
			}
}
$eventtable 
}