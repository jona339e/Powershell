$filePath = Get-Content -Path "05OuList.txt" -TotalCount 2 | Select-Object -Skip 1
$mainFolderPath = "C:\$filePath"
$subfolderNames = (Get-Content "05OuList.txt") | Select-Object -Skip 2



Foreach ($subfolderName in $subfolderNames) {
    $subfolderPath = Join-Path -Path $mainFolderPath -ChildPath $subfolderName
    
    $AddPermission = New-Object System.Security.AccessControl.FileSystemAccessRule("DL_$subfolderName", "Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
    
    $acl = Get-Acl -Path $subfolderPath
    $acl.AddAccessRule($AddPermission)

    Set-Acl -Path $subfolderPath -AclObject $acl

}
