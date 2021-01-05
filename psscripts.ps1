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

#Enable Hyper-V
Set-ExecutionPolicy Bypass -Scope Process -Force; Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All -NoRestart

Restart-Computer