@echo off
:start
cls
echo ������ᠫ�� bat by Russanandres
echo [96] ����⪠...
echo [97] ��������...
echo [98] �몫�祭�� ��
echo [99] ��室

set /p choice=.
if '%choice%'=='106' goto :choice106
if '%choice%'=='105' goto :choice105
if '%choice%'=='104' goto :choice104
if '%choice%'=='103' goto :choice103
if '%choice%'=='102' goto :choice102
if '%choice%'=='101' goto :choice101
if '%choice%'=='100' goto :start
if '%choice%'=='99' goto :choice99
if '%choice%'=='98' goto :choiceR
if '%choice%'=='97' goto :choicez
if '%choice%'=='96' goto :choiceo
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
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
if '%choice%'=='15' goto :choice15
if '%choice%'=='16' goto :choice16
if '%choice%'=='17' goto :choice17
if '%choice%'=='18' goto :choice18
if '%choice%'=='19' goto :choice19
if '%choice%'=='20' goto :choice20
goto start


:choiceR
cls
echo .
echo [100] �����
echo [101] �몫�祭��
echo [102] ������������
echo [103] ��१��㧪�
set /p choice=.
if '%choice%'=='103' goto :choice103
if '%choice%'=='102' goto :choice102
if '%choice%'=='101' goto :choice101
if '%choice%'=='100' goto :start


:choiceo
cls
echo .
echo [100] �����
echo [1] ����⪠ Appdata\Temp
echo [2] ����⪠ Windows\Temp
echo [3] �������� 䠩�� Appdata\Temp
echo [4] �������� 䠩�� Windows\Temp
set /p choice=.
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
if '%choice%'=='100' goto :start


:choicez
cls
echo .
echo [100] �����
echo [5] �������� Explorer
echo [6] �������� ��ᯥ��� �����
echo [7] �������� ��������� �⮪�
echo [8] �������� ������ �ࠢ�����
echo [9] � ��
echo [10] DXDiag
echo [11] �������
echo [12] ������ ����ᮢ
echo [13] Winver
set /p choice=.
if '%choice%'=='100' goto :start
if '%choice%'=='5' goto :choice5
if '%choice%'=='6' goto :choice6
if '%choice%'=='7' goto :choice7
if '%choice%'=='8' goto :choice8
if '%choice%'=='9' goto :choice9
if '%choice%'=='10' goto :choice10
if '%choice%'=='11' goto :choice11
if '%choice%'=='12' goto :choice12
if '%choice%'=='13' goto :choice13
goto end


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
cls
goto start
goto end


:choice2
cls
echo ����� C:\Windows\Temp...
echo .
del %SYSTEMROOT%\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
timeout /t -1
cls
goto start
goto end


:choice3
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t -1
cls
goto start
goto end


:choice4
cls
cd %SYSTEMROOT%\Temp
dir
timeout /t -1
cls
goto start
goto end


:choice99
Exit
goto end


:choice5
cls
cd %SYSTEMROOT%\system32
explorer.exe
timeout /t 5
goto start
goto end


:choice6
cls
cd %SYSTEMROOT%\system32
taskmgr.exe
timeout /t 5
goto start
goto end


:choice7
cls
cd %SYSTEMROOT%\system32
cmd.exe
timeout /t 5
goto start
goto end


:choice8
cls
cd %SYSTEMROOT%\system32
control.exe
timeout /t 5
goto start
goto end


:choice9
cls
cd %SYSTEMROOT%\system32
msinfo32.exe
timeout /t 5
goto start
goto end


:choice10
cls
cd %SYSTEMROOT%\system32
dxdiag.exe
timeout /t 5
goto start
goto end


:choice11
cls
cd %SYSTEMROOT%\system32
notepad.exe
timeout /t 5
goto start
goto end


:choice12
cls
cd %SYSTEMROOT%\system32
perfmon.exe
timeout /t 5
goto start
goto end


:choice13
cls
cd %SYSTEMROOT%\system32
winver.exe
timeout /t 5
goto start
goto end


:choice101
cls
echo �몫�祭�� �१ 30 ᥪ
shutdown /s 
goto end


:choice102
cls
echo ������ �१ 3 ᥪ
shutdown /l
pause
goto end


:choice103
cls
echo ��१���㧪� �१ 3 ᥪ
shutdown /r
goto end