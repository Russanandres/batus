@echo off
:RELOAD_SCRIPT
REM ���ᨨ ࠭�� XP �������ন������
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
set ver=2.9.7 Kernel Panic
set vermenu=5 NetGraph
REM �� �� ��� ������� �����?
ping localhost -n 1 >nul
goto :Title
                                                           :start
cls
cd %systemroot%\system32
cls
if exist cmd.exe (cd ../../.. & title Batus %ver%) ELSE set crash=cmd.exe& Goto :crash
echo.                    �६� = %time%    ��� = %date%
echo [ver] ����� �ਯ�
echo [clean] ���⪠
echo [run] ��������
echo [net] ����
echo [off] �몫�祭�� ��
echo [game] ����
echo [gs] ���� � ���୥�
echo [set] ����ன��
echo [exit] ��室
call :randsplash
echo.                %ST%

set /p Ch=�롥��:
if '%Ch%'=='game' goto :game
if '%Ch%'=='D' goto :Debug
if '%Ch%'=='ver' goto :ver
if '%ch%'=='gs' goto :googlesearch
if '%Ch%'=='exit' cls & title cmd & exit /B
if '%Ch%'=='off' goto :Restart
if '%Ch%'=='net' goto :NET
if '%Ch%'=='run' goto :run
if '%Ch%'=='set' goto :set
if '%Ch%'=='clean' goto :clean
if '%Ch%'=='clear' goto :clean
goto start

        :set
cls
echo [x] �����
echo [color] �������� 梥� �ਯ�
echo [Debug] Debug �㭪��
set /p Ch=
if '%Ch%'=='x' goto :start
if '%Ch%'=='Debug' goto Debug
if '%Ch%'=='color' goto :color
:color
cls
echo [x] �����
echo �� ����� 梥� ��������?
echo  (��� + ⥪��)
echo.
echo  0 = ����      8 = ���
echo  1 = �����       9 = ᢥ�� ᨭ��
echo  2 = �����     A = ᢥ�� �����
echo  3 = ���㡮�     B = ᢥ�� ���㡮�
echo  4 = ����     C = ᢥ�� ����
echo  5 = ������   D = ᢥ�� ������
echo  6 = ����      E = ᢥ�� ����
echo  7 = ����       F = ᢥ�� ����
echo.
echo [w] ��� ������⭮
echo [d] �񬭠� ⥬�
echo [l] ���⫠� ⥬�
call :color 2
call :echo "[color]" /
set /p ch=:
if '%Ch%'=='x' goto :set
if '%Ch%'=='d' color 0f & goto set
if '%Ch%'=='l' color f0 & goto set
if '%Ch%'=='w' cls & color /? & timeout /t -1 & goto set
color %ch%
goto :color

        :NET
cls
echo BETA
echo [x] �����
echo [h] ������
echo ������� �������� ��� ᫮�� ����, �.�. �� ping 8.8.8.8, � 8.8.8.8
echo ������ ip ����:
call :color 2
call :echo "[ping]" /
set /p ch=:
if '%Ch%'=='x' goto :start
if '%Ch%'=='h' cls & ping & pause & goto NET
ping %ch%
pause
goto :NET

        :googlesearch
cls
echo [x] �����
echo [b] �ࠧ� � ��㧥�
echo.
echo. GOOGLE ����
echo. _____________
echo.
echo. �� �饬?
echo.
echo  PS �᫨ ���� � �஡����� - ���� � ����窠� - "������ ��� ��ᯫ�⭮ ��� ��� � ॣ����樨"
echo.
set ch=
set /p ch=))
if not defined ch goto :googlesearch
if '%Ch%'=='x' goto :start
if '%ch%'=='b' if EXIST "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.google.com/" & goto start) ELSE start "C:\Program Files\Internet Explorer\iexplore.exe" "https://www.google.com/" & goto start
if EXIST "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" (start "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "www.google.com/search?q=%ch%") ELSE start "C:\Program Files\Internet Explorer\iexplore.exe" "www.google.com/search?q=%ch%"
echo ������� "%ch%" � ������� Google.com
ping localhost -n 3 >nul
goto :googlesearch


        :game
cls
echo [x] �����
echo [try] ������ �᫮
echo [seab] ���᪮� ���
echo [snake] ������
set /p Ch=
if '%Ch%'=='x' goto :start
if '%Ch%'=='try' goto :try
if '%Ch%'=='seab' cd %USERPROFILE%\appdata\local\Temp\RarSFX0\Games & start SeaBattle.cmd & timeout /t -1 & goto start 
if '%Ch%'=='snake' cd %USERPROFILE%\appdata\Local\Temp\RarSFX0\Games & start snake.cmd & timeout /t -1 & goto start

:snake
cls
cd C:\
IF EXIST SeaBattle.cmd. (cd c:\&start snake.cmd&timeout /t -1&goto start) ELSE echo ������� 䠨� "snake.cmd" � ��७� ��᪠ C:\
timeout /t -1
goto start
:seab
cls
cd C:\
IF EXIST SeaBattle.cmd. (cd c:\&start SeaBattle.cmd&timeout /t -1&goto start) ELSE echo ������� 䠨� "SeaBattle.cmd" � ��७� ��᪠ C:\
timeout /t -1
goto start


        :Restart
cls
echo.
echo [x] �����
echo [1] �����襭�� ࠡ���
echo [2] ��� �� ��⥬�
echo [3] ��१���㧪�
set /p Ch=
if '%Ch%'=='3' shutdown /r /t 1&pause
if '%Ch%'=='2' shutdown /l /t 1&pause
if '%Ch%'=='1' shutdown /s /t 1&pause
if '%Ch%'=='x' goto :start


        :clean
cls
echo [x] �����
echo.
echo [1] ���⪠ Appdata\Temp
echo [2] ���⪠ Windows\Temp
echo [3] ���⪠ �ᥣ�
echo [4] �������� 䠩�� Appdata\Temp
echo [5] �������� 䠩�� Windows\Temp
set /p Ch=
if '%Ch%'=='1' goto :ClearAppdataTemp
if '%Ch%'=='2' goto :ClearWindowsTemp
if '%Ch%'=='3' goto :AppdataANDwindowsTempClear
if '%Ch%'=='4' cls&cd %USERPROFILE%\appdata\Local\Temp&dir&timeout /t -1&goto start
if '%Ch%'=='5' cls&cd %SYSTEMROOT%\Temp&dir&timeout /t -1&goto start
if '%Ch%'=='x' goto :start


        :run
cls
cd C:\Program Files\Process Hacker 2
cls
echo OS = %WV%
echo.
echo [x] �����
echo [kill] 㡨��
if exist C:\adb (echo [adb] Android Debug Bridge) ELSE echo.
echo [1] Explorer
echo [2] ��ᯥ��� �����
if exist ProcessHacker.exe (echo [3] Process Hacker 2) ELSE echo [3] Process Hacker 2 �� ��⠭�����, ����� ����������
echo [4] ��������� �⮪�
echo [5] ������ �ࠢ�����
echo [6] � ��
echo [7] DXDiag
echo [8] �������
echo [9] ��������
echo [10] ������ ����ᮢ
echo [11] Winver
echo [12] PowerShell
echo [13] Diskpart
set /p Ch=
if '%Ch%'=='x' goto start
if '%Ch%'=='1' cd %SYSTEMROOT%\system32&explorer.exe&goto run
if '%Ch%'=='2' cd %SYSTEMROOT%\system32&taskmgr.exe&goto run
if '%Ch%'=='3' cd C:\Program Files\Process Hacker 2&ProcessHacker.exe&goto run
if '%Ch%'=='4' echo. & echo �⮡� ��� ������ "exit" & echo. & cd %SYSTEMROOT%\system32&cmd.exe&goto run
if '%Ch%'=='5' cd %SYSTEMROOT%\system32&control.exe&goto run
if '%Ch%'=='6' cd %SYSTEMROOT%\system32&msinfo32.exe&goto run
if '%Ch%'=='7' cd %SYSTEMROOT%\system32&dxdiag.exe&goto run
if '%Ch%'=='8' cd %SYSTEMROOT%\system32&notepad.exe&goto run
if '%Ch%'=='9' cd %SYSTEMROOT%\system32&calc.exe&goto run
if '%Ch%'=='10' cd %SYSTEMROOT%\system32&perfmon.exe&goto run
if '%Ch%'=='11' cd %SYSTEMROOT%\system32&winver.exe&goto run
if '%Ch%'=='12' cls & echo. & echo �⮡� ��� ������ "exit" & echo. & cd %SYSTEMROOT%\system32\WindowsPowerShell\v1.0&powershell.exe&goto run
if '%Ch%'=='13' cd %SYSTEMROOT%\system32&diskpart.exe&goto run
if '%Ch%'=='adb' cd C:\ADB & start %SYSTEMROOT%\system32\cmd.exe
if '%Ch%'=='kill' goto :kill
:kill
cls
echo [x] �����
echo [1] 㡨�� Explorer
echo [2] 㡨�� ��ᯥ��� �����
echo [u] ��१���㧨�� �ਯ�
set /p Ch=
if '%Ch%'=='x' goto start
if '%Ch%'=='u' ping localhost -n 4 >nul & goto RELOAD_SCRIPT
if '%Ch%'=='1' taskkill /IM explorer.exe
if '%Ch%'=='2' taskkill /IM taskmgr.exe
goto start


:ClearAppdataTemp
cls
echo ����� \Appdata\Temp...
echo.
ping localhost -n 2 >nul
del %USERPROFILE%\appdata\Local\Temp /q /f
echo.
echo \Appdata\Temp ��⪠ �����祭�!
echo.
timeout /t -1
goto clean
:ClearWindowsTemp
cls
echo ����� C:\Windows\Temp...
echo.
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
timeout /t -1
goto clean
:AppdataANDwindowsTempClear
cls
echo ����� \Appdata\Temp...
echo.
ping localhost -n 2 >nul
del %USERPROFILE%\appdata\Local\Temp /q /f
echo.
echo \Appdata\Temp ��⪠ �����祭�!
echo.
timeout /t -1
cls
echo ����� C:\Windows\Temp...
echo.
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
timeout /t -1
goto clean


        :try
cls
title ��� 㣠��� �᫮ seJma, ��ॢ� Russanandres
set /a answer=%RANDOM%
echo -------------------------------------------------
echo �ਢ��, �� ��� 㣠��� �᫮
echo. 
echo ���஡� 㣠���� �᫮
echo.
echo [x] �����
echo -------------------------------------------------
echo. 
:top
echo. 
set /p guess=
echo. 
if %guess% GTR %answer% ECHO �����! 
if %guess% LSS %answer% ECHO �����! 
if %guess%==%answer% GOTO TryWin
if '%guess%'=='Kal(i)' cls & echo ��������� ������ & title ��������� ������ & msg * ��������� ������ & timeout /t -1 & goto start
if '%guess%'=='x' goto :start
goto top
:TryWin
cls
echo ����ࠢ���, �� 㣠���!!! 
echo. 
timeout /t -1
goto start


:ver
cls
echo.
echo    66608080977                                                                                 
echo   78808088808882                          252                                                  
echo    808       8086                         080                                                  
echo    088        808                         808                                                  
echo    888        080       1808888882     88808080888    080        7887      708080802           
echo    080       0887      088277 74808    12780871251    888        1801     8087  7780           
echo    808712258885        7        7808      088         888        7087    908                   
echo    88880808880817                880      888         888        7807    7805                  
echo    888       70800         714452808      088         080        7087     180801               
echo    080         0887    7808080888080      808         808        7887       76808087           
echo    888         2889   7888       808      088         080        7087           78087          
echo    880         8807   888        880      888         808        0807             808          
echo    808       70889    0887     70888      8807        7808     108087    87      7885          
echo   788880808880887      8808080885888       0808880     1808088801 885    88088808882           
echo    7777171777            798067  717        750857       758047   12       1988817     
echo.
echo ����� �ਯ�: %ver%
echo ����� ����: %vermenu%
echo.
ver
echo.
timeout /t -1
goto start
:Title
REM ��������� ������
cls
title Good morning, and welcum to the... ehh... this script like hell...
ping localhost -n 1 >nul
title Good morning, and welcome to the Batus transit system.
if exist C:\Users set uservar=%Username%     
echo.
echo.
echo.
echo    �����۲��                                                                 
echo    �����������                     ��                                        
echo    ���     ����                   ���                                        
echo    ���      ���     �����۲�    ����۲���   ���      ���     �����۱         
echo    ���     ��۱    ���۲����۰  ���������   ���      ���    ��۲���۱        
echo    ����������      ��      ���     ��       ���      ���   ���               
echo    ��۲�۲���۲            ���    ���       ���      ���    ��۱             
echo    ���       ���    ����������    ���       ���      ���     ����۲�         
echo    ���       ���   ��۱    ���    ���       ���      ���        ���۲        
echo    ���       ���  ���      ���    ���       ���      ���          ���        
echo    ��۲��������    ��۱�������     ��۱��    ��۲�������   �۲�����۲        
echo    ��������۲�      �����۱���     ������     ������  ��   �������۱  
echo.
echo	   ��᭨��� � ���� ����� %username%, ��᭨��� � ����.
echo.
ping localhost -n 3 >nul
goto start
:Crash
cls
echo.
echo     RRQQBBBBR2i                                                                                 
echo    iBBQBQBBBBBBBq                          PDb                                                  
echo    .BBB      .BBBQ                         BBB                                                  
echo    .BBB        BBB                         BBB                                                  
echo    .BBB        QBB      .SBBBQBBBQq     BBBQBBBBBQB    QBQ        uQBu      UBBBBBBQP           
echo    .BBQ       QBB7      BBQPr::7DBBB.   XPUBBBUXqZq    BBB        5BBq     BBBY:.:JBB           
echo    .BBBuqPbEBBBE        i        iBBB      BBB         QBB        uBBu    MBB                   
echo    .BBBBBBQBQBBBX:                BBB      BBB         BBB        JBBU    uBBE                  
echo    .BBB       rBBQQ        :YKgDEPBBB      BBB         BBB        jBBu     XBBBBq:              
echo    .BBQ         BBBY    iBBBBBBBBBBBB      BBB         BBB        sBB1       7QBBBQB:           
echo    .BBB         PQBR   JBBB       BQB      BBB         BBQ        7QBj           7BBBJ          
echo    .QBB         BBB7   BBB        BBB      BBB         BBB.       QBBU             BBB          
echo    .BBB       vBBBg    BBB2     7BBBB      BBBv        vBBB.    XBBBB1    Br      YQBb          
echo    iBBBBBBBBBBBBQi      QBBBBBQBBbBBB      :BBQBBBB     SBBBBBBBBq.BBE    BBQBBBBBBBP           
echo     Ysjj2UIUur.          .ugBBR7  :qj        7dQBZ7       vdBBgr   5P:     :IMBBBqr             
echo                                                                                              
echo.
echo ����� �ਯ�: %ver%
echo.
echo ��������! �����㦥� ᡮ� �ਯ� �맢���� "%crash%". ���஡�� ��१���㧨�� �ਯ� ��� ������� � https://t.me/Russanandres
echo.
ver
echo.
timeout /t -1
Exit /b
:Debug
cls
echo.
echo errorlevel = %errorlevel%
echo.
echo [1]:RELOAD_SCRIPT
echo [2]:Crash
echo [3]:kill
echo [4]:Title
echo [on] ������� �⪫����
echo [off] �몫���� �⪫����
set /p Ch=�롥��:
if '%Ch%'=='1' goto :RELOAD_SCRIPT
if '%Ch%'=='2' set crash=Debug Menu& goto :Crash
if '%Ch%'=='3' goto :kill
if '%Ch%'=='4' goto :Title
if '%Ch%'=='on' @echo on & ping localhost -n 2 >nul & goto :RELOAD_SCRIPT
if '%Ch%'=='off' @echo off & ping localhost -n 2 >nul & goto :RELOAD_SCRIPT
goto Debug



:color
 set c=%1& exit/b
 
:echo
 for /f %%i in ('"prompt $h& for %%i in (.) do rem"') do (
  pushd "%~dp0"& <nul>"%~1_" set/p="%%i%%i  "& findstr/a:%c% . "%~1_*"
  (if "%~2" neq "/" echo.)& del "%~1_"& popd& set c=& exit/b
 )




:randsplash
set a=
set /a a=(53 * %random%) / 32768 + 1
if %a%==1 set ST=������� Russanandres!
if %a%==2 set ST=������ � BAT!
if %a%==3 set ST=�⮩! ��⫫���!
if %a%==4 set ST=Then the batus is sus!
if %a%==5 set ST=��� ���!
if %a%==6 set ST=�� ⮫쪮 ��� Windows!
if %a%==7 set ST=�७�!
if %a%==8 set ST=��� �����७⮢!
if %a%==9 set ST=��⮢����� �� �裡!
if %a%==10 set ST=�������⢪��#0420!
if %a%==11 set ST=1 ������ �� 75 �㡫��!
if %a%==12 set ST=��� ᠬ� ���訩 batch!
if %a%==13 set ST=500 ��ப ����, �� ��� 祣�?
if %a%==14 set ST=�࠭������!
if %a%==15 set ST=���, �� ���ਪ!
if %a%==16 set ST=������ � �㯨����!
if %a%==17 set ST=��⪮!
if %a%==18 set ST=https://t.me/bat_by_RR!
if %a%==19 set ST=����������!
if %a%==20 set ST=����ࢮ����� ��� �㪢!
if %a%==21 set ST=���� �����!
if %a%==22 set ST=���⨪ �� ����!
if %a%==23 set ST=Aperture science � ᮮ⢥��⢨� � Black Mesa!
if %a%==24 set ST=������� ��-� ��ᠫ ��� ��� � ��譥� �஬�ᮬ��!
if %a%==25 set ST=��ப�� Russanandres ����, �� �ᥣ�� � ����!
if %a%==26 set ST=Notepad++!
if %a%==27 set ST=�� �� ᤥ����� �᫨ ����� ���� ⥡� �����?
if %a%==28 set ST=������� 1 祫������!
if %a%==29 set ST=�� ���� �ࠡ?
if %a%==30 set ST=������� � ������� DOS'�!
if %a%==31 set ST=��� ⥡� ⠪��, ���� ���?
if %a%==32 set ST=Access denied!
if %a%==33 set ST=������ � ������!
if %a%==34 set ST=1, 2, 3, clear!
if %a%==35 set ST=Ububububububububuntu!
if %a%==36 set ST=Now on Russian!
if %a%==37 set ST=LOL!
if %a%==38 set ST=�����������!
if %a%==39 set ST=Plug-and-Play!
if %a%==40 set ST=��� ���� �����!
if %a%==41 set ST=� ��� ����!
if %a%==42 set ST=�� ��, ������ ४���� ��孮�࠯��?
if %a%==43 set ST=����� ᪠��� ᥩ��!
if %a%==44 set ST=��������� ��� ��� �����, ������������!
if %a%==45 set ST=������� � ��⠥!
if %a%==46 set ST=BffAlpha.sh
if %a%==47 set ST=�� ��⮢�, ���?
if %a%==48 set ST=������ ���� �⠡��쭥�!
if %a%==49 set ST=������ � ��ࠬ�!
if %a%==50 set ST=Debian GNU/Linux!
if %a%==51 set ST=sussy balls!
if %a%==52 set ST=Just Do It!
if %a%==53 set ST=64 ���� �� - �� ����.. �द�, ���訩 ����⮪ ��� �����஢!