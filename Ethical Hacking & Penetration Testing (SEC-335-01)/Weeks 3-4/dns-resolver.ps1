function dns-resolver {
param (
[Parameter(Mandatory=$True)]
[string]$Subnet, # Subnet Format = "184.171.146."
[String]$DNS = 216.93.145.253)

[String]1..255 | ForEach-Object {

$DNSForward = Resolve-DNSName -DNSOnly ($Subnet + $_) -Server $DNS -ErrorAction Ignore
$DNSReverse = Resolve-DNSName -DNSOnly ($DNSForward.NameHost) -Server $DNS -ErrorAction Ignore
Write-Host ($DNSReverse.IPAddress, $DNSForward.NameHost)
}
}
