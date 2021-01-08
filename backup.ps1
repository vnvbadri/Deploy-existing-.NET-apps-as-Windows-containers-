# Windows subsystem for linux version change
#wsl --set-default-version 2

# Enable ASPNETMVC4
Invoke-WebRequest -Uri "https://download.visualstudio.microsoft.com/download/pr/9b3476ff-6d0a-4ff8-956d-270147f21cd4/76e39c746d9e2fc3eadd003b5b11440bcf926f3948fb2df14d5938a1a8b2b32f/vs_Community.exe" -OutFile "C:\vs_Community.exe"
C:\vs_community.exe -q --add  Microsoft.VisualStudio.Web.Mvc4.ComponentGroup