@echo off
:RELOAD_SCRIPT
echo ���ᨨ ࠭�� XP �������ন������
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
REM �� �� ��� ������� �����?
ping localhost -n 1 >nul
goto :Title
                                                           :start
cls
cd %systemroot%\system32
cls
if exist cmd.exe (title Bat For Fun %ver%) ELSE echo ��������� ������
echo.                    TIME = %time%    DATE = %date%
echo [ver] ����� �ਯ�
echo [clean] ���⪠
echo [run] ��������
echo [off] �몫�祭�� ��
echo [game] ࠧ���祭��
echo [set] ����ன��
echo [gs] ���� � ���୥�
echo [exit] ��室
if '%PF%'=='1' (echo [debug] pas Russanandres) ELSE (title Bat For Fun %ver%)
call :randsplash
echo.                %ST%

set /p Ch=�롥��: 
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
echo [x] �����
echo [color] �������� 梥� �ਯ�
echo [Debug] Debug �㭪��
set /p Ch=
if '%Ch%'=='x' goto :start
if '%Ch%'=='Debug' @echo on & ping localhost -n 2 >nul & goto :RELOAD_SCRIPT
if '%Ch%'=='color' goto :color
if '%Ch%'=='3' set r=1
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
set /p ch=     
if '%Ch%'=='x' goto :set
if '%Ch%'=='x' goto :start
color %ch%
goto :set

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
echo  PS ���� ��� �஡���� ���� �ਯ� ��������
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
cd C:\
IF EXIST SeaBattle.cmd. (ping localhost -n 1 >nul) ELSE echo.&echo.     ::��������::&echo.   -----------------&echo.&echo. ���� �� 䠩���&echo.     �ய��:&echo.&echo.   SeaBattle.cmd&echo.&echo. �� �㦥� �᫨ ��� �����&echo. � ���᪮� ���. ������ �����&echo. �� ������ � Telegramm.&echo.
IF EXIST snake.cmd. (ping localhost -n 1 >nul) ELSE echo.&echo.     ::��������::&echo.   -----------------&echo.&echo. ���� �� 䠩���&echo.     �ய��:&echo.&echo.   snake.cmd&echo.&echo. �� �㦥� �᫨ ��� �����&echo. � ������. ������ �����&echo. �� ������ � Telegramm.&echo.
echo [x] �����
echo [try] ������ �᫮
echo [seab] ���᪮� ���
echo [snake] ������
set /p Ch=
if '%Ch%'=='x' goto :start
if '%Ch%'=='try' goto :try
if '%Ch%'=='seab' goto :seab
if '%Ch%'=='snake' goto :snake


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
echo [3] �������� 䠩�� Appdata\Temp
echo [4] �������� 䠩�� Windows\Temp
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
echo [x] �����
echo [kill] 㡨��
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
msg * �ᯥ६��⠫쭠� �㭪��
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


:Ch1
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
:Ch2
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
if %guess%==%answer% GOTO EQUAL
if '%guess%'=='Kal(i)' cls & echo ��������� ������ & title ��������� ������ & msg * ��������� ������ & timeout /t -1 & goto start
if '%guess%'=='x' goto :start
goto top
:equal
cls
echo ����ࠢ���, �� 㣠���!!! 
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
echo ����� �ਯ�: %ver%
echo ����� ����: %vermenu%
echo.
ver
echo.
timeout /t -1
goto start
:Title
REM ��������� ������
title Hello and welcome!
if exist C:\Users set uservar=%Username%
echo                                                                    �                     
echo ��������۲���                  �����������۲�          �����������۲�
echo �������������۱               �������������۱         �������������۲
echo ���۲���������۱              ����۲��������          �����۲��������
echo ���۱     ����۲              ����۱                  ����۲         
echo ���۲     ����۲              ����۱                  ����۲         
echo ���۲    ����۱               ����۲                  ����۲         
echo ������������۱                ������������۱          ������۲����۱ 
echo ��������������۱              ��������������          ������������۲�
echo ���۲     �����۲             ����۲��������          �����۱������  
echo ���۱       �����             ����۱                  ����۲         
echo ���۲      ������     ��      ����۲                  ����۲         
echo ���۲����������۱    ���۲    ����۲         ���۲�   ����۲�        
echo ��������������۱    �����۱   ����۲�       �����۱   �����۰        
echo �����������۱�       ���۲    ����۲         ���۲�   ����۲�
echo.       
echo	   ��᭨��� � ���� ����� %username%, ��᭨��� � ����.
echo.
ping localhost -n 3 >nul
goto start


:randsplash
set a=
set /a a=(53 * %random%) / 32768 + 1
if %a%==1 set ST=������� Russanandres!
if %a%==2 set ST=������ � BAT!
if %a%==3 set ST=�⮩! ��⫫���!
if %a%==4 set ST=������. ������!
if %a%==5 set ST=��� ���!
if %a%==6 set ST=�� ⮫쪮 ��� Windows!
if %a%==7 set ST=�७�!
if %a%==8 set ST=��� �����७⮢!
if %a%==9 set ST=��⮢����� �� �裡!
if %a%==10 set ST=@DTDPEFEEDBACKBOT!
if %a%==11 set ST=1 ������ �� 75 �㡫��!
if %a%==12 set ST=��� ᠬ� ���訩 batch!
if %a%==13 set ST=����ᠭ� �㪮.....!
if %a%==14 set ST=�࠭������!
if %a%==15 set ST=���, �� ���ਪ!
if %a%==16 set ST=������ � �㯨����!
if %a%==17 set ST=��⪮!
if %a%==18 set ST=https://t.me/bat_by_RR!
if %a%==19 set ST=����������!
if %a%==20 set ST=����ࢮ����� ��� �㪢!
if %a%==21 set ST=���� ����� ��� ��!
if %a%==22 set ST=���⨪ �� ����!
if %a%==23 set ST=Aperture science � ᮮ⢥��⢨� � Black Mesa!
if %a%==24 set ST=������� ��-� ��ᠫ ��� ��� � ��譥� �஬�ᮬ��!
if %a%==25 set ST=� ����� ��㪨!
if %a%==26 set ST=Notepad++ �� ����!
if %a%==27 set ST=�� �� ᤥ����� �᫨ ����� ���� ⥡� �����?
if %a%==28 set ST=������� 1 祫������!
if %a%==29 set ST=�� ���� �ࠡ?
if %a%==30 set ST=������� � ������� DOS'�!
if %a%==31 set ST=��� ⥡� ⠪��, ���� ���?
if %a%==32 set ST=���� ���ࠢ���� ��� bat?
if %a%==33 set ST=������ � ������!
if %a%==34 set ST=1, 2, 3, clear!
if %a%==35 set ST=Ubuntu? Bubuntu!
if %a%==36 set ST=Now on Russian!
if %a%==37 set ST=LOL!
if %a%==38 set ST=�����������!
if %a%==39 set ST=Plug-and-Play!
if %a%==40 set ST=��� ���� �����!
if %a%==41 set ST=� ��� ����!
if %a%==42 set ST=� �� ���� �� �� ����, ��� ����!
if %a%==43 set ST=����� ᪠��� ᥩ��!
if %a%==44 set ST=��������� ��� ��� �����, ������������!
if %a%==45 set ST=������� � ��⠥!
if %a%==46 set ST=�ਢ��, ��� ����?
if %a%==47 set ST=�� ��⮢�, ���?
if %a%==48 set ST=������ ���� �⠡��쭥�!
if %a%==49 set ST=������ � ��ࠬ�!
if %a%==50 set ST=Debian GNU/Linux!
if %a%==51 set ST=����� ��� ���!
if %a%==52 set ST=��஫�: Russanandres!
if %a%==53 set ST=64 ���� �� - �� ����.. �द�, ���訩 ����⮪ ��� �����஢!