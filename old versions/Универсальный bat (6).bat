@echo off
ver|find "5.1" >nul
if '%errorlevel%'=='0' set windowsversion=Windows XP
ver|find "6.0" >nul
if '%errorlevel%'=='0' set windowsversion=Windows Vista
ver|find "6.1" >nul
if '%errorlevel%'=='0' set windowsversion=Windows 7
ver|find "6.3" >nul
if '%errorlevel%'=='0' set windowsversion=Windows 8.1
ver|find "10" >nul
if '%errorlevel%'=='0' set windowsversion=Windows 10
set ver=2.8
set vermenu=4 FS+ (4FS+)
:start
title Универсальный bat by Russanandres
color 07
cls
echo.                    TIME = %time%    DATE = %date%
echo [ver] Версия скрипта
echo [clean] очистка
echo [run] запустить
echo [off] выключение ПК
echo [game] развлечения
echo [exit] выход

set /p choice=Выберите: 
if '%choice%'=='debug' goto :debug
if '%choice%'=='game' goto :game
if '%choice%'=='ver' goto :ver
if '%choice%'=='exit' exit
if '%choice%'=='off' goto :Restart
if '%choice%'=='run' goto :run
if '%choice%'=='clean' goto :clean
goto start

:ver
cls
echo Версия скрипта: %ver%
echo Версия меню: %vermenu%
echo.
echo OS = %windowsversion%
timeout /t -1
goto start
:debug
cls
echo Errorlevel = %errorlevel%
echo OS = %windowsversion%
echo [1] Перезагрузить скрипт
echo [2] выйти
set /p choice=
if '%choice%'=='1' goto :start
if '%choice%'=='2' exit
:game
cls
cd C:\
IF EXIST SeaBattle.cmd. (@echo off) ELSE echo.&echo.     ::Внимание::&echo.   -----------------&echo.&echo. Один из файлов&echo.     пропал:&echo.&echo.   SeaBattle.cmd&echo.&echo. Он нужен если хотите играть&echo. в морской бой. Скачать можно&echo. из канала в Telegramm.&echo.
IF EXIST snake.cmd. (@echo off) ELSE echo.&echo.     ::Внимание::&echo.   -----------------&echo.&echo. Один из файлов&echo.     пропал:&echo.&echo.   snake.cmd&echo.&echo. Он нужен если хотите играть&echo. в змейку. Скачать можно&echo. из канала в Telegramm.&echo.
echo [back] Назад
echo [try] Угадай число
echo [seab] морской бой
echo [snake] змейка
set /p choice=
if '%choice%'=='back' goto :start
if '%choice%'=='try' goto :try
if '%choice%'=='seab' goto :seab
if '%choice%'=='snake' goto :snake
:snake
cls
cd C:\
IF EXIST SeaBattle.cmd. (cd c:\&start snake.cmd&timeout /t -1&goto start) ELSE echo Положите фаил "snake.cmd" в корень диска C:\
timeout /t -1
goto start

:seab
cls
cd C:\
IF EXIST SeaBattle.cmd. (cd c:\&start SeaBattle.cmd&timeout /t -1&goto start) ELSE echo Положите фаил "SeaBattle.cmd" в корень диска C:\
timeout /t -1
goto start

:Restart
cls
echo.
echo [back] Назад
echo [1] Завершение работы
echo [2] Выйти из системы
echo [3] Перезагрузка
set /p choice=
if '%choice%'=='3' shutdown /r&pause
if '%choice%'=='2' shutdown /l&pause
if '%choice%'=='1' shutdown /s&pause
if '%choice%'=='back' goto :start
:clean
cls
echo.
echo [back] Назад
echo [1] очистка Appdata\Temp
echo [2] очистка Windows\Temp
echo [3] показать файлы Appdata\Temp
echo [4] показать файлы Windows\Temp
set /p choice=
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' cls&cd %USERPROFILE%\appdata\Local\Temp&dir&timeout /t -1&goto start
if '%choice%'=='4' cls&cd %SYSTEMROOT%\Temp&dir&timeout /t -1&goto start
if '%choice%'=='back' goto :start
:run
cls
echo OS = %windowsversion%
echo.
echo [back] Назад
echo [1] Explorer
echo [2] диспетчер задач
echo [3] командную стоку
echo [4] панель управления
echo [5] О ПК
echo [6] DXDiag
echo [7] Блокнот
echo [8] калькулятор
echo [9] Монитор ресурсов
echo [10] Winver
set /p choice=
if '%choice%'=='back' goto start
if '%choice%'=='1' cd %SYSTEMROOT%\system32&explorer.exe&goto run
if '%choice%'=='2' cd %SYSTEMROOT%\system32&taskmgr.exe&goto run
if '%choice%'=='3' cd %SYSTEMROOT%\system32&cmd.exe&goto run
if '%choice%'=='4' cd %SYSTEMROOT%\system32&control.exe&goto run
if '%choice%'=='5' cd %SYSTEMROOT%\system32&msinfo32.exe&goto run
if '%choice%'=='6' cd %SYSTEMROOT%\system32&dxdiag.exe&goto run
if '%choice%'=='7' cd %SYSTEMROOT%\system32&notepad.exe&goto run
if '%choice%'=='8' cd %SYSTEMROOT%\system32&calc.exe&goto run
if '%choice%'=='9' cd %SYSTEMROOT%\system32&perfmon.exe&goto run
if '%choice%'=='10' cd %SYSTEMROOT%\system32&winver.exe&goto run
:choice1
cls
echo отчищаю \Appdata\Temp...
echo.
del %USERPROFILE%\appdata\Local\Temp /q /f
echo.
echo \Appdata\Temp чистка закончена!
echo.
timeout /t -1
goto clean
:choice2
cls
echo отчищаю C:\Windows\Temp...
echo.
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp чистка закончена!
timeout /t -1
goto clean
:choice3
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t -1
goto start
:choice4
cls
cd %SYSTEMROOT%\Temp
dir
timeout /t -1
goto start
:try
cls
title Игра угадай число seJma, перевёл Russanandres
set /a answer=%RANDOM%
echo -------------------------------------------------
echo Привет, это игра угадай число
echo. 
echo Попробуй угадать число
echo.
echo [back] Назад
echo -------------------------------------------------
echo. 
:top
echo. 
set /p guess=
echo. 
if %guess% GTR %answer% ECHO меньше! 
if %guess% LSS %answer% ECHO больше! 
if %guess%==%answer% GOTO EQUAL
if '%guess%'=='back' goto :start
goto top
:equal
cls
echo Поздравляю, ты угадал!!! 
echo. 
timeout /t -1
goto start