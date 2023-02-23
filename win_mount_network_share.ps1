# Set the network share's name, address, and drive letter
$shareName = "Synology"
$shareAddress = "\\10.200.1.100\ShareName"
$driveLetter = "S:"

# Check if the network share is already mounted
if (Test-Path $driveLetter) {
    Write-Host "Network share is already mounted."
} else {
    # Mount the network share
    $username = "DOMAIN\Username" # Replace with your own domain and username
    $password = "Password" # Replace with your own password
    $credentials = New-Object System.Management.Automation.PSCredential($username, (ConvertTo-SecureString $password -AsPlainText -Force))
    New-PSDrive -Name $shareName -PSProvider FileSystem -Root $shareAddress -Persist -Credential $credentials
    
    # Check if the network share was mounted successfully
    if (Test-Path $driveLetter) {
        Write-Host "Network share mounted successfully."
    } else {
        Write-Host "Failed to mount network share."
    }
}