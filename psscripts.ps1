Start-Transcript -Path C:\WindowsAzure\Logs\CustomscriptLogs.txt -Append


#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'docker-desktop',`
            'wsl2',`
            'visualstudio2019community',`
            'aspnetmvc4.install',`
            'visualstudio2019-workload-netweb'


#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

mkdir C:\windows\system32\config\systemprofile\AppData\Local\Temp

# Docker User Permission
Set-ExecutionPolicy Bypass -Scope Process -Force; Add-LocalGroupMember -Group "docker-users" -Member "demouser"

# Windows subsystem for linux version change
#wsl --set-default-version 2

# Enable ASPNETMVC4
Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/9b3476ff-6d0a-4ff8-956d-270147f21cd4/76e39c746d9e2fc3eadd003b5b11440bcf926f3948fb2df14d5938a1a8b2b32f/vs_Community.exe" -OutFile "C:\vs_Community.exe"
C:\vs_community.exe --add  Microsoft.VisualStudio.Web.Mvc4.ComponentGroup

#Enable Hyper-V
Set-ExecutionPolicy Bypass -Scope Process -Force; Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All -NoRestart

Restart-Computer