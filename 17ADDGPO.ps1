# Import the Group Policy module
Import-Module GroupPolicy

# Create a new GPO
$gpoName = "DrivePAs"
New-GPO -Name $gpoName -Comment "GPO for drive mapping" -Domain "kursus101.com" | Out-Null

# Link the GPO to the desired OU or domain
$ou = "DC=kursus101,DC=com"
New-GPLink -Name $gpoName -Target $ou

Write-Host "GPO 'DriveP' created successfully."
