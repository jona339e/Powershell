
$parentOUPath = Get-Content -Path $filePath -TotalCount 1


$users = Import-Csv -Path $filePath -Delimiter "," -Header "Firstname", "Lastname", "Username", "Password", "DomainMail", "OUName" | Select-Object -Skip 1


foreach ($user in $users) {
    $firstname = $user.Firstname
    $lastname = $user.Lastname
    $username = $user.Username
    $password = $user.Password
    $domainMail = $user.DomainMail
    $ouName = $user.OUName

    New-ADUser -SamAccountName $username -UserPrincipalName "$username@$domainMail" -GivenName $firstname -Surname $lastname -Name "$firstname $lastname" -Enabled $true -AccountPassword (ConvertTo-SecureString -String $password -AsPlainText -Force) -PassThru | Move-ADObject -TargetPath "OU=$ouName,DC=yourdomain,DC=com"
}
