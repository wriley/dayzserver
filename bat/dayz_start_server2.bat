@echo off

set PORT=23202
set MAP="chernarus"
set DB="dayz_2.chernarus"
set DBHOST="CHANGEME"
set DBPASS="CHANGEME"

echo Checking for already running ArmA2 server process...
set PID=""
FOR /f "tokens=4 delims=\ " %%a IN ('netstat -aon ^| findstr ":%PORT% "') DO (
	set PID=%%a
)

IF (%PID%)==("") (
	GOTO START
) ELSE (
	echo Found %PID% already running!
	PING -n 15 127.0.0.1>nul
	GOTO END
)

:START

echo Archiving server logs...
c:
cd "\steam\steamapps\common\arma 2 operation arrowhead\dayz_2.%MAP%"
set hh=%time:~-11,2%
set /a hh=%hh%+100
set hh=%hh:~1%
set dateseed=%date:~10,4%%date:~4,2%%date:~7,2%_%hh%%time:~3,2%%time:~6,2%
mkdir logs >nul 2>&1
FOR %%f in (server_console.log,arma2oaserver.RPT,HiveExt.log,update_bans.log,db_utility.log,db_dayz.log) DO move /y %%f logs\%dateseed%-%%f >nul 2>&1

echo Archiving BattlEye logs...
c:
cd "\steam\steamapps\common\arma 2 operation arrowhead\dayz_2.%MAP%\BattlEye"
set hh=%time:~-11,2%
set /a hh=%hh%+100
set hh=%hh:~1%
set dateseed=%date:~10,4%%date:~4,2%%date:~7,2%_%hh%%time:~3,2%%time:~6,2%
mkdir logs >nul 2>&1
FOR %%f in (*.log) DO move /y %%f logs\%dateseed%-%%f >nul 2>&1

s:
cd "\src\DayZ-Private-master"

REM echo Running database script...
REM C:\strawberry\perl\bin\perl.exe db_dayz_epoch.pl --db %DB% --host %DBHOST% --user dayz --pass %DBPASS% > "c:\steam\steamapps\common\arma 2 operation arrowhead\dayz_2.%MAP%\db_dayz.log" 2>&1


echo Updating bans...
C:\strawberry\perl\bin\perl.exe update_bans.pl --dwarden --mybans "c:\Documents and Settings\Computer User\Desktop\mybans.txt" --save "c:\steam\steamapps\common\arma 2 operation arrowhead\dayz_2.%MAP%\BattlEye\bans.txt" --verbose > "c:\steam\steamapps\common\arma 2 operation arrowhead\dayz_2.%MAP%\update_bans.log" 2>&1

echo Starting DayZ server...
c:
cd "\steam\steamapps\common\arma 2 operation arrowhead"
call "cmd /c start /realtime /min server_chernarus_2.bat <nul"
echo waiting 60 seconds for DayZ server to start...
PING -n 60 127.0.0.1>nul

echo Starting BEC...
cd "\Bec"
call "cmd /c start /min C:\Bec\bec_%MAP%.bat"

PING -n 15 127.0.0.1>nul

echo Done
:END
