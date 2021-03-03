@echo off
echo loading utf-8 encoding
ping 127.0.0.1 -n 2 > nul
@chcp 65001
echo test: áščřž
echo -------------------------------------------------------------------------------
echo doporučení vývojáře: zvědšete toto okno na celou obrazovku pro lepší zobrazení.
echo -------------------------------------------------------------------------------
pause
:reslogin
color 0e
cls
echo ------
echo Login (je to fake login můžete tam napsat co chcete.)
echo ------
echo name:
set /p name= ):
echo password:
set /p password= ):
if "%name%" == "" goto error
if "%password%" == "" goto error
echo loging in. Please wait.
ping 127.0.0.1 -n 3 > nul
cls

:sl
for /f "tokens=*" %%a in (main.txt) do (
	echo %%a
	ping 127.0.0.1 -n 1 > nul
)
echo welcome %name%
:start
set /p input=):
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
echo type scp number:
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

:error
cls
color 0c
echo -----
echo error
echo -----
echo no password or login name!!
echo do you want login again? (y,n):
set /p ans= ):
if "%ans%" == "y" goto reslogin
if "%ans%" == "n" exit
goto error