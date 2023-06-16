
$importFile = (Get-Content OuList.txt) | Select-Object -skip 2

$domainName = Get-Content OuList.txt | Select -first 1

$name = (Get-Content OuList.txt)[1]

New-ADOrganizationalUnit -name $name -ProtectedFromAccidentalDeletion $false

$folderPath = "OU=$name,$domainName"


ForEach ($line in $importFile) {

echo $line

New-ADOrganizationalUnit -name $line -ProtectedFromAccidentalDeletion $false -Path $folderPath

}
