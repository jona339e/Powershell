
$parentOUPath = Get-Content -Path Users.txt -TotalCount 1


$users = Import-Csv -Path Users.txt -Delimiter "," -Header "Firstname", "Lastname", "Username", "Password", "DomainMail", "OUName" | Select-Object -Skip 1


foreach ($user in $users) {
    $firstname = $user.Firstname
    $lastname = $user.Lastname
    $username = $user.Username
    $password = $user.Password
    $domainMail = $user.DomainMail
    $ouName = $user.OUName
    $ouPath = "DC=$ouName,$parentOUPath"


    New-ADUser -SamAccountName $username -UserPrincipalName "$username@$domainMail" -GivenName $firstname -Surname $lastname -Name "$firstname $lastname" -Enabled $true -AccountPassword (ConvertTo-SecureString -String $password -AsPlainText -Force) -PassThru -Path $ouPath
}