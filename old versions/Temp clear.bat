@echo off
echo clear \Appdata\Temp...
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp clear Done!
echo .
:start
set /p choice=Pokazat files or exit?
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice4
if '%choice%'=='Pokazat' goto :choice1
if '%choice%'=='exit' goto :choice4
echo Bat file by Russanandres
goto start
:choice1
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t 20
cls
echo clear C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp clear Done!
echo .
:start
set /p choice=Pokazat files or exit?
if '%choice%'=='1' goto :choice3
if '%choice%'=='2' goto :choice2
if '%choice%'=='Pokazat' goto :choice3
if '%choice%'=='exit' goto :choice2
echo Bat file by Russanandres
goto end
:choice3
cls
cd C:\Windows\temp
dir
timeout /t 20
cls
goto end
:choice2
exit
goto end
:choice4
echo clear C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp clear Done!
echo .
:start
set /p choice=Pokazat files or exit?
if '%choice%'=='1' goto :choice3
if '%choice%'=='2' goto :choice2
if '%choice%'=='Pokazat' goto :choice3
if '%choice%'=='exit' goto :choice2
echo Bat file by Russanandres
goto end
pause