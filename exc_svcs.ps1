$services = get-wmiobject win32_service | ? {$_.name -like "MSExchange*" -and $_.StartMode -eq "Auto"}
foreach ($service in $services) {Restart-Service $service.name -Force}