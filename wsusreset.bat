REM BATCH FILE BEGIN 
@echo off 
REM Apply Group Policy
gpupdate /force
GPResult.exe /f /h %USERPROFILE%\Desktop\%COMPUTERNAME%-gpresult.htm
REM Reset WSUS
net stop wuauserv 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f 
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f 
DEL /F /S /Q C:\Windows\SoftwareDistribution\Download\*.*
net start wuauserv 
wuauclt /resetauthorization /detectnow 
REM Disable Hibernate
REM powercfg -h off
REM Enable RDP
REM reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
REM netsh advfirewall firewall set rule group="remote desktop" new enable=yes
REM Import Start Menu Layout
REM Import-StartLayout -LayoutPath startmenu.xml -MountPath C:\
Pause 
REM BATCH FILE END