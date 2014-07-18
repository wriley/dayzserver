@echo off

echo killing BEC...
taskkill /im Bec.exe
PING -n 3 127.0.0.1>nul

echo killing arma2oaserver...
set PID=""
FOR /f "tokens=4 delims=\ " %%a IN ('netstat -aon ^| findstr ":23202 "') DO (
	set PID=%%a
)
IF (%PID%)==("") (
	echo PID not found
) else (
	taskkill /pid %PID%
)
PING -n 5 127.0.0.1>nul