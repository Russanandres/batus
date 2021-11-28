@echo off
ver|find "5.0" >nul
if '%errorlevel%'=='0' set windowsversion= 2000&title режим совместимости с Windows 2000&msg * запущен режим совместимости с Windows 2000, некоторые функции могут неработать
ver|find "5.1" >nul
if '%errorlevel%'=='0' set windowsversion= XP
ver|find "6.1" >nul
if '%errorlevel%'=='0' set windowsversion= 7
:start
title Универсальный bat by Russanandres
cls
echo.                    TIME = %time%    DATE = %date%
echo [ver] Версия скрипта
echo [clean] очистка
echo [run] запустить
echo [off] выключение ПК
echo [game] развлечения
echo [exit] выход

set /p choice=Выберите: 
if '%choice%'=='Debug' goto :start
if '%choice%'=='game' goto :game
if '%choice%'=='ver' goto :ver
if '%choice%'=='exit' exit
if '%choice%'=='off' goto :Restart
if '%choice%'=='run' goto :run
if '%choice%'=='clean' goto :clean
goto start

:ver
cls
echo Версия скрипта: 2.7.2
echo Версия меню: 4 extented+ (4E+)
timeout /t -1
goto start

:game
cls
echo [back] Назад
echo [try] Угадай
echo [seab] морской бой
set /p choice=
if '%choice%'=='back' goto :start
if '%choice%'=='try' goto :try
if '%choice%'=='seab' goto :seab

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

:seab
cls
cd C:\
IF EXIST SeaBattle.cmd. (cd c:\&start SeaBattle.cmd&timeout /t -1&goto start) ELSE echo Положите фаил "SeaBattle.cmd" в корень диска C:\
timeout /t -1
goto start

:Restart
cls
echo .
echo [back] Назад
echo [1] Завершение работы
echo [2] Выйти из системы
echo [3] Перезагрузка
set /p choice=
if '%choice%'=='3' (
    shutdown /r
	pause
)
if '%choice%'=='2' (
    shutdown /l
	pause
)
if '%choice%'=='1' (
    shutdown /s
	pause
)
if '%choice%'=='back' goto :start
:clean
cls
echo .
echo [back] Назад
echo [1] очистка Appdata\Temp
echo [2] очистка Windows\Temp
echo [3] показать файлы Appdata\Temp
echo [4] показать файлы Windows\Temp
set /p choice=
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
if '%choice%'=='back' goto :start
:run
cls
echo OS = Windows%windowsversion%
echo .
echo [back] Назад
echo [1] Explorer
echo [2] диспетчер задач
echo [3] командную стоку
echo [4] панель управления
echo [5] О ПК
echo [6] DXDiag
echo [7] Блокнот
echo [8] Монитор ресурсов
echo [9] Winver
echo [10] калькулятор
set /p choice=
if '%choice%'=='back' goto :start
if '%choice%'=='1' goto :choice5
if '%choice%'=='2' goto :choice6
if '%choice%'=='3' goto :choice7
if '%choice%'=='4' goto :choice8
if '%choice%'=='5' goto :choice9
if '%choice%'=='6' goto :choice10
if '%choice%'=='7' goto :choice11
if '%choice%'=='8' goto :choice12
if '%choice%'=='9' goto :choice13
if '%choice%'=='10' goto :choice14
:choice1
cls
echo отчищаю \Appdata\Temp...
echo .
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp чистка закончена!
echo .
timeout /t -1
goto start
:choice2
cls
echo отчищаю C:\Windows\Temp...
echo .
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp чистка закончена!
timeout /t -1
goto start
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
:choice5
cd %SYSTEMROOT%\system32
explorer.exe
goto start
:choice6
cd %SYSTEMROOT%\system32
taskmgr.exe
goto start
:choice7
cd %SYSTEMROOT%\system32
cmd.exe
goto start
:choice8
cd %SYSTEMROOT%\system32
control.exe
goto start
:choice9
cd %SYSTEMROOT%\system32
msinfo32.exe
goto start
:choice10
cd %SYSTEMROOT%\system32
dxdiag.exe
goto start
:choice11
cd %SYSTEMROOT%\system32
notepad.exe
goto start
:choice12
cd %SYSTEMROOT%\system32
perfmon.exe
goto start
:choice13
cd %SYSTEMROOT%\system32
winver.exe
goto start
:choice14cls
cd %SYSTEMROOT%\system32
calc.exe
goto start