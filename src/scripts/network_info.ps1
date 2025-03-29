# network.ps1

# Get the network adapter configuration
$adapter = Get-NetAdapter

# Display the network adapter configuration
Write-Output "--- Network Adapter Configuration ---"
$adapter | Format-Table -AutoSize

# Get ip configuration
$ipconfig = Get-NetIPAddress

# Display the ip configuration
Write-Output "--- IP Configuration ---"
$ipconfig | Format-Table -AutoSize