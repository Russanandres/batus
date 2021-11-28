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
set ver=2.8.5
set vermenu=4 HFS+ (4HFS+)
:start
title Универсальный bat %ver%
color 07
call :randsplash
cls
echo.                    TIME = %time%    DATE = %date%
echo.                              %splashtext%
echo [ver] Версия скрипта
echo [clean] очистка
echo [run] запустить
echo [off] выключение ПК
echo [game] развлечения
echo [exit] выход
echo.                              %splashtext%

set /p choice=Выберите: 
if '%choice%'=='debug' goto :debugpre
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
:debugpre
cls
echo [back] Назад
set /p choice=введите пароль: 
ping localhost -n 2 >nul
if '%choice%'=='Russanandres' goto debug
if '%choice%'=='back' goto :start
echo Пароль не верный!
ping localhost -n 2 >nul
goto debugpre
:debug
cls
echo Errorlevel = %errorlevel%
echo OS = %windowsversion%
echo [1] Перезагрузить скрипт
echo [3] выйти
set /p choice=
if '%choice%'=='1' goto :start
if '%choice%'=='3' exit
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
ping localhost -n 2 >nul
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

:randsplash
set a=
set /a a=(53 * %random%) / 32768 + 1
if %a%==1 set splashtext=Сделано Russanandres!
if %a%==2 set splashtext=Теперь в BAT!
if %a%==3 set splashtext=Стой! тротллинг!
if %a%==4 set splashtext=Does barrel rolls!
if %a%==5 set splashtext=Для всех!
if %a%==6 set splashtext=но только для Windows!
if %a%==7 set splashtext=хрень!
if %a%==8 set splashtext=Нет конкурентов!
if %a%==9 set splashtext=Остовайтесь на связи!
if %a%==10 set splashtext=@DTDPEFEEDBACKBOT!
if %a%==11 set splashtext=20 GOTO 10!
if %a%==12 set splashtext=Мой самый лучший batch!
if %a%==13 set splashtext=Написано руко.....!
if %a%==14 set splashtext=Грандиозно!
if %a%==15 set splashtext=Нет, это Патрик!
if %a%==16 set splashtext=Теперь с тупизной!
if %a%==17 set splashtext=хей, хей, хей! Привет, привет, привет!
if %a%==18 set splashtext=https://t.me/bat_by_RR!
if %a%==19 set splashtext=Это то что я сказал!
if %a%==20 set splashtext=Неперводимая куча букв!
if %a%==21 set splashtext=Больше чем коробка с хлебом!
if %a%==22 set splashtext=Тортик это ложь!
if %a%==23 set splashtext=Aperture science в соответствии с Black Mesa!
if %a%==24 set splashtext=Кажется кто-то писал этот код с лишней хромосомой!
if %a%==25 set splashtext=В имени науки!
if %a%==26 set splashtext=Попробуй хакнуть пентагон!
if %a%==27 set splashtext=Что ты сделаешь если жизнь даст тебе лимон?
if %a%==28 set splashtext=Сделано 1 человеком!
if %a%==29 set splashtext=Это Красти краб?
if %a%==30 set splashtext=Сделано с помощью DOS'а!
if %a%==31 set splashtext=Как тебе такое, Илон Маск?
if %a%==32 set splashtext=Тебе понравился мой bat?
if %a%==33 set splashtext=Теперь с багами!
if %a%==34 set splashtext=1, 2, 3, clear!
if %a%==35 set splashtext=КАК?
if %a%==36 set splashtext=Now on Russian!
if %a%==37 set splashtext=LOL!
if %a%==38 set splashtext=УниверСальный!
if %a%==39 set splashtext=Plug-and-Play!
if %a%==40 set splashtext=Кот Зима гений!
if %a%==41 set splashtext=Я хочу мышку!
if %a%==42 set splashtext=Я не знаю что ты хочешь, пиши боту!
if %a%==43 set splashtext=Можно скачать сейчас!
if %a%==44 set splashtext=МАЙНКРАФТ ЭТО МОЯ ЖИЗНЬ, МАЙНКРААААФТ!
if %a%==45 set splashtext=Сделано в Китае!
if %a%==46 set splashtext=Привет, как дела?
if %a%==47 set splashtext=Вы готовы, дети?
if %a%==48 set splashtext=Теперь чуть стабильнее!
if %a%==49 set splashtext=Теперь с играми!
if %a%==50 set splashtext=Пиши debug в главном меню!
if %a%==51 set splashtext=Скажи моё имя!
if %a%==52 set splashtext=Пароль: Russanandres!
if %a%==53 set splashtext=64 битные пк - это имба.. энерджи, лучший напиток для геймеров!