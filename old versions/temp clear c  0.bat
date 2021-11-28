@ECHO OFF

:START

ECHO Temp чистка by Russanandres
ECHO [1] отчистка appdata\temp
ECHO [2] отчистка Windows\temp
ECHO [3] показать файлы appdata\temp
ECHO [4] показать файлы Windows\temp
ECHO [5] выйти.

SET /P CHOICE="Выберите требуемую опцию: "

IF %CHOICE%==5 ( EXIT /B 0 ) ELSE ( CALL :CMD_%CHOICE% )

VER > NUL

ECHO.
ECHO Bat фаил от Russanandres
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