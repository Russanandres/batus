@echo off
:start
echo Универсальный bat by Russanandres
echo [1] отчистка Appdata\Temp
echo [2] отчистка Windows\Temp
echo [3] показать файлы Appdata\Temp
echo [4] показать файлы Windows\Temp
echo [98] запустить...
echo [99] выход

set /p choice=.
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
if '%choice%'=='100' goto :start
if '%choice%'=='99' goto :choice99
if '%choice%'=='98' goto :choicez
if '%choice%'=='5' goto :choice5
if '%choice%'=='6' goto :choice6
if '%choice%'=='7' goto :choice7
if '%choice%'=='8' goto :choice8
if '%choice%'=='9' goto :choice9
if '%choice%'=='10' goto :choice10
if '%choice%'=='11' goto :choice11
if '%choice%'=='12' goto :choice12
if '%choice%'=='13' goto :choice13
if '%choice%'=='14' goto :choice14
if '%choice%'=='15' goto :choice15
if '%choice%'=='16' goto :choice16
if '%choice%'=='17' goto :choice17
if '%choice%'=='18' goto :choice18
if '%choice%'=='19' goto :choice19
if '%choice%'=='20' goto :choice10
echo Универсальный bat by Russanandres
goto start
:choicez
cls
echo [100] Назад
echo [5] запустить Explorer
echo [6] запустить диспетчер задач
echo [7] запустить командную стоку
echo [8] запустить панель управления
echo [9] о ПК 1
echo [10] о ПК 2
echo [11] блокнот
echo [12] монитор ресурсов
set /p choice=.
if '%choice%'=='100' goto :start
if '%choice%'=='5' goto :choice5
if '%choice%'=='6' goto :choice6
if '%choice%'=='7' goto :choice7
if '%choice%'=='8' goto :choice8
if '%choice%'=='9' goto :choice9
if '%choice%'=='10' goto :choice10
if '%choice%'=='11' goto :choice11
goto end
:choice1
cls
timeout /t 3
cls
echo отчищаю \Appdata\Temp...
echo .
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp чистка закончена!
echo .
timeout /t 10
cls
goto start
goto end
:choice2
cls
echo отчищаю C:\Windows\Temp...
echo .
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp чистка закончена!
timeout /t 10
cls
goto start
goto end
:choice3
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t -1
cls
goto start
goto end
:choice4
cls
cd %SYSTEMROOT%\Temp
dir
timeout /t -1
cls
goto start
goto end
:choice99
Exit
goto end
:choice5
cls
cd %SYSTEMROOT%\system32
explorer.exe
timeout /t 5
cls
goto start
goto end
:choice6
cls
cd %SYSTEMROOT%\system32
taskmgr.exe
timeout /t 5
cls
goto start
goto end
:choice7
cls
cd %SYSTEMROOT%\system32
cmd.exe
timeout /t 5
cls
goto start
goto end
:choice8
cls
cd %SYSTEMROOT%\system32
control.exe
timeout /t 5
cls
goto start
goto end
:choice9
cls
cd %SYSTEMROOT%\system32
msinfo32.exe
timeout /t 5
cls
goto start
goto end
:choice10
cls
cd %SYSTEMROOT%\system32
dxdiag.exe
timeout /t 5
cls
goto start
goto end
:choice11
cls
cd %SYSTEMROOT%\system32
notepad.exe
timeout /t 5
cls
goto start
goto end
:choice12
cls
cd %SYSTEMROOT%\system32
perfmon.exe
timeout /t 5
cls
goto start
goto end