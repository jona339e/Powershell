
$importFile = (Get-Content OuList.txt) | Select-Object -skip 2

$domainName = Get-Content OuList.txt | Select -first 1

$name = (Get-Content OuList.txt)[1]

New-ADOrganizationalUnit -name $name -ProtectedFromAccidentalDeletion $false

$folderPath = "OU=$name,$domainName"


ForEach ($line in $importFile) {

echo $line

New-ADOrganizationalUnit -name $line -ProtectedFromAccidentalDeletion $false -Path $folderPath

}


﻿#Grupper

$rootDN = "DC=kursus23,DC=com"


#Create gruppe in Root
$parentGroupContainer = "Grupper"
New-ADOrganizationalUnit -Name $parentGroupContainer -ProtectedFromAccidentalDeletion $false



#Create GlobalGrupper in afdGrupper
$ouGloablGruppe = "GlobalGrupper"

# Specify the distinguished name (DN) of the parent container
$parentContainerDNG = "OU=$parentGroupContainer,$rootDN"
    
# Create the OU within the parent container
#$ouPath = "$parentContainerDN"
New-ADOrganizationalUnit -Name $ouGloablGruppe -Path $parentContainerDNG -ProtectedFromAccidentalDeletion $false





#Create DomainLocalGruppe in afdGrupper
$ouDomainLocalGruppe = "DomainLocalGrupper"

# Specify the distinguished name (DN) of the parent container
$parentContainerDNDL = "OU=$parentGroupContainer,$rootDN"
    
# Create the OU within the parent container
#$ouPath = "$parentContainerDN"
New-ADOrganizationalUnit -Name $ouDomainLocalGruppe -Path $parentContainerDNDL -ProtectedFromAccidentalDeletion $false
