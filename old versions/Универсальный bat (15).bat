:RELOAD_SCRIPT
@echo off
REM версии раньше XP неподдерживаются
ver|find "5.1" >nul
if '%errorlevel%'=='0' set WV=Windows XP
ver|find "6.0" >nul
if '%errorlevel%'=='0' set WV=Windows Vista
ver|find "6.1" >nul
if '%errorlevel%'=='0' set WV=Windows 7
ver|find "6.3" >nul
if '%errorlevel%'=='0' set WV=Windows 8.1
ver|find "10" >nul
if '%errorlevel%'=='0' set WV=Windows 10
set ver=2.9
set vermenu=4 HFS+ (4HFS+)
REM что ты тут делаешь вообще?
goto :Title
:start
title Универсальный bat %ver%
color 07
cls
echo.                    TIME = %time%    DATE = %date%
echo [ver] Версия скрипта
echo [clean] очистка
echo [run] запустить
echo [off] выключение ПК
echo [game] развлечения
echo [exit] выход
if '%PF%'=='1' (echo [debug] pas Russanandres) ELSE @echo off
call :randsplash
echo.                %ST%

set /p Ch=Выберите: 
if '%Ch%'=='debug' goto :bug
if '%Ch%'=='game' goto :game
if '%Ch%'=='ver' goto :ver
if '%Ch%'=='exit' exit
if '%Ch%'=='off' goto :Restart
if '%Ch%'=='run' goto :run
if '%Ch%'=='#HL2_title_screen' goto :Title
if '%Ch%'=='2.9' goto :p
if '%Ch%'=='clean' goto :clean
if '%Ch%'=='clear' goto :clean
goto start

:p
cls
title C:\Windows\System32\cmd.exe
echo самая первая версия этого скрипта)
ping localhost -n 2 >nul
cls
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


:bug
cls
echo [back] Назад
set /p Ch=введите пароль: 
REM подсмотрел блет!
if '%Ch%'=='Russanandres' goto debug
if '%Ch%'=='back' goto :start
echo Пароль не верный!
ping localhost -n 2 >nul
goto bug
:debug
cls
echo Errorlevel = %errorlevel%
echo OS = %WV%
set PF=1
echo [1] Перезагрузить скрипт
echo [3] выйти
set /p Ch=
if '%Ch%'=='1' ping localhost -n 5 >nul & goto RELOAD_SCRIPT
if '%Ch%'=='3' exit
:game
cls
cd C:\
IF EXIST SeaBattle.cmd. (@echo off) ELSE echo.&echo.     ::Внимание::&echo.   -----------------&echo.&echo. Один из файлов&echo.     пропал:&echo.&echo.   SeaBattle.cmd&echo.&echo. Он нужен если хотите играть&echo. в морской бой. Скачать можно&echo. из канала в Telegramm.&echo.
IF EXIST snake.cmd. (@echo off) ELSE echo.&echo.     ::Внимание::&echo.   -----------------&echo.&echo. Один из файлов&echo.     пропал:&echo.&echo.   snake.cmd&echo.&echo. Он нужен если хотите играть&echo. в змейку. Скачать можно&echo. из канала в Telegramm.&echo.
echo [back] Назад
echo [try] Угадай число
echo [seab] морской бой
echo [snake] змейка
set /p Ch=
if '%Ch%'=='back' goto :start
if '%Ch%'=='try' goto :try
if '%Ch%'=='seab' goto :seab
if '%Ch%'=='snake' goto :snake
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
set /p Ch=
if '%Ch%'=='3' shutdown /r&pause
if '%Ch%'=='2' shutdown /l&pause
if '%Ch%'=='1' shutdown /s&pause
if '%Ch%'=='back' goto :start
:clean
cls
echo [back] Назад
echo.
echo [1] очистка Appdata\Temp
echo [2] очистка Windows\Temp
echo [3] показать файлы Appdata\Temp
echo [4] показать файлы Windows\Temp
set /p Ch=
if '%Ch%'=='1' goto :Ch1
if '%Ch%'=='2' goto :Ch2
if '%Ch%'=='3' cls&cd %USERPROFILE%\appdata\Local\Temp&dir&timeout /t -1&goto start
if '%Ch%'=='4' cls&cd %SYSTEMROOT%\Temp&dir&timeout /t -1&goto start
if '%Ch%'=='back' goto :start
:run
cls
echo OS = %WV%
echo.
echo [back] Назад
echo [kill] убить
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
set /p Ch=
if '%Ch%'=='back' goto start
if '%Ch%'=='1' cd %SYSTEMROOT%\system32&explorer.exe&goto run
if '%Ch%'=='2' cd %SYSTEMROOT%\system32&taskmgr.exe&goto run
if '%Ch%'=='3' cd %SYSTEMROOT%\system32&cmd.exe&goto run
if '%Ch%'=='4' cd %SYSTEMROOT%\system32&control.exe&goto run
if '%Ch%'=='5' cd %SYSTEMROOT%\system32&msinfo32.exe&goto run
if '%Ch%'=='6' cd %SYSTEMROOT%\system32&dxdiag.exe&goto run
if '%Ch%'=='7' cd %SYSTEMROOT%\system32&notepad.exe&goto run
if '%Ch%'=='8' cd %SYSTEMROOT%\system32&calc.exe&goto run
if '%Ch%'=='9' cd %SYSTEMROOT%\system32&perfmon.exe&goto run
if '%Ch%'=='10' cd %SYSTEMROOT%\system32&winver.exe&goto run
if '%Ch%'=='kill' goto :kill
:kill
cls
msg * эксперементальная функция
echo [back] Назад
echo [1] убить Explorer
echo [2] убить диспетчер задач
set /p Ch=
if '%Ch%'=='back' goto start
if '%Ch%'=='1' taskkill /IM explorer.exe
if '%Ch%'=='2' taskkill /IM taskmgr.exe
goto start
:Ch1
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
:Ch2
cls
echo отчищаю C:\Windows\Temp...
echo.
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp чистка закончена!
timeout /t -1
goto clean
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
:ver
cls                  
echo ▓   ▓                                                           ░█▒█░
echo ██ ▒█                                                            ▓█▒ 
echo ▒█ █▓░█ ▒█ █░ █▒ ███░ ▓██ ░███▒ ░██░▒██▓  ▓██ ▒█   ▒█ ▒█ █░  ░█ ▓░ ▓▓
echo  █▓█ ▒█ ▒█ █░▒█▒░█ █▒░█░█▓ █▒▓█ ██▒░░ ▒█  █▓█▒▒█▒  ▓█ ▓█ █▓  ░█ █▒░██
echo  ░██ ▒████ █▓██▒ █▓█ ▓█▓█▓░█  █░█   ░▓▓█  █ █░░███▒▒████ ████░█ █▓██▓
echo  ░█▓ ▓█ ▓█ ██░█▒░█ █▓▒█   ░█ ░█ █▒  █▓░█ ▒█ █▒▒█ ██▒█ ▓█ █░ █▒█ ██▒▓█
echo ▒██  ▓█ ▒█ ██ █▓░█▓█▒ ███▒ ████ ▓██▒████▒█▒ █▒▒███▒▒█ ▒█ ███▓░█ ██ ██
echo  ▒    ░  ░ ░     ░▒    ▒▒ ░█░░   ░░  ▒   ░     ░▒      ░ ░▒░         
echo                           ░█                                                                                                  
echo  ░████████▓▒       ▒████▒  ░████████████▓   
echo  ░███▒░▒▓███▓░     ▓█████▒  ▒▓▓▓▓███▓▓▓▓░   
echo  ░███    ▒███░    ▓██▒▒██▓      ▒██▓        
echo  ░███▒░▒▒██▓     ░██▓  ▓██▒     ▒██▓        
echo  ░█████████▓     ▓██░   ███░    ▒██▓        
echo  ░███░  ░▓███▒  ▒███▒▒▒▓███▓    ▒██▓        
echo  ░███     ▓██▓  ▓███████████▒   ▒██▓        
echo  ░███▓░▒▒▓███▒ ▓██▓▒ ░░░░▓███░  ▒██▓        
echo  ░█████████▓░ ▒███░      ░███▓  ▓███░       
echo        ░       ░                            
echo Версия скрипта: %ver%
echo Версия меню: %vermenu%
echo.
echo OS = %WV%
timeout /t -1
goto start
:Title
REM ЦЫГАНСКИЕ ФОКУСЫ
title Hello and welcome!
if exist C:\Users set uservar=%Username%
echo                                                                    ░                     
echo ▓   ▓                                                           ░█▒█░
echo ██ ▒█                                                            ▓█▒ 
echo ▒█ █▓░█ ▒█ █░ █▒ ███░ ▓██ ░███▒ ░██░▒██▓  ▓██ ▒█   ▒█ ▒█ █░  ░█ ▓░ ▓▓
echo  █▓█ ▒█ ▒█ █░▒█▒░█ █▒░█░█▓ █▒▓█ ██▒░░ ▒█  █▓█▒▒█▒  ▓█ ▓█ █▓  ░█ █▒░██
echo  ░██ ▒████ █▓██▒ █▓█ ▓█▓█▓░█  █░█   ░▓▓█  █ █░░███▒▒████ ████░█ █▓██▓
echo  ░█▓ ▓█ ▓█ ██░█▒░█ █▓▒█   ░█ ░█ █▒  █▓░█ ▒█ █▒▒█ ██▒█ ▓█ █░ █▒█ ██▒▓█
echo ▒██  ▓█ ▒█ ██ █▓░█▓█▒ ███▒ ████ ▓██▒████▒█▒ █▒▒███▒▒█ ▒█ ███▓░█ ██ ██
echo  ▒    ░  ░ ░     ░▒    ▒▒ ░█░░   ░░  ▒   ░     ░▒      ░ ░▒░         
echo                           ░█                                                             
echo.                                        
echo  ░████████▓▒       ▒████▒  ░████████████▓   
echo  ░███▒░▒▓███▓░     ▓█████▒  ▒▓▓▓▓███▓▓▓▓░   
echo  ░███    ▒███░    ▓██▒▒██▓      ▒██▓        
echo  ░███▒░▒▒██▓     ░██▓  ▓██▒     ▒██▓        
echo  ░█████████▓     ▓██░   ███░    ▒██▓        
echo  ░███░  ░▓███▒  ▒███▒▒▒▓███▓    ▒██▓        
echo  ░███     ▓██▓  ▓███████████▒   ▒██▓        
echo  ░███▓░▒▒▓███▒ ▓██▓▒ ░░░░▓███░  ▒██▓        
echo  ░█████████▓░ ▒███░      ░███▓  ▓███░    
echo.       
echo	   Проснитесь и пойте мистер %username%, проснитесь и пойте.
echo.
ping localhost -n 3 >nul
goto start
:randsplash
set a=
set /a a=(53 * %random%) / 32768 + 1
if %a%==1 set ST=Сделано Russanandres!
if %a%==2 set ST=Теперь в BAT!
if %a%==3 set ST=Стой! тротллинг!
if %a%==4 set ST=Does barrel roll!
if %a%==5 set ST=Для всех!
if %a%==6 set ST=но только для Windows!
if %a%==7 set ST=хрень!
if %a%==8 set ST=Нет конкурентов!
if %a%==9 set ST=Остовайтесь на связи!
if %a%==10 set ST=@DTDPEFEEDBACKBOT!
if %a%==11 set ST=1 доллар по 75 рублей!
if %a%==12 set ST=Мой самый лучший batch!
if %a%==13 set ST=Написано руко.....!
if %a%==14 set ST=Грандиозно!
if %a%==15 set ST=Нет, это Патрик!
if %a%==16 set ST=Теперь с тупизной!
if %a%==17 set ST=#HL2_title_screen!
if %a%==18 set ST=https://t.me/bat_by_RR!
if %a%==19 set ST=КОСМОООООС!
if %a%==20 set ST=Неперводимая куча букв!
if %a%==21 set ST=Напиши в меню 2.9!
if %a%==22 set ST=Тортик это ложь!
if %a%==23 set ST=Aperture science в соответствии с Black Mesa!
if %a%==24 set ST=Кажется кто-то писал этот код с лишней хромосомой!
if %a%==25 set ST=В имени науки!
if %a%==26 set ST=Попробуй хакнуть пентагон!
if %a%==27 set ST=Что ты сделаешь если жизнь даст тебе лимон?
if %a%==28 set ST=Сделано 1 человеком!
if %a%==29 set ST=Это Красти краб?
if %a%==30 set ST=Сделано с помощью DOS'а!
if %a%==31 set ST=Как тебе такое, Илон Маск?
if %a%==32 set ST=Тебе понравился мой bat?
if %a%==33 set ST=Теперь с багами!
if %a%==34 set ST=1, 2, 3, clear!
if %a%==35 set ST=КАК?
if %a%==36 set ST=Now on Russian!
if %a%==37 set ST=LOL!
if %a%==38 set ST=УниверСальный!
if %a%==39 set ST=Plug-and-Play!
if %a%==40 set ST=Кот Зима гений!
if %a%==41 set ST=Я хочу мышку!
if %a%==42 set ST=Я не знаю что ты хочешь, пиши боту!
if %a%==43 set ST=Можно скачать сейчас!
if %a%==44 set ST=МАЙНКРАФТ ЭТО МОЯ ЖИЗНЬ, МАЙНКРААААФТ!
if %a%==45 set ST=Сделано в Китае!
if %a%==46 set ST=Привет, как дела?
if %a%==47 set ST=Вы готовы, дети?
if %a%==48 set ST=Теперь чуть стабильнее!
if %a%==49 set ST=Теперь с играми!
if %a%==50 set ST=Пиши debug в главном меню!
if %a%==51 set ST=Скажи моё имя!
if %a%==52 set ST=Пароль: Russanandres!
if %a%==53 set ST=64 битные пк - это имба.. энерджи, лучший напиток для геймеров!