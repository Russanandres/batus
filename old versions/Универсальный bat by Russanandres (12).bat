@echo off
ver|find "5.0" >nul
if '%errorlevel%'=='0' set windowsversion= 2000&title ०�� ᮢ���⨬��� � Windows 2000&msg * ����饭 ०�� ᮢ���⨬��� � Windows 2000, ������� �㭪樨 ����� ��ࠡ����
ver|find "5.1" >nul
if '%errorlevel%'=='0' set windowsversion= XP
ver|find "6.1" >nul
if '%errorlevel%'=='0' set windowsversion= 7
:start
title ������ᠫ�� bat by Russanandres
cls
echo.                    TIME = %time%    DATE = %date%
echo [ver] ����� �ਯ�
echo [clean] ���⪠
echo [run] ��������
echo [off] �몫�祭�� ��
echo [game] ࠧ���祭��
echo [exit] ��室

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
echo ����� �ਯ�: 2.7.2
echo ����� ����: 4 extented+ (4E+)
timeout /t -1
goto start

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

:seab
cls
cd C:\
IF EXIST SeaBattle.cmd. (cd c:\&start SeaBattle.cmd&timeout /t -1&goto start) ELSE echo ������� 䠨� "SeaBattle.cmd" � ��७� ��᪠ C:\
timeout /t -1
goto start

:Restart
cls
echo .
echo [back] �����
echo [1] �����襭�� ࠡ���
echo [2] ��� �� ��⥬�
echo [3] ��१���㧪�
set /p choice=
if '%choice%'=='3' (
    shutdown /r
	pause
)
if '%choice%'=='2' (
    shutdown /l
	pause
)
if '%choice%'=='1' (
    shutdown /s
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
echo OS = Windows%windowsversion%
echo .
echo [back] �����
echo [1] Explorer
echo [2] ��ᯥ��� �����
echo [3] ��������� �⮪�
echo [4] ������ �ࠢ�����
echo [5] � ��
echo [6] DXDiag
echo [7] �������
echo [8] ������ ����ᮢ
echo [9] Winver
echo [10] ��������
set /p choice=
if '%choice%'=='back' goto :start
if '%choice%'=='1' goto :choice5
if '%choice%'=='2' goto :choice6
if '%choice%'=='3' goto :choice7
if '%choice%'=='4' goto :choice8
if '%choice%'=='5' goto :choice9
if '%choice%'=='6' goto :choice10
if '%choice%'=='7' goto :choice11
if '%choice%'=='8' goto :choice12
if '%choice%'=='9' goto :choice13
if '%choice%'=='10' goto :choice14
:choice1
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
cd %SYSTEMROOT%\system32
explorer.exe
goto start
:choice6
cd %SYSTEMROOT%\system32
taskmgr.exe
goto start
:choice7
cd %SYSTEMROOT%\system32
cmd.exe
goto start
:choice8
cd %SYSTEMROOT%\system32
control.exe
goto start
:choice9
cd %SYSTEMROOT%\system32
msinfo32.exe
goto start
:choice10
cd %SYSTEMROOT%\system32
dxdiag.exe
goto start
:choice11
cd %SYSTEMROOT%\system32
notepad.exe
goto start
:choice12
cd %SYSTEMROOT%\system32
perfmon.exe
goto start
:choice13
cd %SYSTEMROOT%\system32
winver.exe
goto start
:choice14cls
cd %SYSTEMROOT%\system32
calc.exe
goto start