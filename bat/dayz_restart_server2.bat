@echo off

set hh=%time:~-11,2%
set /a hh=%hh%+100
set hh=%hh:~1%
set dateseed=%date:~10,4%%date:~4,2%%date:~7,2%_%hh%%time:~3,2%%time:~6,2%
echo %dateseed%

echo stopping...
call dayz_stop_server2.bat

PING -n 15 127.0.0.1>nul

echo starting...
call dayz_start_server2.bat