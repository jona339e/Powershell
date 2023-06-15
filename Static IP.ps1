$DNS = "169.254.122.23"
New-NetIPAddress –IPAddress 169.254.122.23 -DefaultGateway 169.254.122.1 -PrefixLength 24 -InterfaceIndex (Get-NetAdapter).InterfaceIndex

$InterfaceAlias = (Get-NetIPInterface | Where-Object {$_.InterfaceAlias -like "*Ethernet*"}).InterfaceAlias

Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ServerAddresses $DNS