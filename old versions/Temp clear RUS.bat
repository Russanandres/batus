@echo off
echo Temp ��⪠ by Russanandres
timeout /t 5
echo ����� \Appdata\Temp...
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp ��⪠ �����祭�!
echo .
:start
set /p choice=�������� 䠩�� ��� �த������?
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice4
if '%choice%'=='��������' goto :choice1
if '%choice%'=='�த������' goto :choice4
echo Bat 䠨� �� Russanandres
goto start
:choice1
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t 20
cls
echo ����� C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
echo .
:start
set /p choice=�������� files or exit?
if '%choice%'=='1' goto :choice3
if '%choice%'=='2' goto :choice2
if '%choice%'=='��������' goto :choice3
if '%choice%'=='�த������' goto :choice2
echo Bat 䠨� �� Russanandres
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
echo ����� C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
echo .
:start
set /p choice=�������� files or exit?
if '%choice%'=='1' goto :choice3
if '%choice%'=='2' goto :choice2
if '%choice%'=='��������' goto :choice3
if '%choice%'=='�த������' goto :choice2
echo Bat 䠨� �� Russanandres
goto end
pause