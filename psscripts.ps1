Start-Transcript -Path C:\WindowsAzure\Logs\CustomscriptLogs.txt -Append

function enable-copypagecontent-in-internetexplorer{
Set-ItemProperty -Path $HKLM -Name "1407" -Value 0
Set-ItemProperty -Path $HKCU -Name "1407" -Value 0 
}
enable-copypagecontent-in-internetexplorer

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'docker-desktop'


#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

mkdir C:\windows\system32\config\systemprofile\AppData\Local\Temp

# Docker User Permission
Set-ExecutionPolicy Bypass -Scope Process -Force; Add-LocalGroupMember -Group "docker-users" -Member "demouser"

#Enable Hyper-V
Set-ExecutionPolicy Bypass -Scope Process -Force; Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart