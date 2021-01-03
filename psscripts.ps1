Start-Transcript -Path C:\WindowsAzure\Logs\CustomscriptLogs.txt -Append

function enable-copypagecontent-in-internetexplorer{
Set-ItemProperty -Path $HKLM -Name "1407" -Value 0
Set-ItemProperty -Path $HKCU -Name "1407" -Value 0 
}
enable-copypagecontent-in-internetexplorer

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'docker-desktop',`
            'git',`
            'visualstudio2019-workload-netweb',`
            'jdk8',`
	    'aspnetmvc4.install',`
	    'visualstudio2019-workload-azure'


#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

cd /

# Docker User Permission
Add-LocalGroupMember -Group "docker-users" -Member "$env:UserName"

#Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All