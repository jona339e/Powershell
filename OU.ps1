$name = "Afdelinger"

$domainName = "DC=KURSUS23,DC=com"

New-ADOrganizationalUnit -name $name -ProtectedFromAccidentalDeletion $false

###

$subFolder = "Ledelse"

$folderPath = "OU=$name,$domainName"

New-ADOrganizationalUnit -name $subFolder -ProtectedFromAccidentalDeletion $false -Path $folderPath

###

$subFolder = "Bogholderi"

New-ADOrganizationalUnit -name $subFolder -ProtectedFromAccidentalDeletion $false -Path $folderPath

###

$subFolder = "Loen"

New-ADOrganizationalUnit -name $subFolder -ProtectedFromAccidentalDeletion $false -Path $folderPath

###

$subFolder = "Marketing"

New-ADOrganizationalUnit -name $subFolder -ProtectedFromAccidentalDeletion $false -Path $folderPath

###

$subFolder = "Laererteam"

New-ADOrganizationalUnit -name $subFolder -ProtectedFromAccidentalDeletion $false -Path $folderPath

###

$subFolder = "Kundeservice"

New-ADOrganizationalUnit -name $subFolder -ProtectedFromAccidentalDeletion $false -Path $folderPath

###

$subFolder = "HR"

New-ADOrganizationalUnit -name $subFolder -ProtectedFromAccidentalDeletion $false -Path $folderPath


###

$subFolder = "IT Helpdesk"

New-ADOrganizationalUnit -name $subFolder -ProtectedFromAccidentalDeletion $false -Path $folderPath

