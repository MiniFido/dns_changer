# Get all active network adapters
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

# Check if there are any active adapters
if ($adapters.Count -eq 0) {
    Write-Output "No active network adapters found."
    exit
}

# Display the list of active adapters
Write-Output "Select the network adapter to change DNS:"
for ($i = 0; $i -lt $adapters.Count; $i++) {
    Write-Output "$($i + 1): $($adapters[$i].Name) - $($adapters[$i].InterfaceAlias)"
}

# Prompt user to select an adapter by number
$selection = Read-Host "Enter the number of the network adapter"

# Validate selection and set DNS
if ($selection -match '^\d+$' -and $selection -le $adapters.Count -and $selection -gt 0) {
    $adapter = $adapters[$selection - 1]
    Set-DnsClientServerAddress -InterfaceAlias $adapter.InterfaceAlias -ServerAddresses ("1.1.1.1", "8.8.8.8")
    Write-Output "DNS servers changed to 1.1.1.1 and 8.8.8.8 for adapter $($adapter.Name)"
} else {
    Write-Output "Invalid selection. Exiting script."
}
