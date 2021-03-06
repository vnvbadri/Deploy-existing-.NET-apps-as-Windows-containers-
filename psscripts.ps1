Start-Transcript -Path C:\WindowsAzure\Logs\CustomscriptLogs.txt -Append


#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'docker-compose',`
            'visualstudio2019community',`
            'git',`
            'googlechrome',`
            'aspnetmvc4.install',`
            'visualstudio2019-workload-netweb'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

Restart-Computer