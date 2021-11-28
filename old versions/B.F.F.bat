@echo off
:RELOAD_SCRIPT
echo версии раньше XP неподдерживаются
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
set ver=2.9.1
set vermenu=5 (5)
REM что ты тут делаешь вообще?
ping localhost -n 1 >nul
goto :Title
                                                           :start
cls
cd %systemroot%\system32
cls
if exist cmd.exe (title Bat For Fun %ver%) ELSE echo ЦЫГАНСКИЕ ФОКУСЫ
echo.                    TIME = %time%    DATE = %date%
echo [ver] Версия скрипта
echo [clean] очистка
echo [run] запустить
echo [off] выключение ПК
echo [game] развлечения
echo [set] настройки
echo [gs] Поиск в интернете
echo [exit] выход
if '%PF%'=='1' (echo [debug] pas Russanandres) ELSE (title Bat For Fun %ver%)
call :randsplash
echo.                %ST%

set /p Ch=Выберите: 
if '%Ch%'=='game' goto :game
if '%Ch%'=='ver' goto :ver
if '%ch%'=='gs' goto :googlesearch
if '%Ch%'=='exit' exit
if '%Ch%'=='off' goto :Restart
if '%Ch%'=='run' goto :run
if '%Ch%'=='set' goto :set
if '%Ch%'=='clean' goto :clean
if '%Ch%'=='clear' goto :clean
goto start


        :set
cls
echo [x] Назад
echo [color] поменять цвет скрипта
echo [Debug] Debug функция
set /p Ch=
if '%Ch%'=='x' goto :start
if '%Ch%'=='Debug' @echo on & ping localhost -n 2 >nul & goto :RELOAD_SCRIPT
if '%Ch%'=='color' goto :color
if '%Ch%'=='3' set r=1
:color
cls
echo [x] Назад
echo На какие цвета поменять?
echo  (Фон + текст)
echo.
echo  0 = Чёрный      8 = серый
echo  1 = Синий       9 = светлый синий
echo  2 = Зелёный     A = светлый зелёный
echo  3 = голубой     B = светлый голубой
echo  4 = красный     C = светлый красный
echo  5 = пурпурный   D = светлый пурпурный
echo  6 = жёлтый      E = светлый жёлтый
echo  7 = белый       F = светлый белый
set /p ch=     
if '%Ch%'=='x' goto :set
if '%Ch%'=='x' goto :start
color %ch%
goto :set

        :googlesearch
cls
echo [x] Назад
echo [b] сразу в браузер
echo.
echo. GOOGLE Поиск
echo. _____________
echo.
echo. Что ищем?
echo.
echo  PS пишите без пробелов иначе скрипт ломается
echo.
set ch=
set /p ch=))
if not defined ch goto :googlesearch
if '%Ch%'=='x' goto :start
if '%ch%'=='b' if EXIST "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.google.com/" & goto start) ELSE start "C:\Program Files\Internet Explorer\iexplore.exe" "https://www.google.com/" & goto start
if EXIST "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "www.google.com/search?q=%ch%") ELSE start "C:\Program Files\Internet Explorer\iexplore.exe" "www.google.com/search?q=%ch%"
echo Найдено "%ch%" с помощью Google.com
ping localhost -n 3 >nul
goto :googlesearch


        :game
cls
cd C:\
IF EXIST SeaBattle.cmd. (ping localhost -n 1 >nul) ELSE echo.&echo.     ::Внимание::&echo.   -----------------&echo.&echo. Один из файлов&echo.     пропал:&echo.&echo.   SeaBattle.cmd&echo.&echo. Он нужен если хотите играть&echo. в морской бой. Скачать можно&echo. из канала в Telegramm.&echo.
IF EXIST snake.cmd. (ping localhost -n 1 >nul) ELSE echo.&echo.     ::Внимание::&echo.   -----------------&echo.&echo. Один из файлов&echo.     пропал:&echo.&echo.   snake.cmd&echo.&echo. Он нужен если хотите играть&echo. в змейку. Скачать можно&echo. из канала в Telegramm.&echo.
echo [x] Назад
echo [try] Угадай число
echo [seab] морской бой
echo [snake] змейка
set /p Ch=
if '%Ch%'=='x' goto :start
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
echo [x] Назад
echo [1] Завершение работы
echo [2] Выйти из системы
echo [3] Перезагрузка
set /p Ch=
if '%Ch%'=='3' shutdown /r /t 1&pause
if '%Ch%'=='2' shutdown /l /t 1&pause
if '%Ch%'=='1' shutdown /s /t 1&pause
if '%Ch%'=='x' goto :start


        :clean
cls
echo [x] Назад
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
if '%Ch%'=='x' goto :start


        :run
cls
cd C:\Program Files\Process Hacker 2
cls
echo OS = %WV%
echo.
echo [x] Назад
echo [kill] убить
echo [1] Explorer
echo [2] диспетчер задач
if exist ProcessHacker.exe (echo [3] Process Hacker 2) ELSE echo [3] Process Hacker 2 не установлен, запуск невозможен
echo [4] командную стоку
echo [5] панель управления
echo [6] О ПК
echo [7] DXDiag
echo [8] Блокнот
echo [9] калькулятор
echo [10] Монитор ресурсов
echo [11] Winver
set /p Ch=
if '%Ch%'=='x' goto start
if '%Ch%'=='1' cd %SYSTEMROOT%\system32&explorer.exe&goto run
if '%Ch%'=='2' cd %SYSTEMROOT%\system32&taskmgr.exe&goto run
if '%Ch%'=='3' cd C:\Program Files\Process Hacker 2&ProcessHacker.exe&goto run
if '%Ch%'=='4' cd %SYSTEMROOT%\system32&cmd.exe&goto run
if '%Ch%'=='5' cd %SYSTEMROOT%\system32&control.exe&goto run
if '%Ch%'=='6' cd %SYSTEMROOT%\system32&msinfo32.exe&goto run
if '%Ch%'=='7' cd %SYSTEMROOT%\system32&dxdiag.exe&goto run
if '%Ch%'=='8' cd %SYSTEMROOT%\system32&notepad.exe&goto run
if '%Ch%'=='9' cd %SYSTEMROOT%\system32&calc.exe&goto run
if '%Ch%'=='10' cd %SYSTEMROOT%\system32&perfmon.exe&goto run
if '%Ch%'=='11' cd %SYSTEMROOT%\system32&winver.exe&goto run
if '%Ch%'=='kill' goto :kill
:kill
cls
msg * эксперементальная функция
echo [x] Назад
echo [1] убить Explorer
echo [2] убить диспетчер задач
echo [u] перезагрузить скрипт
set /p Ch=
if '%Ch%'=='x' goto start
if '%Ch%'=='u' ping localhost -n 4 >nul & goto RELOAD_SCRIPT
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
echo [x] Назад
echo -------------------------------------------------
echo. 
:top
echo. 
set /p guess=
echo. 
if %guess% GTR %answer% ECHO меньше! 
if %guess% LSS %answer% ECHO больше! 
if %guess%==%answer% GOTO EQUAL
if '%guess%'=='Kal(i)' cls & echo ЦЫГАНСКИЕ ФОКУСЫ & title ЦЫГАНСКИЕ ФОКУСЫ & msg * ЦЫГАНСКИЕ ФОКУСЫ & timeout /t -1 & goto start
if '%guess%'=='x' goto :start
goto top
:equal
cls
echo Поздравляю, ты угадал!!! 
echo. 
timeout /t -1
goto start


:ver
cls                  
echo rB@B@B@BOqkr                   J@B@@@B@B@B@X.          7M@@@@B@B@@@2;
echo 8@B@@@B@B@B@B@:               ,@@@B@B@B@B@B@i         .@B@B@B@B@B@B@q
echo NB@BP:::;u@B@B@r              ,B@B@ZJ7LLYLu;          .@@B@MU7LLYYu:.
echo k@@@7     :MB@BF              .@B@B7                   @B@B2         
echo XB@Bv     ,Z@B@U              .B@B@7                  .B@B@1         
echo S@B@u    rM@BMr               .@B@BL                  .BB@Bk         
echo PB@B@B@B@B@@Mi                .B@B@BO8MOBM@7          .M@B@BOZMMMB@i 
echo S@B@B@@@B@B@B@Or              .@B@B@B@B@B@@M           @B@B@@@B@B@Bq.
echo X@@@J     .S@@@@F             .B@B@Xr:iirr7.          .B@B@G7:iirrv  
echo S@B@v       X@B@B             .@B@Bv                   @B@BF         
echo PB@Bv       8B@B@     ..      .B@B@Y           .      .B@B@k         
echo k@B@5:...:7BB@B@v    E@@BJ    .@B@Bu         NB@BF.   .@B@@0.        
echo OB@@@@@B@@@B@BM:    ;@@B@B:   :B@B@5.       .@@B@B7   ,B@B@O,        
echo L@B@B@B@B@BG7.       8B@Bu    .@B@Bu         q@@Bk.   .MB@BN.           
echo Версия скрипта: %ver%
echo Версия меню: %vermenu%
echo.
ver
echo.
timeout /t -1
goto start
:Title
REM ЦЫГАНСКИЕ ФОКУСЫ
title Hello and welcome!
if exist C:\Users set uservar=%Username%
echo                                                                    ░                     
echo ▒████████▓▓▒░                  ▓███████████▓░          ▒███████████▓▒
echo ██████████████▒               ░█████████████▒         ░█████████████▓
echo ▓███▓▒░▒▒▓█████▒              ░████▓▓▒▓▓▓▓▓▒          ░█████▓▒▓▓▓▓▓▒░
echo ▓███▒     ░████▓              ░████▒                  ░████▓         
echo ▓███▓     ░▓███▓              ░████▒                  ░████▓         
echo ▓███▓    ▒████▒               ░████▓                  ░████▓         
echo ▓████████████▒                ░████████████▒          ░██████▓█████▒ 
echo ▓██████████████▒              ░█████████████          ░████████████▓░
echo ▓███▓     ░▓████▓             ░████▓▒▒▒▒▒▒▒░          ░█████▒▒▒▒▒▒▒  
echo ▓███▒       ▓████             ░████▒                  ░████▓         
echo ▓███▓      ░█████     ░░      ░████▓                  ░████▓         
echo ▓███▓░░░░▒▒█████▒    ▓███▓    ░████▓         ▓███▓░   ░████▓░        
echo ███████████████▒    ▒█████▒   ░████▓░       ░█████▒   ░█████░        
echo ▓███████████▒░       ████▓    ░████▓         ▓███▓░   ░████▓░
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
if %a%==4 set ST=Умеешь. Могёшь!
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
if %a%==17 set ST=Чётко!
if %a%==18 set ST=https://t.me/bat_by_RR!
if %a%==19 set ST=КОСМОООООС!
if %a%==20 set ST=Неперводимая куча букв!
if %a%==21 set ST=Кони линугс мое всо!
if %a%==22 set ST=Тортик это ложь!
if %a%==23 set ST=Aperture science в соответствии с Black Mesa!
if %a%==24 set ST=Кажется кто-то писал этот код с лишней хромосомой!
if %a%==25 set ST=В имени науки!
if %a%==26 set ST=Notepad++ это мощь!
if %a%==27 set ST=Что ты сделаешь если жизнь даст тебе лимон?
if %a%==28 set ST=Сделано 1 человеком!
if %a%==29 set ST=Это Красти краб?
if %a%==30 set ST=Сделано с помощью DOS'а!
if %a%==31 set ST=Как тебе такое, Илон Маск?
if %a%==32 set ST=Тебе понравился мой bat?
if %a%==33 set ST=Теперь с багами!
if %a%==34 set ST=1, 2, 3, clear!
if %a%==35 set ST=Ubuntu? Bubuntu!
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
if %a%==50 set ST=Debian GNU/Linux!
if %a%==51 set ST=Скажи моё имя!
if %a%==52 set ST=Пароль: Russanandres!
if %a%==53 set ST=64 битные пк - это имба.. энерджи, лучший напиток для геймеров!