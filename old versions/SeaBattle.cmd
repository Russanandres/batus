@ echo off
setlocal enabledelayedexpansion

call :init
call :scene 0 7

:continue
call :menu

:: Сторона (1 - игрок, 2 - компьютер)
set side=%errorlevel%

call :start

:game
call :gameOver
call :show %finish%
if %finish% neq 0 goto finish
if %side% equ 1 (
  call :player
) else (
  call :computer
)
goto game

:finish
if %finish% equ 1 call :writeLn 1A " + + + ВЫ ВЫИГРАЛИ + + +"
if %finish% equ 2 call :writeLn 1C " - - - ВЫ ПРОИГРАЛИ - - -"
echo:
pause
if %finish% equ 1 (
  mode con cols=80 lines=30
  call :scene 5 2
  mode con cols=80 lines=25
)
goto continue

:: ===============
:: ИГРОВЫЕ ФУНКЦИИ
:: ===============

:computer
:: Ход компьютера
  0<nul set /p .=Ход компьютера: 
  call :state%state%
  if %kill% equ 1 (
    set play.%row%.%col%=1
  ) else (
    set play.%row%.%col%=-2
    set side=1
  )
exit /b

:state1
:: Прострел
:: %row%  - строка выстрела
:: %col%  - столбец выстрела
:: %kill% - результат выстрела (1 - попал, 0 - мимо)
:: TODO: стрелять туда, куда можно поставить максимальное число кораблей максимальной длины
  call :rnd 0 9 row
  call :rnd 0 9 col
  call :freedom %row% %col% play
  if %errorlevel% equ 0 goto state1
  call :rnd 0 1 pki
  set /a pkj=pki-1
  for /l %%m in (1, 1, 2) do (
    set ln=0
    set k=0
    for /l %%n in (1, 1, 2) do (
      :state1_1
      set /a i=%row%+!pki!*!ln!
      set /a j=%col%+!pkj!*!ln!
      call :freedom !i! !j! play
      if !errorlevel! equ 1 (
        set /a k+=1
        set /a ln+=1
        goto state1_1
      )
      set /a pki=-!pki!
      set /a pkj=-!pkj!
      set ln=1    
    )
    call :maxShip
    if !k! geq !errorlevel! (
      set bool=1
      goto state1_2
    )
    set bool=0
    set pki=%pkj%
    set pkj=%pki%
  )
  :state1_2
  if %bool% equ 0 goto :state1
  call :killed %row% %col% kill
  if %kill% equ 1 (
    set pi=%row%
    set pj=%col%
    set len=1
    call :maxShip
    if !errorlevel! gtr 1 (set state=2) else set /a ship.1-=1
  )
exit /b

:state2
:: Обстрел
:: %row%  - строка выстрела
:: %col%  - столбец выстрела
:: %kill% - результат выстрела (1 - попал, 0 - мимо)
  set old=!play.%pi%.%pj%!
  set play.%pi%.%pj%=-1
  :state2_1
  set /a row=pi+pki
  set /a col=pj+pkj
  call :freedom %row% %col% play
  set plus=%errorlevel%
  set /a row=pi-pki
  set /a col=pj-pkj
  call :freedom %row% %col% play
  set minus=%errorlevel%
  if %plus% equ 0 if %minus% equ 0 (
    set pki=%pkj%
    set pkj=%pki%
  )
  call :rnd 0 1 rnd
  if %rnd% equ 0 (
    set /a row=%pi%+%pki%
    set /a col=%pj%+%pkj%
  ) else (
    set /a row=%pi%-%pki%
    set /a col=%pj%-%pkj%
  )
  call :freedom %row% %col% play
  if %errorlevel% equ 0 goto state2_1
  call :killed %row% %col% kill
  if %kill% equ 1 (
    set len=2
    set state=1
    call :maxShip
    if !errorlevel! gtr 2 (set state=3) else set /a ship.2-=1
  ) else (
    set k=4
    set ki=+1-1+0+0
    set kj=+0+0+1-1
    for /l %%n in (0, 2, 7) do (
      set /a i=%pi%!ki:~%%n,2!
      set /a j=%pj%!kj:~%%n,2!
      call :freedom !i! !j! play
      if !errorlevel! equ 0 set /a k-=1
    )
    if !k! lss 2 (
      set state=1
      set /a ship.1-=1
    )
  )
  set play.%pi%.%pj%=%old%
exit /b

:state3
:: Расстрел
:: %1 - флаг, 1 - просто проверка, без выстрела
:: %row%  - строка выстрела
:: %col%  - столбец выстрела
:: %kill% - результат выстрела (1 - попал, 0 - мимо)
:: TODO: есть баг, не отметил сразу подбитый корабль игрока
  set flag=0
  :state3_1
  set row=%pi%
  set col=%pj%
  :state3_2
  if !play.%row%.%col%! equ 1 (
    set /a row+=%pki%
    set /a col+=%pkj%
    goto state3_2
  )
  set /a i=%row%-%pki%
  set /a j=%col%-%pkj%
  set old=!play.%i%.%j%!
  set play.%i%.%j%=-1
  call :freedom %row% %col% play
  set bool=%errorlevel%
  set play.%i%.%j%=%old%
  if %bool% equ 1 goto state3_3
  set /a pki=-%pki%
  set /a pkj=-%pkj%
  if %flag% equ 1 goto state3_3
  set flag=1
  goto state3_1
  :state3_3
  if %bool% equ 1 (
    if not "%1"=="" exit /b
    call :killed %row% %col% kill
    if !kill! equ 1 (
      set /a len+=1
      call :maxShip
      if !errorlevel! equ !len! (
        set /a ship.!len!-=1
        set state=1
      )
    ) else (
      set trow=%row%
      set tcol=%col%
      set play.%row%.%col%=-2
      call :state3 1
      set row=!trow!
      set col=!tcol!
    )
  ) else (
    set /a ship.%len%-=1
    set state=1
    if "%1"=="" call :state1
  )
exit /b

:maxShip
:: Самый большой корабль игрока
:: %ERRORLEVEL% - длина самого большого корабля (0 - игрок проиграл)
  setlocal
  set max=0
  for /l %%i in (1, 1, 4) do if !ship.%%i! gtr 0 set max=%%i
endlocal & exit /b %max%

:killed
:: Проверка хода компьютера
:: %1 - строка
:: %2 - столбец
:: %3 - имя переменной для записи результата (1 - попал, 0 - мимо)
  setlocal
  call :coordToLabel %1 %2 aim
  echo %aim%
  echo:
  call :choice "Мимо" "Попал"
  endlocal & set /a %~3=%errorlevel%-1
exit /b

:player
:: Ход игрока
  set /p aim=Ваш ход: 
  call :labelToCoord "%aim%" row col
  set val=!comp.%row%.%col%!
  if "%val%"=="" goto player1
  if %val% equ 0 goto player2
  if %val% equ -1 goto player2
  :player1
  call :beep
  goto player
  :player2
  echo:
  if %val% equ 0 (
    call :writeLn 1A " + + + ПОПАЛ + + +"
    set /a comp.%row%.%col%=1
  ) else (
    call :writeLn 1C " - - - МИМО - - -"
    set /a comp.%row%.%col%=-2
    set side=2
  )
  echo:
  pause
exit /b

:coordToLabel
:: Получить метку из координат цели
:: %1 - строка
:: %2 - столбец
:: %3 - переменная для записи метки
  setlocal
  set cols=ABCDEFGHIJ
  set aim=!cols:~%2,1!%1
  endlocal & set %~3=%aim%
exit /b

:labelToCoord
:: Получить координаты цели из метки
:: %1 - метка
:: %2 - переменная для записи строки
:: %3 - переменная для записи столбца
  setlocal
  call :upperCase "%~1" aim
  set row=%aim:~-1%
  set col=%aim:~0,-1%
  set c=0
  for %%a in (A B C D E F G H I J) do (
    if "%%a"=="%col%" set col=!c!
    set /a c+=1
  )
  endlocal & set %~2=%row%&set %~3=%col%
exit /b

:gameOver
:: Проверка окончания игры
:: %finish% - результат (0 - игра продолжается, 1 - игрок выиграл, 2 - игрок проиграл)
  set finish=1
  for /l %%i in (0, 1, 9) do (
    for /l %%j in (0, 1, 9) do if !comp.%%i.%%j! equ 0 set finish=0
  )
  call :maxShip
  if %errorlevel% equ 0 set finish=2
exit /b

:init
:: Инициализация игры
  mode con cols=80 lines=25
  title Морской бой (v1.0)
  color 1F
  cls
  call :randomize
exit /b

:scene
:: Движение объекта из ресурса
:: %1 - номер данных ресурса
:: %2 - количество строк воды
  setlocal
  set space=
  for /l %%i in (1, 1, 160) do set space= !space!
  set pos=-140
  :scene1
  set text=
  for /f "tokens=2* delims=#" %%s in ('findstr.exe /b /l "%1#" "%~f0"') do (
    if "%%s"=="." (
      set line=%space:~0,80%
    ) else (
      if %pos% lss 0 (
        set line=!space:~%pos%!%%s%space%
        set line=!line:~0,80!
      ) else (
        set line=%%s%space%
        set line=!line:~%pos%,80!
      )
    )
    set text=!text!!line!
  )
  set water=
  set /a cnt=%2 * 80
  for /l %%i in (1, 1, %cnt%) do set water=░!water!
  cls
  echo %text%%water%
  set /a pos+=1
  if %pos% leq 100 goto scene1
endlocal & exit /b

:menu
:: Главное меню
:: %ERRORLEVEL% - кто начинает (1 - игрок, 2 - компьютер)
  setlocal
  cls
  call :print 1
  call :writeLn 1B "                                            (c) Arigato Software, 2012. RR, 2020"
  echo:
  echo МЕНЮ ИГРЫ
  echo:
  call :choice "Игрок начинает" "Компьютер начинает" "Правила игры" "Выход"
  set result=%errorlevel%
  cls
  if %result% equ 3 (
    call :print 2 1E
    goto menu
  )
  if %result% equ 4 exit 0
  call :print 3 1E
endlocal & exit /b %result%

:start
:: Запуск игры
  call :print 4
  0<nul set /p .=Расставляю корабли: ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
  :: Значения на игровом поле:
  ::  1 - подбитый корабль
  ::  0 - целый корабль
  :: -1 - нет корабля
  :: -2 - точка промаха
  call :ships comp
  call :diffic comp
  set maxDiffic=%errorlevel%
  :: верхний предел цикла - количество расстановок (40)
  for /l %%n in (1, 1, 40) do (
    0<nul set /p .=█
    call :ships tmpComp
    call :diffic tmpComp
    if !errorlevel! gtr !maxDiffic! (
      set maxDiffic=!errorlevel!
      call :copy tmpComp comp
    )
  )
  call :dispose tmpComp
  call :clear play
  for /l %%i in (1, 1, 4) do set /a ship.%%i=5 - %%i
  set state=1
  cls    
exit /b

:clear
:: Очистка игрового поля
:: %1 - имя переменной для очистки
  for /l %%i in (0, 1, 9) do (
    for /l %%j in (0, 1, 9) do set %~1.%%i.%%j=-1
  )
exit /b

:dispose
:: Освобождение памяти от игрового поля
:: %1 - имя переменной для удаления
  for /l %%i in (0, 1, 9) do (
    for /l %%j in (0, 1, 9) do set %~1.%%i.%%j=
  )
exit /b

:copy
:: Копирование игрового поля
:: %1 - имя переменной, содержащей копируемое игровое поле
:: %2 - имя переменной, куда копировать
  for /l %%i in (0, 1, 9) do (
    for /l %%j in (0, 1, 9) do set %~2.%%i.%%j=!%~1.%%i.%%j!
  )
exit /b

:freedom
:: Определение, можно ли поставить однопалубный корабль в заданную позицию
:: %1 - номер строки
:: %2 - номер столбца
:: %3 - имя переменной, содержащей игровое поле
:: %ERRORLEVEL% - результат (1 - можно, 0 - нельзя)
  setlocal
  set ki=+0+1+0-1+1-1+1-1
  set kj=+1+0-1+0+1+1-1-1
  set result=0
  if %1 geq 0 if %1 leq 9 if %2 geq 0 if %2 leq 9 if !%~3.%1.%2! equ -1 (
    for /l %%i in (0, 2, 15) do (
      set /a di=%1!ki:~%%i,2!
      set /a dj=%2!kj:~%%i,2!
      if !di! geq 0 if !di! leq 9 if !dj! geq 0 if !dj! leq 9 (
        set /a val=%~3.!di!.!dj!
        if !val! geq 0 goto freedom1
      )
    )
    set result=1
  )
  :freedom1
endlocal & exit /b %result%

:diffic
:: Расчет сложности игровой позиции
:: %1 - имя переменной, содержащей игровое поле
:: %ERRORLEVEL% - результат
  setlocal
  set result=0
  for /l %%i in (0, 1, 9) do (
    for /l %%j in (0, 1, 9) do (
      call :freedom %%i %%j "%~1"
        if !errorlevel! equ 1 set /a result+=1
    )
  )
endlocal & exit /b %result%

:ships
:: Расстановка кораблей компьютера
:: %1 - имя переменной, содержащей игровое поле
  call :clear "%~1"
  for /l %%n in (3, -1, 0) do (
    set /a cnt=3-%%n
    for /l %%m in (0, 1, !cnt!) do call :build %%n "%~1"
  )
exit /b

:build
:: Размещение корабля на игровом поле
:: %1 - размер корабля на единицу меньше устанавливаемого (0-3)
:: %2 - имя переменной, содержащей игровое поле
  set /a i0=%random% %% 10
  set /a j0=%random% %% 10
  set /a ki=%random% %% 2
  set /a kj=1-ki
  for /l %%n in (0, 1, %1) do (
    set /a i=i0+ki*%%n
    set /a j=j0+kj*%%n
    call :freedom !i! !j! "%~2"
    if !errorlevel! equ 0 (
      goto build
    )
  )
  for /l %%n in (0, 1, %1) do (
    set /a i=i0+ki*%%n
    set /a j=j0+kj*%%n
    set /a %~2.!i!.!j!=0
  )
exit /b

:show
:: Вывод игровой ситуации
:: %1 - флаг, 0 - не показывать корабли компьютера
  setlocal
    cls
    echo:
    echo       Поле компьютера           Поле игрока      
    echo:
    echo     A B C D E F G H I J     A B C D E F G H I J     Корабли игрока
    echo    ┌───────────────────┐   ┌───────────────────┐
    set len=4
    set cnt=1
    set c=0
    for /l %%i in (0, 1, 9) do (
      :: Поле компьютера
      set line=  %%i│
      for /l %%j in (0, 1, 9) do (
        set cell=░
        set val=!comp.%%i.%%j!
        if !val! equ 0 if not "%~1"=="0" set cell=■
        if !val! equ -2 set cell=∙
        if !val! equ 1 set cell=*
        set line=!line!!cell! 
      )
      :: Поле игрока
      set line=!line!│  %%i│
      for /l %%j in (0, 1, 9) do (
        set cell=░
        set val=!play.%%i.%%j!
        if !val! equ -2 set cell=∙
        if !val! equ 1 set cell=*
        set line=!line!!cell! 
      )
      set line=!line!│       
      :: Корабли игрока
      set /a alives=ship.!len!
      if !c! lss !alives! (set cell=■) else set cell=*
      for /l %%j in (1, 1, !len!) do (
        set line=!line!!cell! 
      )
      set /a c+=1
      if !c! equ !cnt! (
        set /a len-=1
        set /a cnt+=1
        set c=0
      )
      echo !line!
    )
    echo    └───────────────────┘   └───────────────────┘
    echo:
endlocal & exit /b

:: =======================
:: ВСПОМОГАТЕЛЬНЫЕ ФУНКЦИИ
:: =======================

:print
:: Вывод текста из ресурса
:: %1 - номер данных ресурса
:: %2 - цвет первой строки (необязательный параметр)
  setlocal
  set first=1
  for /f "tokens=2* delims=#" %%s in ('findstr.exe /b /l "%1#" "%~f0"') do (
    if "%%s"=="~" (
      pause
      cls
      set first=1
    ) else (
      if !first! equ 1 (
        if not "%~2"=="" (
          call :writeLn %~2 "%%s"
          if not "%%s"=="." set first=0
        ) else echo%%s
      ) else echo%%s
    )
  )
endlocal & exit /b

:write
:: Вывести цветную надпись без перевода строки
:: %1 - цвет
:: %2 - текст надписи
:: %3 - флаг, любое значение, если нужно двоеточие в конце строки
  setlocal
  :write1
  set "tempFolder=%TEMP%\%~n0.%time:~-2%.%random%"
  md "%tempFolder%" 2>nul || goto write1
  pushd %tempFolder%
  set /p .=.<nul>"%~2"
  findstr /a:%~1 /c:"." /s "%~2"
  if "%~3"=="" (set /p .=  <nul) else set /p .= <nul
  popd
  rd /s /q "%tempFolder%" 2>nul
endlocal & exit /b

:writeLn
:: Вывести цветную надпись с переводом строки
:: %1 - цвет
:: %2 - текст надписи
:: %3 - флаг, любое значение, если нужно двоеточие в конце строки
  call :write %1 "%~2" %3
  echo:
exit /b

:choice
:: Выбор пользователем одного из вариантов
:: Параметры - варианты выбора
:: %ERRORLEVEL% - выбранный вариант
  setlocal
  if "%~1"=="" (
    set result=0
    pause
    goto choice3
  )
  set count=0
  :choice1
  set /a count+=1
  echo  %count%. %~1
  shift
  if not "%~1"=="" goto choice1
  :choice2
  set /p result=Ваш выбор (1-%count%): 
  for /l %%i in (1, 1, %count%) do if "%result%"=="%%i" goto choice3
  call :beep
  goto choice2
  :choice3
endlocal & exit /b %result%

:beep
:: Подача звукового сигнала
  setlocal
  0<nul set /p strTemp=
endlocal & exit /b

:upperCase
:: Преобразование текстовой строки к верхнему регистру
:: %1 - исходная строка
:: %2 - переменная для записи результата
  setlocal
  set strTemp=%~1
  for %%a in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ъ Ы Ь Э Ю Я) do set strTemp=!strTemp:%%a=%%a!
  endlocal & set %~2=%strTemp%
exit /b

:randomize
:: Регенерация счетчика случайных чисел
  setlocal
  set rndTemp=%random%
endlocal & exit /b

:rnd
:: Генерация случайного числа из заданного диапазона
:: %1 - минимальное значение
:: %2 - максимальное значение
:: %3 - имя переменной для записи результата
  set /a %~3=%1+(%2-%1+1)*%random%/32768
exit /b

:: =================
:: ТЕКСТОВЫЕ РЕСУРСЫ
:: =================

:: Корабль
0#.
0#                           -                    
0#                          3                
0#                                        
0#                      3                      
0#              q$v        $               
0#                        
0#         v                            
0#           -                      q         
0#        v          -              
0#    o      q       - 3         
0#                                          
0#                                 
0#                          -
0#                
0#              -     

:: Логотип
1#.
1#                                                ■■■                    ■■■    
1#.
1#      ■■   ■■  ■■■■  ■■■■   ■■■■  ■■ ■■  ■■■■  ■■  ■■     ■■■■  ■■■■  ■■  ■■  
1#      ■■   ■■ ■■  ■■ ■■ ■■ ■■  ■■ ■■ ■■ ■■  ■■ ■■ ■■■     ■■   ■■  ■■ ■■ ■■■  
1#      ■■■ ■■■ ■■  ■■ ■■ ■■ ■■     ■■■■  ■■  ■■ ■■ ■■■     ■■   ■■  ■■ ■■ ■■■  
1#      ■■■ ■■■ ■■  ■■ ■■ ■■ ■■     ■■■   ■■  ■■ ■■ ■■■     ■■■■ ■■  ■■ ■■ ■■■  
1#      ■■■ ■■■ ■■  ■■ ■■■■  ■■     ■■■■  ■■  ■■ ■■■ ■■     ■■ ■■■■  ■■ ■■■ ■■  
1#      ■■ ■ ■■ ■■  ■■ ■■    ■■  ■■ ■■ ■■ ■■  ■■ ■■■ ■■     ■■ ■■■■  ■■ ■■■ ■■  
1#      ■■ ■ ■■ ■■  ■■ ■■    ■■  ■■ ■■ ■■ ■■  ■■ ■■■ ■■     ■■ ■■■■  ■■ ■■■ ■■  
1#      ■■ ■ ■■  ■■■■  ■■     ■■■■  ■■ ■■  ■■■■  ■■  ■■     ■■■■  ■■■■  ■■  ■■
1#.

:: Правила игры
2#                     ПРАВИЛА ИГРЫ МОРСКОЙ БОЙ (стр. 1 из 2)
2#.
2# "Морской бой" - игра для двух  участников, в которой  игроки по очереди называюткоординаты на неизвестной им карте соперника. Если у соперника по этим координа-там имеется  корабль (координаты заняты), то корабль  или его часть "топится", апопавший получает право  сделать еще один ход. Цель игрока - первым поразить всекорабли противника.
2#.
2# Игровое поле - квадрат 10x10 каждого игрока, на котором  размещается флот кораб-лей. Горизонтали  нумеруются сверху  вниз (0-9), а вертикали  помечаются буквамислева направо (A-J).
2#.
2# Размещаются:
2#    1 корабль - ряд из 4 клеток ("четырехпалубные")
2#    2 корабля - ряд из 3 клеток ("трехпалубные")
2#    3 корабля - ряд из 2 клеток ("двухпалубные")
2#    4 корабля - 1 клетка ("однопалубные")
2# При размещении корабли не могут касаться друг друга углами.
2#.
2# Рядом со "своим" квадратом  чертится "чужой"  такого же размера, только  пустой.Это участок моря, где плавают чужие корабли противника.
2# При попадании в корабль  противника - на чужом  поле ставится  крестик. Попавшийстреляет еще раз.
2#.
2#~
2#                     ПРАВИЛА ИГРЫ МОРСКОЙ БОЙ (стр. 2 из 2)
2#.
2# Перед началом боевых действий игроки договариваются, кто будет ходить первым.
2#.
2# Игрок, выполняющий ход, совершает выстрел - указывает координаты клетки, в кото-рой, по его мнению, находится корабль противника, например, "J0" (верхняя праваяклетка).
2#.
2#    1. Если выстрел  пришелся в клетку, не занятую ни одним  кораблем противника,то следует ответ "Мимо" и стрелявший игрок ставит на чужом квадрате в этом местеточку. Право хода переходит к сопернику.
2#.
2#    2. Если выстрел  пришелся в клетку, где находится  корабль, то следует  ответ"Попал". Стрелявший игрок ставит на чужом  поле в эту клетку крестик, а его про-тивник ставит  крестик на своем поле также в эту клетку. Стрелявший  игрок полу-чает право на еще один выстрел.
2#.
2# Победителем считается тот, кто первым потопит все 10 кораблей противника. Проиг-равший имеет право изучить после окончания игры у соперника игровое поле.
2#.
2#~

:: Подсказка в начале игры
3#                               ПОДСКАЗКА К ИГРЕ
3#.
3# Для игры вам понадобится чистый тетрадный листок в клеточку.
3# Нарисуйте на листе два игровых поля размером 10x10 клеток каждое:
3#.
3#       A B C D E F G H I J       A B C D E F G H I J
3#     _|_|_|_|_|_|_|_|_|_|_|    _|_|_|_|_|_|_|_|_|_|_|
3#    0_|_|_|_|_|_|_|_|_|_|_|   0_|_|_|_|_|_|_|_|_|_|_|
3#    1_|_|_|_|_|_|_|_|_|_|_|   1_|_|_|_|_|_|_|_|_|_|_|
3#    2_|_|_|_|_|_|_|_|_|_|_|   2_|_|_|_|_|_|_|_|_|_|_|
3#    3_|_|_|_|_|_|_|_|_|_|_|   3_|_|_|_|_|_|_|_|_|_|_|
3#    4_|_|_|_|_|_|_|_|_|_|_|   4_|_|_|_|_|_|_|_|_|_|_|
3#    5_|_|_|_|_|_|_|_|_|_|_|   5_|_|_|_|_|_|_|_|_|_|_|
3#    6_|_|_|_|_|_|_|_|_|_|_|   6_|_|_|_|_|_|_|_|_|_|_|
3#    7_|_|_|_|_|_|_|_|_|_|_|   7_|_|_|_|_|_|_|_|_|_|_|
3#    8_|_|_|_|_|_|_|_|_|_|_|   8_|_|_|_|_|_|_|_|_|_|_|
3#    9_|_|_|_|_|_|_|_|_|_|_|   9_|_|_|_|_|_|_|_|_|_|_|
3#.
3# Пронумеруйте клетки, как показано на рисунке.
3#.
3# Расположите на левом поле свои корабли в соответствии с правилами игры.
3#.
3#~

:: Яхта
4#                       ...^v^
4#                                    $:... ^v^..
4#                           ... ^v^     $$
4#                                    $ $$
4#                                    $$$ :..... ^v^
4#                        ... ^v^       $$ .
4#                                  $$$ 
4#                                  $ $  :::..... ^v^
4#                                 $$ $  
4#                                $$$ $  
4#                               $$$$ $  
4#                              $$$$$ $  
4#                            $$$$$$$ $  
4#                           $$$$$$$$ $ 
4#                        $ $$$$$$$$$ $ 
4#                        $$ $        $$$     $$$$$   $$
4#                         $$$$$$$$$$$$$$$$$$$$$$$ $$$$.
4#                          $$$$$$$$$$$$$$$$$$$$$$$$$$
4#  ..-+*°*+-..  ~~~*°*~~~  ..-+*°*+-.. ..-+*°*+-..  ~~~*°*~~~  ..-+*°*+-.. ~~~*°
4# ~~~  ..-+*°*+-..~~~~  ..-+*°*+-.. ~~~  ..-+*°*+-..~~~~  ..-+*°*+-.. ..-+*°*+-..
4#  ..-+*~~°*+-..  ..-+*~~~~°*+-.. *+-...-+*° ..-+*~~°*+-..  ..-+*~~~~°*+-.. *+-..
4#  .~*°*~~~~  ..-+*~~~~°*+-.. *.-+*°*+-.. .~*°*~~~~  ..-+*~~~~°*+-.. *.-+*°*+-.. 
4#.

:: Фрегат
5#                                gg                            
5#                cggN            NgT            Fgg            
5#                iggc      Tggggggg              KN            
5#           gggggggg        Bgggggg        Fggggggh            
5#            Ngggggg       TNNhhhdg         KgggggN            
5#           gggggggg       gggggggggggggggTHhhhHhNh            
5#                 gg        Fggggggggggggg       Ah            
5#          Ngggggggggggggg Eggggggggggggg  Fggggggggggggg      
5#           dgggggggggggF ggggggggggggggR YggggggggggggH       
5#         AggggggggggggR TgggggggggggggN  ggggggggggggg        
5#         ggggggggggggg  HgggggggggggggB  ggggggggggggg        
5#         ggggggggggggg  NgggggggggggggH cggggggggggggg        
5#       dgggggggggggggg  RggggggggggggggTYggggggggggggg        
5#  gggggi gggggggggggggI  ggggggggggggggg ggggggggggggggR  hgg 
5#  YRgA   ggggggggggggggF ggggggggggggggKIggggggggggggggg  cdI 
5#    dgK    Hg  hgggNdgh    gN Kgggggggd    ggFgTgh      Fgg   
5#     gg   YgX ggRggRgXg  igK gg ggNigFgg  gc gATgN     KggK   
5#      Bgggg  gB EgggggggggAigE  ggggcgEEggihgTgggggggggggg    
5#       gggggdgHhhggKghgdRgNggHhHggghgNggKgBdhggggggggggggi    
5#        Aggggggggggggggggggggggggggggggggggggggggggggggg      
5#         ggggggggggggggggggggggggggggggggggggggggggggggB      
5#          TgggggT  Iggg  Hggh  ggg  Tggg   ggggggggggT        
5#           ggggggggggggggggggggggggggggggggggggggggggg        
5#             gggggggggggggggggggggggggggggggggggggggg         
5#             KHBHBBHHHHBHBHHBHHHgghBBBHBHBBBBBBBBBBBF 
