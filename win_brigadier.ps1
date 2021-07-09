#Download and Install Brigadier
#This will download the opensource project install files for brigadier.DESCRIPTION
#automatically detects Apple hardware, downloads appropriate BootCamp drivers for hardware, and installs the drivers
#It is recommended to wait about 5-10 minutes after running the script or deploying via Intune, then reboot. Patience is key
#Drivers should be installed and active after a reboot
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
#get brigadier
wget https://github.com/timsutton/brigadier/releases/download/0.2.4/brigadier.exe -OutFile \Intune\brigadier.exe

#run brigadier
## -i is used for install
cd C:\Intune\
.\brigadier.exe -i
