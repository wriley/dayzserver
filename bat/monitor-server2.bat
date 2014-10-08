@echo off

:loop
c:
cd "C:\Documents and Settings\Computer User\Desktop"

echo Chernarus
echo %date% %time%

echo Checking for ArmA2 server process...
set PID=""
FOR /f "tokens=4 delims=\ " %%a IN ('netstat -aon ^| findstr ":23202 "') DO (
	set PID=%%a
)

IF (%PID%)==("") (
	echo PID not found, restarting!
	call "dayz_restart_server2.bat"
) else (
	echo Found PID %PID%
	
	echo Checking for BEC process...
	tasklist /fi "imagename eq Bec.exe" | findstr /i "Bec.exe" >nul 2>&1
	IF ERRORLEVEL 1 (
		echo BEC process not found, starting!
		start /wait cmd /c "C:\Bec\bec_chernarus.bat"
	) else (
		echo Found Bec.exe running
	)
)

echo Sleeping for 60 seconds...
echo.
PING -n 60 127.0.0.1>nul
GOTO loop