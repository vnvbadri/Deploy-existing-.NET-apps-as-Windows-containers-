Start-Transcript -Path C:\WindowsAzure\Logs\CustomscriptLogs.txt -Append

function enable-copypagecontent-in-internetexplorer{
Set-ItemProperty -Path $HKLM -Name "1407" -Value 0
Set-ItemProperty -Path $HKCU -Name "1407" -Value 0 
}
enable-copypagecontent-in-internetexplorer

#for Hyper-v
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'docker-desktop',`
            'git',`
            'jdk8',`
	    'aspnetmvc4.install',`


#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}