@echo off
echo Temp чистка by Russanandres
timeout /t 5
echo отчищаю \Appdata\Temp...
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp чистка закончена!
echo .
:start
set /p choice=Показать файлы или продолжить?
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice4
if '%choice%'=='показать' goto :choice1
if '%choice%'=='продолжить' goto :choice4
echo Bat фаил от Russanandres
goto start
:choice1
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t 20
cls
echo отчищаю C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp чистка закончена!
echo .
:start
set /p choice=показать files or exit?
if '%choice%'=='1' goto :choice3
if '%choice%'=='2' goto :choice2
if '%choice%'=='показать' goto :choice3
if '%choice%'=='продолжить' goto :choice2
echo Bat фаил от Russanandres
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
echo очтищаю C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp чистка закончена!
echo .
:start
set /p choice=показать files or exit?
if '%choice%'=='1' goto :choice3
if '%choice%'=='2' goto :choice2
if '%choice%'=='показать' goto :choice3
if '%choice%'=='продолжить' goto :choice2
echo Bat фаил от Russanandres
goto end
pause