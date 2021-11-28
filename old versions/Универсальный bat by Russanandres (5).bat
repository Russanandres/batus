@echo off
:start
cls
echo Универсальный bat by Russanandres
echo [ver] Версия скрипта
echo [clean] отчистка...
echo [run] запустить...
echo [off] выключение ПК
echo [exit] выход

set /p choice=.
if '%choice%'=='ver' goto :ver
if '%choice%'=='106' goto :choice106
if '%choice%'=='105' goto :choice105
if '%choice%'=='104' goto :choice104
if '%choice%'=='103' goto :choice103
if '%choice%'=='102' goto :choice102
if '%choice%'=='101' goto :choice101
if '%choice%'=='back' goto :start
if '%choice%'=='exit' exit
if '%choice%'=='off' goto :choiceR
if '%choice%'=='run' goto :choicez
if '%choice%'=='clean' goto :choiceo
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
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
if '%choice%'=='20' goto :choice20
goto start


:ver
cls
echo 2.5.7
timeout /t -1
goto :start

:choiceR
cls
echo .
echo [back] Назад
echo [101] Выключение
echo [102] Разлогинится
echo [103] Перезагузка
set /p choice=.
if '%choice%'=='103' goto :choice103
if '%choice%'=='102' goto :choice102
if '%choice%'=='101' goto :choice101
if '%choice%'=='back' goto :start


:choiceo
cls
echo .
echo [back] Назад
echo [1] отчистка Appdata\Temp
echo [2] отчистка Windows\Temp
echo [3] показать файлы Appdata\Temp
echo [4] показать файлы Windows\Temp
set /p choice=.
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
if '%choice%'=='back' goto :start


:choicez
cls
echo .
echo [back] Назад
echo [5] Запустить Explorer
echo [6] Запустить диспетчер задач
echo [7] Запустить командную стоку
echo [8] Запустить панель управления
echo [9] О ПК
echo [10] DXDiag
echo [11] Блокнот
echo [12] Монитор ресурсов
echo [13] Winver
set /p choice=.
if '%choice%'=='back' goto :start
if '%choice%'=='5' goto :choice5
if '%choice%'=='6' goto :choice6
if '%choice%'=='7' goto :choice7
if '%choice%'=='8' goto :choice8
if '%choice%'=='9' goto :choice9
if '%choice%'=='10' goto :choice10
if '%choice%'=='11' goto :choice11
if '%choice%'=='12' goto :choice12
if '%choice%'=='13' goto :choice13
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
timeout /t -1
cls
goto start
goto end


:choice2
cls
echo отчищаю C:\Windows\Temp...
echo .
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp чистка закончена!
timeout /t -1
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


:choice5
cls
cd %SYSTEMROOT%\system32
explorer.exe
timeout /t 5
goto start
goto end


:choice6
cls
cd %SYSTEMROOT%\system32
taskmgr.exe
timeout /t 5
goto start
goto end


:choice7
cls
cd %SYSTEMROOT%\system32
cmd.exe
timeout /t 5
goto start
goto end


:choice8
cls
cd %SYSTEMROOT%\system32
control.exe
timeout /t 5
goto start
goto end


:choice9
cls
cd %SYSTEMROOT%\system32
msinfo32.exe
timeout /t 5
goto start
goto end


:choice10
cls
cd %SYSTEMROOT%\system32
dxdiag.exe
timeout /t 5
goto start
goto end


:choice11
cls
cd %SYSTEMROOT%\system32
notepad.exe
timeout /t 5
goto start
goto end


:choice12
cls
cd %SYSTEMROOT%\system32
perfmon.exe
timeout /t 5
goto start
goto end


:choice13
cls
cd %SYSTEMROOT%\system32
winver.exe
timeout /t 5
goto start
goto end


:choice101
cls
echo Выключение через 30 сек
shutdown /s 
goto end


:choice102
cls
echo Разлог через 3 сек
shutdown /l
pause
goto end


:choice103
cls
echo Перезагрузка через 3 сек
shutdown /r
goto end