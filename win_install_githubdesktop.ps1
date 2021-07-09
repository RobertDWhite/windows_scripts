#Download and Install GitHub Desktop silently
#intended for use with Intune, but it will work regardless

$intune_dir = "C:\Intune\"
if(!(Test-Path -Path $intune_dir )){
    New-Item -ItemType directory -Path $printer_dir
    Write-Host "C:\Intune\ folder created"
}
else
{
  Write-Host "C:\Intune\ folder already exists"
}
$github_dir = "C:\Intune\github"
if(!(Test-Path -Path $github_dir )){
    Write-Host "C:\Intune\github Does not exist...Continuing..."
    New-Item -ItemType directory -Path $github_dir
    Write-Host "C:\Intune\github folder created"
}
else
{
  Write-Host "C:\Intune\github folder already exists...Exiting"
  Exit
}

##Get github.exe and Expand
Write-Output "Change Directory to GitHub"
cd C:\Intune\github
Write-Output "Downloading github.exe... View status above..."
wget -OutFile github.exe https://central.github.com/deployments/desktop/desktop/latest/win32
.\github.exe /S /SE /SW
