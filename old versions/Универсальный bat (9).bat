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
set ver=2.8.4
set vermenu=4 HFS+ (4HFS+)
:start
title ������ᠫ�� bat by Russanandres
color 07
call :randsplash
cls
echo.                    TIME = %time%    DATE = %date%
echo [ver] ����� �ਯ�
echo [clean] ���⪠
echo [run] ��������
echo [off] �몫�祭�� ��
echo [game] ࠧ���祭��
echo [exit] ��室
echo.                             %splashtext%

set /p choice=�롥��: 
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
echo ����� �ਯ�: %ver%
echo ����� ����: %vermenu%
echo.
echo OS = %windowsversion%
timeout /t -1
goto start
:debugpre
cls
echo [back] �����
set /p choice=������ ��஫�: 
ping localhost -n 2 >nul
if '%choice%'=='Russanandres' goto debug
if '%choice%'=='back' goto :start
goto debugpre
:debug
cls
echo Errorlevel = %errorlevel%
echo OS = %windowsversion%
echo [1] ��१���㧨�� �ਯ�
echo [3] ���
set /p choice=
if '%choice%'=='1' goto :start
if '%choice%'=='3' exit
:game
cls
cd C:\
IF EXIST SeaBattle.cmd. (@echo off) ELSE echo.&echo.     ::��������::&echo.   -----------------&echo.&echo. ���� �� 䠩���&echo.     �ய��:&echo.&echo.   SeaBattle.cmd&echo.&echo. �� �㦥� �᫨ ��� �����&echo. � ���᪮� ���. ������ �����&echo. �� ������ � Telegramm.&echo.
IF EXIST snake.cmd. (@echo off) ELSE echo.&echo.     ::��������::&echo.   -----------------&echo.&echo. ���� �� 䠩���&echo.     �ய��:&echo.&echo.   snake.cmd&echo.&echo. �� �㦥� �᫨ ��� �����&echo. � ������. ������ �����&echo. �� ������ � Telegramm.&echo.
echo [back] �����
echo [try] ������ �᫮
echo [seab] ���᪮� ���
echo [snake] ������
set /p choice=
if '%choice%'=='back' goto :start
if '%choice%'=='try' goto :try
if '%choice%'=='seab' goto :seab
if '%choice%'=='snake' goto :snake
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
echo [back] �����
echo [1] �����襭�� ࠡ���
echo [2] ��� �� ��⥬�
echo [3] ��१���㧪�
set /p choice=
if '%choice%'=='3' shutdown /r&pause
if '%choice%'=='2' shutdown /l&pause
if '%choice%'=='1' shutdown /s&pause
if '%choice%'=='back' goto :start
:clean
cls
echo.
echo [back] �����
echo [1] ���⪠ Appdata\Temp
echo [2] ���⪠ Windows\Temp
echo [3] �������� 䠩�� Appdata\Temp
echo [4] �������� 䠩�� Windows\Temp
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
echo [back] �����
echo [1] Explorer
echo [2] ��ᯥ��� �����
echo [3] ��������� �⮪�
echo [4] ������ �ࠢ�����
echo [5] � ��
echo [6] DXDiag
echo [7] �������
echo [8] ��������
echo [9] ������ ����ᮢ
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
echo ����� \Appdata\Temp...
echo.
ping localhost -n 2 >nul
del %USERPROFILE%\appdata\Local\Temp /q /f
echo.
echo \Appdata\Temp ��⪠ �����祭�!
echo.
timeout /t -1
goto clean
:choice2
cls
echo ����� C:\Windows\Temp...
echo.
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
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
title ��� 㣠��� �᫮ seJma, ��ॢ� Russanandres
set /a answer=%RANDOM%
echo -------------------------------------------------
echo �ਢ��, �� ��� 㣠��� �᫮
echo. 
echo ���஡� 㣠���� �᫮
echo.
echo [back] �����
echo -------------------------------------------------
echo. 
:top
echo. 
set /p guess=
echo. 
if %guess% GTR %answer% ECHO �����! 
if %guess% LSS %answer% ECHO �����! 
if %guess%==%answer% GOTO EQUAL
if '%guess%'=='back' goto :start
goto top
:equal
cls
echo ����ࠢ���, �� 㣠���!!! 
echo. 
timeout /t -1
goto start

:randsplash
set a=
set /a a=(53 * %random%) / 32768 + 1
if %a%==1 set splashtext=Made by Russanandres!
if %a%==2 set splashtext=Completely in Batch!
if %a%==3 set splashtext=Stop! Hammertime!
if %a%==4 set splashtext=Does barrel rolls!
if %a%==5 set splashtext=Free-for-all!
if %a%==6 set splashtext=Only for Windows!
if %a%==7 set splashtext=�७�!
if %a%==8 set splashtext=No refunds!
if %a%==9 set splashtext=Please redistribute!
if %a%==10 set splashtext=Graphic, sort of!
if %a%==11 set splashtext=20 GOTO 10!
if %a%==12 set splashtext=A batch of awesomesause!
if %a%==13 set splashtext=Painstakingly coded!
if %a%==14 set splashtext=Awesome!
if %a%==15 set splashtext=No, this is Patrick!
if %a%==16 set splashtext=Now with stupid!
if %a%==17 set splashtext=Bender is great!
if %a%==18 set splashtext=https://t.me/bat_by_RR!
if %a%==19 set splashtext=That's what she said!
if %a%==20 set splashtext=Incrediballistic!
if %a%==21 set splashtext=Bigger than a bread box!
if %a%==22 set splashtext=Less deceptive than the cake!
if %a%==23 set splashtext=Encouraging the hacker ethic!
if %a%==24 set splashtext=Looks like someone grew an extra 21st chromosome!
if %a%==25 set splashtext=In the name of science!
if %a%==26 set splashtext=Try to hack pentagon!
if %a%==27 set splashtext=Now with App Icons!
if %a%==28 set splashtext=Made of 1 people!
if %a%==29 set splashtext=Is it Crusty Crab?
if %a%==30 set splashtext=Inspired by Jumbax Operating System!
if %a%==31 set splashtext=That's what she said!
if %a%==32 set splashtext=Do u like this bat?
if %a%==33 set splashtext=Now with bugs!
if %a%==34 set splashtext=1, 2, 3, clear!
if %a%==35 set splashtext=HOW?
if %a%==36 set splashtext=Now with Russian!
if %a%==37 set splashtext=LOL!
if %a%==38 set splashtext=�����������!
if %a%==39 set splashtext=Plug-and-Play!
if %a%==40 set splashtext=Now can be a command!
if %a%==41 set splashtext=I want mouse!
if %a%==42 set splashtext=You know you want to!
if %a%==43 set splashtext=Download now!
if %a%==44 set splashtext=My hovercraft is full of eels!
if %a%==45 set splashtext=MADE IN PSKOVS
if %a%==46 set splashtext=Hello, %user%!
if %a%==47 set splashtext=Arr!
if %a%==48 set splashtext=Now more stable!
if %a%==49 set splashtext=Now with Compatibillity desktop!
if %a%==50 set splashtext=Compatibillity update 1.6!
if %a%==51 set splashtext=Dave's not here, man!
if %a%==52 set splashtext=No DEBUG, no color or mouse!
if %a%==53 set splashtext=64 bit machines are a pain!