# Check if Steam.exe is running
param (
    [int]$PostWait = 0
)

# Check if Steam.exe is running
$steamRunning = Get-Process -Name "Steam" -ErrorAction SilentlyContinue

if ($steamRunning) {
    # Terminate Steam.exe if it's running
    Stop-Process -Name "Steam" -Force
    Write-Host "Steam.exe was running and has been terminated."

    if ($PostWait -gt 0) {
        Write-Host "Waiting for $PostWait seconds after killing Steam..."
        Start-Sleep -Seconds $PostWait
    }
} else {
    Write-Host "Steam.exe is not running."
}