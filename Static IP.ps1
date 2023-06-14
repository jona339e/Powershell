New-NetIPAddress –IPAddress 169.254.122.23 -DefaultGateway 169.254.122.1 -PrefixLength 24 -InterfaceIndex (Get-NetAdapter).InterfaceIndex

Set-DnsClientServerAddress -ServerAddresses 169.254.122.23