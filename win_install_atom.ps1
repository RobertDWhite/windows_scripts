#Download and Install Atom
#this does not install truly silently, due to Atom's install Process
#users will see an atom install config screen, but they will not need to interact
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
$atom_dir = "C:\Intune\Atom"
if(!(Test-Path -Path $atom_dir )){
    Write-Host "C:\Intune\Atom Does not exist...Continuing..."
    New-Item -ItemType directory -Path $atom_dir
    Write-Host "C:\Intune\Atom folder created"
}
else
{
  Write-Host "C:\Intune\Atom folder already exists...Exiting"
  Exit
}

##Get Atom.exe and Install
Write-Output "Change Directory to Intune\Atom"
cd C:\Intune\Atom
Write-Output "Downloading AtomSetup-x64.exe... View status above..."
wget -OutFile AtomSetup-x64.exe https://atom.io/download/windows_x64
.\AtomSetup-x64.exe /S /SE /SW
