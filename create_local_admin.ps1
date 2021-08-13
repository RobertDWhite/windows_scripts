$user = ( (  Get-WMIObject -class Win32_ComputerSystem | Select-Object -ExpandProperty username ) -split '\\')[1]
$pos = $user.IndexOf('.')
$user_first = $user.Substring(0, $pos)
$user_last = $user.Substring($pos+1)
$user_first_cap = $user_first.substring(0,1).toupper()
$user_last_cap = $user_last.substring(0,1).toupper()+$user_last.substring(1).tolower() -join ""
$user_pw = $user_first_cap, $user_last_cap, 1, "!" -join ""
$NewLocalAdmin = "admin.$user_first"
$Password = ConvertTo-SecureString $user_pw -AsPlainText -Force

New-LocalUser -Name "$NewLocalAdmin" -Password $Password -FullName "$NewLocalAdmin" -Description "Temporary local admin"
Write-Verbose "$NewLocalAdmin local user created"
Add-LocalGroupMember -Group "Administrators" -Member "$NewLocalAdmin"
Write-Verbose "$NewLocalAdmin added to the local administrator group"
