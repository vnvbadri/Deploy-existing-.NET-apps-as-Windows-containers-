Start-Transcript -Path C:\WindowsAzure\Logs\CustomscriptLogs.txt -Append

Add-LocalGroupMember -Group "docker-users" -Member "$env:UserName"

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All