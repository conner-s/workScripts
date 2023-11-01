#Conner-S
#2023-11-01

#add requirement for Hyper-V PowerShell module
Import-Module Hyper-V



#Change based on environment
$FsLogixUNCPath = "\\fslogix\profiles"

$userSamAccountName = Read-Host -Prompt "Enter the SamAccountName of the user to clear the Office Data for"

#Review the path to the user's Office Data VHDX file
$VHDPath = $FsLogixUNCPath + "\" + $userSamAccountName + "\Profile.vhdx"

Mount-VHD -Path $VHDPath -ReadOnly -Passthru | Get-Disk | Get-Partition | Get-Volume | Get-Item | Get-ChildItem -Recurse | Where-Object {$_.Name -like "*Office*" -or $_.Name -like "*Outlook*" -or $_.Name -like "*OneNote*" -or $_.Name -like "*Teams*" -or $_.Name -like "*Skype*" -or $_.Name -like "*Lync*" -or $_.Name -like "*SharePoint*" -or $_.Name -like "*OneDrive*" -or $_.Name -like "*Word*" -or $_.Name -like "*Excel*" -or $_.Name -like "*PowerPoint*" -or $_.Name -like "*Publisher*" -or $_.Name -like "*Access*" -or $_.Name -like "*Visio*" -or $_.Name -like "*Project*" -or $_.Name -like "*Forms*" -or $_.Name -like "*Sway*" -or $_.Name -like "*Planner*"}