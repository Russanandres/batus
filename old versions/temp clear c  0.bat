@ECHO OFF

:START

ECHO Temp ��⪠ by Russanandres
ECHO [1] ����⪠ appdata\temp
ECHO [2] ����⪠ Windows\temp
ECHO [3] �������� 䠩�� appdata\temp
ECHO [4] �������� 䠩�� Windows\temp
ECHO [5] ���.

SET /P CHOICE="�롥�� �ॡ㥬�� ����: "

IF %CHOICE%==5 ( EXIT /B 0 ) ELSE ( CALL :CMD_%CHOICE% )

VER > NUL

ECHO.
ECHO Bat 䠨� �� Russanandres
ECHO.

CALL :START

:CMD_1
	DEL %USERPROFILE%\appdata\Local\Temp /q /f
	GOTO :EOF
	
:CMD_2
	DEL C:\Windows\Temp /q /f
	GOTO :EOF
	
:CMD_3
	DIR %USERPROFILE%\appdata\Local\Temp
	GOTO :EOF

:CMD_4
	DIR C:\Windows\Temp
	GOTO :EOF