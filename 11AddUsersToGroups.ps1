Import-Module ActiveDirectory


$users = Import-Csv -Path 07Users.txt -Delimiter "," -Header "Firstname", "Lastname", "Username", "Password", "DomainMail", "OUName" | Select-Object -Skip 1


foreach ($user in $users) {
    
    $Username = $user.Username
    $ouname = $user.OUName
    echo $Username
    echo "G_$ouname"

    Add-ADGroupMember -Identity "G_$ouname" -Members $Username
    Add-ADGroupMember -Identity "DL_$ouname" -Members "G_$ouname"
    

}
