@echo off
echo Temp чистка by Russanandres
echo [1] отчистка appdata\temp
echo [2] отчистка Windows\temp
echo [3] показать файлы appdata\temp
echo [4] показать файлы Windows\temp
echo Для выхода нажмите Ctrl+C.
:start
set /p choice=.
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
echo Bat фаил от Russanandres
goto start
:choice1
cls
timeout /t 5
cls
echo отчищаю \Appdata\Temp...
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp чистка закончена!
echo .
timeout /t 20
cls
echo Temp чистка by Russanandres
echo [1] отчистка appdata\temp
echo [2] отчистка Windows\temp
echo [3] показать файлы appdata\temp
echo [4] показать файлы Windows\temp
echo Для выхода нажмите Ctrl+C.
goto start
goto end
:choice2
cls
echo отчищаю C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp чистка закончена!
timeout /t 20
cls
echo Temp чистка by Russanandres
echo [1] отчистка appdata\temp
echo [2] отчистка Windows\temp
echo [3] показать файлы appdata\temp
echo [4] показать файлы Windows\temp
echo Для выхода нажмите Ctrl+C.
goto start
goto end
:choice3
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t 20
cls
echo Temp чистка by Russanandres
echo [1] отчистка appdata\temp
echo [2] отчистка Windows\temp
echo [3] показать файлы appdata\temp
echo [4] показать файлы Windows\temp
echo Для выхода нажмите Ctrl+C.
goto start
goto end
:choice4
cls
cd C:\Windows\temp
dir
timeout /t 20
cls
echo Temp чистка by Russanandres
echo [1] отчистка appdata\temp
echo [2] отчистка Windows\temp
echo [3] показать файлы appdata\temp
echo [4] показать файлы Windows\temp
echo Для выхода нажмите Ctrl+C.
goto start
goto end