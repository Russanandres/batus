@echo off
echo Temp ��⪠ by Russanandres
echo [1] ����⪠ appdata\temp
echo [2] ����⪠ Windows\temp
echo [3] �������� 䠩�� appdata\temp
echo [4] �������� 䠩�� Windows\temp
echo ��� ��室� ������ Ctrl+C.
:start
set /p choice=.
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice2
if '%choice%'=='3' goto :choice3
if '%choice%'=='4' goto :choice4
echo Bat 䠨� �� Russanandres
goto start
:choice1
cls
timeout /t 5
cls
echo ����� \Appdata\Temp...
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp ��⪠ �����祭�!
echo .
timeout /t 20
cls
echo Temp ��⪠ by Russanandres
echo [1] ����⪠ appdata\temp
echo [2] ����⪠ Windows\temp
echo [3] �������� 䠩�� appdata\temp
echo [4] �������� 䠩�� Windows\temp
echo ��� ��室� ������ Ctrl+C.
goto start
goto end
:choice2
cls
echo ����� C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp ��⪠ �����祭�!
timeout /t 20
cls
echo Temp ��⪠ by Russanandres
echo [1] ����⪠ appdata\temp
echo [2] ����⪠ Windows\temp
echo [3] �������� 䠩�� appdata\temp
echo [4] �������� 䠩�� Windows\temp
echo ��� ��室� ������ Ctrl+C.
goto start
goto end
:choice3
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t 20
cls
echo Temp ��⪠ by Russanandres
echo [1] ����⪠ appdata\temp
echo [2] ����⪠ Windows\temp
echo [3] �������� 䠩�� appdata\temp
echo [4] �������� 䠩�� Windows\temp
echo ��� ��室� ������ Ctrl+C.
goto start
goto end
:choice4
cls
cd C:\Windows\temp
dir
timeout /t 20
cls
echo Temp ��⪠ by Russanandres
echo [1] ����⪠ appdata\temp
echo [2] ����⪠ Windows\temp
echo [3] �������� 䠩�� appdata\temp
echo [4] �������� 䠩�� Windows\temp
echo ��� ��室� ������ Ctrl+C.
goto start
goto end