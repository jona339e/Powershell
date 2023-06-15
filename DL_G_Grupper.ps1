Import-Module ActiveDirectory

$importFile = Get-Content OuList.txt | Select-Object -Skip 2

$domainName = Get-Content OuList.txt | Select -first 1

$fullPath = "OU=Grupper,$domainName"

$G_GruppePath = "OU=GlobalGrupper,$fullPath"
$DL_GruppePath = "OU=DomainLocalGrupper,$fullPath"


ForEach($item in $importFile){

$GlobalName = "G_$item"
$DomainLocalName = "DL_$item"

New-ADGroup -Name $GlobalName -GroupScope Global -GroupCategory Security -Path $G_GruppePath

New-ADGroup -Name $DomainLocalName -GroupScope DomainLocal -GroupCategory Security -Path $DL_GruppePath


}