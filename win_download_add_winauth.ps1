#Download and Add shortcut on Desktop for WinAuth
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
$winauth_dir = "C:\WinAuth"
if(!(Test-Path -Path $winauth_dir )){
    Write-Host "C:\WinAuth Does not exist...Continuing..."
}
else
{
  Write-Host "C:\WinAuth folder already exists...Exiting"
  Exit
}

##Get WinAuth.zip and Expand
Write-Output "Change Directory to Intune"
cd \Intune\
Write-Output "Downloading WinAuth.Zip... View status above..."
wget -OutFile WinAuth.zip https://github.com/winauth/winauth/releases/download/3.5.1/WinAuth-3.5.1.zip
Write-Output "Expanding Archive..."
Expand-Archive -LiteralPath WinAuth.zip -DestinationPath C:\Intune\

##Move WinAuth.exe to C:\WinAuth
$winauth_dir = "C:\WinAuth\"
if(!(Test-Path -Path $winauth_dir )){
    New-Item -ItemType directory -Path $winauth_dir
    Write-Host "C:\WinAuth\ folder created"
}
else
{
  Write-Host "C:\WinAuth\ folder already exists"
}
Write-Host "Moving WinAuth.exe to C:\WinAuth"
Move-Item "C:\Intune\WinAuth.exe" -Destination "C:\WinAuth"

#Make WinAuth Shortcut on Desktop
Write-Host "Making Shortcut on User Desktops"
$TargetFile = "C:\WinAuth\WinAuth.exe"
$ShortcutFile = "$env:Public\Desktop\WinAuth.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()
