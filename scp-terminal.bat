@echo off
echo loading utf-8 encoding
ping 127.0.0.1 -n 2 > nul
@chcp 65001
echo test: áščřž
echo -------------------------------------------------------------------------------
echo doporučení vývojáře: zvědšete toto okno na celou obrazovku pro lepší zobrazení.
echo -------------------------------------------------------------------------------
pause
cls
:sl
for /f "tokens=*" %%a in (main.txt) do (
	echo %%a
	ping 127.0.0.1 -n 1 > nul
)
color 0e
:start
set /p input=command:
echo loading command: %input%
ping 127.0.0.1 -n 2 > nul

if %input% == loadscp goto scp
if %input% == help goto help
if %input% == info goto info
if %input% == exit exit
if %input% == scplist goto lscp
if %input% == objecttypes goto ot
echo "no command or unknown command"
goto start

:lscp
echo -------------
echo scp database:
echo -------------
dir /b /a-d scp-*.data
echo _____________
goto start

:scp
set input == 0
cls
set /p input=scp:
if %input% == 001 color 0c
for /f "tokens=*" %%a in (scp-%input%.data) do (
	echo %%a
	ping 127.0.0.1 -n 1 > nul
)

echo --
echo --
pause
cls
color 0e
goto sl



:help
for /f "tokens=*" %%a in (commands.txt) do (
	echo %%a
	ping 127.0.0.1 -n 1 > nul
)
goto start

:info
cls
for /f "tokens=*" %%a in (info.txt) do (
	echo %%a
	ping 127.0.0.1 -n 1 > nul
)
goto start

:ot
for /f "tokens=*" %%a in (objecttypes.txt) do (
	echo %%a
	ping 127.0.0.1 -n 1 > nul
)
goto start