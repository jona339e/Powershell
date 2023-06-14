New-NetIPAddress –IPAddress 169.254.122.23 -DefaultGateway 169.254.122.1 -PrefixLength 24 -InterfaceIndex (Get-NetAdapter).InterfaceIndex


Get-DnsClientServerAddress
Set-DNSClientServerAddress "Ethernet" –ServerAddresses ("169.254.1.157", "")
