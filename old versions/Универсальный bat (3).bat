@echo off
ver|find "5.1" >nul
if '%errorlevel%'=='0' set wv= XP
ver|find "6.1" >nul
if '%errorlevel%'=='0' set wv= 7
ver|find "6.3" >nul
if '%errorlevel%'=='0' set wv= 8.1
ver|find "10" >nul
if '%errorlevel%'=='0' set wv= 10
set ver=2.7.7
set vermenu=4 FS+ (4FS+)
:start
title ������ᠫ�� bat by Russanandres
color 07
cls
echo.                    TIME = %time%    DATE = %date%
echo [ver] ����� �ਯ�
echo [clean] ���⪠
echo [run] ��������
echo [off] �몫�祭�� ��
echo [game] ࠧ���祭��
echo [exit] ��室

set /p choice=�롥��: 
if '%choice%'=='debug' goto :debug
if '%choice%'=='game' goto :game
if '%choice%'=='ver' goto :ver
if '%choice%'=='cal' goto :cal
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
echo OS = Windows%wv%
timeout /t -1
goto start
:debug
cls
echo Errorlevel = %errorlevel%
echo [1] ��१���㧨�� �ਯ�
echo [2] ���
set /p choice=
if '%choice%'=='1' goto :start
if '%choice%'=='2' exit
:game
cls
cd C:\
IF EXIST SeaBattle.cmd. (echo.) ELSE echo.&echo.     ::��������::&echo.   -----------------&echo.&echo. ���� �� 䠩���&echo.     �ய��:&echo.&echo.   SeaBattle.cmd&echo.&echo. �� �㦥� �᫨ ��� �����&echo. � ���᪮� ���. ������ �����&echo. �� ������ � Telegramm.&echo.
echo [back] �����
echo [try] ������ �᫮
echo [seab] ���᪮� ���
set /p choice=
if '%choice%'=='back' goto :start
if '%choice%'=='try' goto :try
if '%choice%'=='seab' goto :seab
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
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
if '%choice%'=='back' goto :start
:run
cls
echo OS = Windows%wv%
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
if '%choice%'=='1' cd %SYSTEMROOT%\system32&explorer.exe&goto start
if '%choice%'=='2' cd %SYSTEMROOT%\system32&taskmgr.exe&goto start
if '%choice%'=='3' cd %SYSTEMROOT%\system32&cmd.exe&goto start
if '%choice%'=='4' cd %SYSTEMROOT%\system32&control.exe&goto start
if '%choice%'=='5' cd %SYSTEMROOT%\system32&msinfo32.exe&goto start
if '%choice%'=='6' cd %SYSTEMROOT%\system32&dxdiag.exee&goto start
if '%choice%'=='7' cd %SYSTEMROOT%\system32&notepad.exe&goto start
if '%choice%'=='8' cd %SYSTEMROOT%\system32&calc.exe&goto start
if '%choice%'=='9' cd %SYSTEMROOT%\system32&perfmon.exe&goto start
if '%choice%'=='10' cd %SYSTEMROOT%\system32&winver.exe&goto start
:choice1
cls
echo ����� \Appdata\Temp...
echo.
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