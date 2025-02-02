Function dhcp-check {

# This script is meant for systems with only one Ethernet adapter, like the SYS265 Workstation VM. Not necessarily meant for systems with WiFi adapters.


# Writing intro text..

Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -ForegroundColor DarkYellow
Write-Host "Fetching requested information..."
Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -ForegroundColor Yellow

# Writing text for phase one (Host information)..

Write-Host "General Host Information"
Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -ForegroundColor Yellow

# Defining variables for phase one.

# Silencing any line that causes an error (eg. checking the domain)

$ErrorActionPreference = "SilentlyContinue"

$Hostname = [Environment]::MachineName.ToLower()
$Domain = $env:USERDNSDOMAIN.ToLower() 
$Username = [Environment]::Username.ToLower()



If ($Domain -eq $null) { $Domain = "N/A"}

# Defining variables and logic for phase two.

$InterfaceAlias = ((Get-NetAdapter) | Where-Object { $_.Name -like 'Ethernet*' }).Name
$InterfaceStatus = ((Get-NetAdapter) | Where-Object { $_.Name -like 'Ethernet*' }).Status

If ($InterfaceStatus -eq "Disabled") {
    $InterfaceIPv4 = "N/A"
    $CIDR = "N/A"
    $Mask = "N/A"
    $InterfaceGateway = "N/A"
    $InterfaceDNS = "N/A"
    $DHCP = "N/A"
    $DHCPServer = "N/A"
    $DHCPLeaseEnd = "N/A"
}

Else {

$InterfaceIPv4 = (Get-NetIpAddress -InterfaceAlias $InterfaceAlias | Where-Object {$_.AddressFamily -eq 'IPv4'}).IPAddress

# Defining CIDR

[Int32]$CIDR = ((Get-NetIpAddress -InterfaceAlias $InterfaceAlias) | Where-Object {$_.AddressFamily -eq 'IPv4'}).PrefixLength

# Calculating Subnet Mask

$Mask = ([ipaddress](4gb-[math]::Pow(2,32-$CIDR))).ipaddresstostring

$InterfaceGateway = (Get-NetIPConfiguration -InterfaceAlias $InterfaceAlias).IPv4DefaultGateway.NextHop
$InterfaceDNS = (Get-DnsClientServerAddress -InterfaceAlias $InterfaceAlias).ServerAddresses


#DHCP Specific

# Checking whether interface is using DHCP or not.

If ((Get-NetIPInterface -InterfaceAlias $InterfaceAlias).DHCP -eq "Enabled") {$DHCP = "Yes, DHCP Configuration"} else {$DHCP = "No, Static Configuration"}
# Getting DHCP lease times and converting to a more readable format.

If ($DHCP -like "Yes*"){
    $DHCPServer = ((Get-CimInstance Win32_NetworkAdapterConfiguration).DHCPServer |  Out-String).Trim()
    $DHCPLeaseEnd = ((Get-NetIPAddress -InterfaceAlias $InterfaceAlias) | Where-Object {$_.AddressFamily -eq 'IPv4'}).ValidLifeTime
    $DHCPLeaseEnd = (Get-Date).addticks($DHCPLeaseEnd.ticks)
}
}
# Defining PSCustomObject List for General Host Information

$HostInfo = @()
$HostInfo += [PSCustomObject]@{
"Hostname" = ($Hostname)
"User Account" = ($Username)
"User Domain" = ($Domain) 
}

Write-Host ($HostInfo | Format-List | Out-String).Trim()

#Writing text for phase two..

Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -ForegroundColor Yellow
Write-Host "Interface Configuration"
Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -ForegroundColor Yellow

# Defining a PSCustomObject List for the Interface Configuration


$InterfaceConfig = @()
$InterfaceConfig += [PSCustomObject]@{
"Interface Name" = ($InterfaceAlias)
"Interface Status" = ($InterfaceStatus)
"IP Address" = ($InterfaceIPv4)
"Subnet Mask" = ($Mask)
"CIDR" = ($CIDR)
"Default Gateway" = ($InterfaceGateway)
"DNS" = ($InterfaceDNS)
"Using DHCP?" = ($DHCP)
"DHCP Server" = ($DHCPServer)
"Lease Expiration Date" = ($DHCPLeaseEnd)
}


# Writing out the Interface table formatted as a list, extra lines trimmed.
Write-Host ($InterfaceConfig | Format-List | Out-String).Trim()
Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" -ForegroundColor DarkYellow
}

dhcp-check
