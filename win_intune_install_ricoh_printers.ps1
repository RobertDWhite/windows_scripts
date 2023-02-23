##INSTALL RICHOH PRINTERS

# change "https:/path/to/Printer.zip" on line 42

##Assign Variables
$PrinterName2000 = "MP_C2000"
$PrinterIP2000 = "10.200.1.20"
$PrinterName6004 = "MP_C6004"
$PrinterIP6004 = "10.200.1.21"
$PrinterName4520dn = "SP_4520DN"
$PrinterIP4520dn = "10.200.1.22"
$PrinterName2201 = "MP_CW2201"
$PrinterIP2201 = "10.200.1.23"
$DriverName = "PCL6 Driver for Universal Print"

##Check to see if this has already been done, roughly
##No point in running again if Intune for some reason pushes a second time
$intune_dir = "C:\Intune\"
if(!(Test-Path -Path $intune_dir )){
    New-Item -ItemType directory -Path $printer_dir
    Write-Host "C:\Intune\ folder created"
}
else
{
  Write-Host "C:\Intune\ folder already exists"
}
$printer_dir = "C:\Intune\Printer"
if(!(Test-Path -Path $printer_dir )){
    Write-Host "C:\Intune\Printer Does not exist...Continuing..."
}
else
{
  Write-Host "C:\Intune\Printer folder already exists...Exiting"
  Exit
}

##Get Printer.zip and Expand
###Contains Universal Driver from Ricoh as well as dpinst64x to install printer drivers
Write-Output "Change Directory to Intune"
cd \Intune\
Write-Output "Downloading Printer.Zip... View status above..."
wget -OutFile Printer.zip https:/path/to/Printer.zip
Write-Output "Expanding Archive..."
Expand-Archive -LiteralPath Printer.zip -DestinationPath C:\Intune\
Write-Output "Change Directory to Printer"
cd \Intune\Printer
##Install Printer Driver
Write-Output "Installing Universal Driver...Please wait 2.5min"
.\dpinstx64.exe /S /SE /SW
Start-Sleep -Seconds 150
Write-Output "Adding Driver to System"
Add-PrinterDriver -Name $DriverName

##Add ALL Ricoh Printers

#Install MP_C2000
Write-Output "Adding Printer - MP_C2000"
Add-PrinterPort -Name "TCP:$($PrinterIP2000)" -PrinterHostAddress $PrinterIP2000
Add-Printer -Name "$($PrinterName2000)" -PortName "TCP:$($PrinterIP2000)" -DriverName $DriverName -Shared:$false

#Install MP_C6004
Write-Output "Adding Printer - MP_C6004"
Add-PrinterPort -Name "TCP:$($PrinterIP6004)" -PrinterHostAddress $PrinterIP6004
Add-Printer -Name "$($PrinterName6004)" -PortName "TCP:$($PrinterIP6004)" -DriverName $DriverName -Shared:$false

#Install SP_4520DN
Write-Output "Adding Printer - SP_4520DN"
Add-PrinterPort -Name "TCP:$($PrinterIP4520dn)" -PrinterHostAddress $PrinterIP4520dn
Add-Printer -Name "$($PrinterName4520dn)" -PortName "TCP:$($PrinterIP4520dn)" -DriverName $DriverName -Shared:$false

#Install MP_CW2201
Write-Output "Adding Printer - MP_CW2201"
Add-PrinterPort -Name "TCP:$($PrinterIP2201)" -PrinterHostAddress $PrinterIP2201
Add-Printer -Name "$($PrinterName2201)" -PortName "TCP:$($PrinterIP2201)" -DriverName $DriverName -Shared:$false