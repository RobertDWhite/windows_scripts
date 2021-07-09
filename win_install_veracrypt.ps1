#Download and Install veracrypt silently
#intended for use with Intune, but it will work regardless

$intune_dir = "C:\Intune\"
if(!(Test-Path -Path $intune_dir )){
    New-Item -ItemType directory -Path $intune_dir
    Write-Host "C:\Intune\ folder created"
}
else
{
  Write-Host "C:\Intune\ folder already exists"
}
$veracrypt_dir = "C:\Intune\veracrypt"
if(!(Test-Path -Path $veracrypt_dir )){
    Write-Host "C:\Intune\veracrypt Does not exist...Continuing..."
    New-Item -ItemType directory -Path $veracrypt_dir
    Write-Host "C:\Intune\veracrypt folder created"
}
else
{
  Write-Host "C:\Intune\veracrypt folder already exists...Exiting"
  Exit
}

##Get veracrypt.exe and Install
Write-Output "Change Directory to veracrypt"
cd C:\Intune\veracrypt
Write-Output "Downloading veracrypt.exe... View status above..."
wget -OutFile veracrypt.exe https://launchpad.net/veracrypt/trunk/1.24-update7/+download/VeraCrypt%20Setup%201.24-Update7.exe
.\veracrypt.exe /S /SE /SW
