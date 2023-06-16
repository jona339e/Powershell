$parentOUPath = Get-Content -Path 07Users.txt -TotalCount 1


$users = Import-Csv -Path 07Users.txt -Delimiter "," -Header "Firstname", "Lastname", "Username", "Password", "DomainMail", "OUName" | Select-Object -Skip 1


foreach ($user in $users) {
    $firstname = $user.Firstname
    $lastname = $user.Lastname
    $username = $user.Username
    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force
    $domainMail = $user.DomainMail
    $ouName = $user.OUName
    $ouPath = "OU=$ouName,$parentOUPath"


    New-ADUser -GivenName $firstname -Surname $lastname -SamAccountName $username -AccountPassword $password -UserPrincipalName $username$domainMail -name "$firstname $lastname" -Enabled $true -PasswordNeverExpires $true -Path $ouPath



}
