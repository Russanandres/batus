@echo off
title ������ᠫ�� bat by Russanandres
ver|find "5.0" >nul
if '%errorlevel%'=='0' set windowsversion=Windows 2000
ver|find "5.1" >nul
if '%errorlevel%'=='0' set windowsversion=Windows XP
ver|find "6.0" >nul
if '%errorlevel%'=='0' set windowsversion=Windows Vista
ver|find "6.1" >nul
if '%errorlevel%'=='0' set windowsversion=Windows 7
:start
color
cls
echo %windowsversion%
echo [ver] ����� �ਯ�
echo [clean] ���⪠
echo [run] ��������
echo [off] �몫�祭�� ��
echo [game] ࠧ���祭��
echo [exit] ��室
echo.                    TIME = %time%    DATE = %date%

set /p choice=�롥��: 
if '%choice%'=='Debug' goto :start
if '%choice%'=='game' goto :game
if '%choice%'=='ver' goto :ver
if '%choice%'=='exit' exit
if '%choice%'=='off' goto :Restart
if '%choice%'=='run' goto :run
if '%choice%'=='clean' goto :clean
goto start

:ver
cls
echo ����� �ਯ�: 2.7
echo ����� ����: 4 extented+ (CR LE+)
timeout /t -1
goto :start

:game
cls
echo [back] �����
echo [try] ������
echo [seab] ���᪮� ���
set /p choice=
if '%choice%'=='back' goto :start
if '%choice%'=='try' goto :try
if '%choice%'=='seab' goto :seab

:try
cls
echo ��� 㣠��� seJma, ��ॢ� Russanandres
set /a guessnum=0
set /a answer=%RANDOM%
set variable1=%USERPROFILE%
echo -------------------------------------------------
echo �ਢ��, �� ��� 㣠��� 
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
set /a guessnum=%guessnum% +1
if %guess%==%variable1% ECHO ��襫 ������ �����?, �⢥�: %answer%
goto top
:equal
cls
echo ����ࠢ���, �� 㣠���!!! 
echo. 
echo It took you %guessnum% guesses. 
echo. 
timeout /t -1
goto start

:seab
cls
cd C:\
IF EXIST SeaBattle.cmd. (goto s) ELSE echo ������� 䠨� "SeaBattle.cmd" � ��७� ��᪠ C:\
timeout /t -1
goto start

:s
cd c:\
start SeaBattle.cmd
timeout /t -1
goto start

:Restart
cls
echo .
echo [back] �����
echo [101] �����襭�� ࠡ���
echo [102] ��� �� ��⥬�
echo [103] ��१���㧪�
set /p choice=
if '%choice%'=='103' (
    goto shutdown /r
	pause
)
if '%choice%'=='102' (
    goto shutdown /l
	pause
)
if '%choice%'=='101' (
    goto shutdown /s
	pause
)
if '%choice%'=='back' goto :start
:clean
cls
echo .
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
echo .
echo [back] �����
echo [5] Explorer
echo [6] ��ᯥ��� �����
echo [7] ��������� �⮪�
echo [8] ������ �ࠢ�����
echo [9] � ��
echo [10] DXDiag
echo [11] �������
echo [12] ������ ����ᮢ
echo [13] Winver
echo [14] ��������
set /p choice=
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
if '%choice%'=='14' goto :choice14
:choice1
cls
timeout /t 3
cls
echo ����� \Appdata\Temp...
echo .
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp ��⪠ �����祭�!
echo .
timeout /t -1
goto start
:choice2
cls
echo ����� C:\Windows\Temp...
echo .
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
timeout /t -1
goto start
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
:choice5
cls
cd %SYSTEMROOT%\system32
explorer.exe
timeout /t 5
goto start
:choice6
cls
cd %SYSTEMROOT%\system32
taskmgr.exe
timeout /t 5
goto start
:choice7
cls
cd %SYSTEMROOT%\system32
cmd.exe
timeout /t 5
goto start
:choice8
cls
cd %SYSTEMROOT%\system32
control.exe
timeout /t 5
goto start
:choice9
cls
cd %SYSTEMROOT%\system32
msinfo32.exe
timeout /t 5
goto start
:choice10
cls
cd %SYSTEMROOT%\system32
dxdiag.exe
timeout /t 5
goto start
:choice11
cls
cd %SYSTEMROOT%\system32
notepad.exe
timeout /t 5
goto start
:choice12
cls
cd %SYSTEMROOT%\system32
perfmon.exe
timeout /t 5
goto start
:choice13
cls
cd %SYSTEMROOT%\system32
winver.exe
timeout /t 5
goto start
:choice14cls
cd %SYSTEMROOT%\system32
calc.exe
timeout /t 5
goto start
:choice101
cls
echo �몫�祭�� �१ 30 ᥪ
shutdown /s 
:choice102
cls
echo ������ �१ 3 ᥪ
shutdown /l
pause
:choice103
cls
echo ��१���㧪� �१ 3 ᥪ
shutdown /r