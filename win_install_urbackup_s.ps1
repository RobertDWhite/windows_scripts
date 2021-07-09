##Download and Install URBackup Silently

wget -OutFile C:\Windows\system32\urbackup.exe https://hndl.urbackup.org/Client/2.4.11/UrBackup%20Client%202.4.11.exe
$pathvargs = {C:\Windows\System32\urbackup.exe /S}
Invoke-Command -ScriptBlock $pathvargs

Start-Process -Wait -FilePath C:\Windows\System32\urbackup.exe -Argument "/silent" -PassThru
