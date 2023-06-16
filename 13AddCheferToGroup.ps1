Import-Module ActiveDirectory





New-ADGroup -Name "G_Chefer" -GroupScope Global -GroupCategory Security -Path "OU=GlobalGrupper,OU=Grupper,DC=kursus23,DC=com"

New-ADGroup -Name "DL_Chefer" -GroupScope DomainLocal -GroupCategory Security -Path "OU=DomainLocalGrupper,OU=Grupper,DC=kursus23,DC=com"





$users = Get-Content 12Chefer.txt

Add-ADGroupMember -Identity "DL_Chefer" -Members "G_Chefer"

foreach ($user in $users) {
    

    Add-ADGroupMember -Identity "G_Chefer" -Members $user
    

}
