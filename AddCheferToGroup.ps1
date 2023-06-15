
Import-Module ActiveDirectory


$users = Get-Content Chefer.txt

Add-ADGroupMember -Identity "DL_Chefer" -Members "G_Chefer"

foreach ($user in $users) {
    

    Add-ADGroupMember -Identity "G_Chefer" -Members $user
    

}