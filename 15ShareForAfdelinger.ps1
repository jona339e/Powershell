﻿# Set the folder path
$folderPath = "C:\Afdelinger"

# Set the share name
$shareName = "Afdelinger"

# Set the share description
$shareDescription = "Shared folder for authenticated users"

# Set the username for removing "Everyone"
$usernameToRemove = "Everyone"

# Create the share
$null = New-SmbShare -Name $shareName -Path $folderPath -Description $shareDescription -FullAccess "Authenticated Users"

# Remove "Everyone" from the share permissions
$null = Get-SmbShareAccess -Name $shareName | Where-Object { $_.AccountName -eq $usernameToRemove } 
