:RELOAD_SCRIPT
@echo off
REM ���ᨨ ࠭�� XP �������ন������
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
set ver=2.9
set vermenu=4 HFS+ (4HFS+)
REM �� �� ��� ������� �����?
goto :Title
:start
title ������ᠫ�� bat %ver%
color 07
cls
echo.                    TIME = %time%    DATE = %date%
echo [ver] ����� �ਯ�
echo [clean] ���⪠
echo [run] ��������
echo [off] �몫�祭�� ��
echo [game] ࠧ���祭��
echo [exit] ��室
if '%PF%'=='1' (echo [debug] pas Russanandres) ELSE @echo off
call :randsplash
echo.                %ST%

set /p Ch=�롥��: 
if '%Ch%'=='debug' goto :bug
if '%Ch%'=='game' goto :game
if '%Ch%'=='ver' goto :ver
if '%Ch%'=='exit' exit
if '%Ch%'=='off' goto :Restart
if '%Ch%'=='run' goto :run
if '%Ch%'=='#HL2_title_screen' goto :Title
if '%Ch%'=='2.9' goto :p
if '%Ch%'=='clean' goto :clean
if '%Ch%'=='clear' goto :clean
goto start

:p
cls
title C:\Windows\System32\cmd.exe
echo ᠬ�� ��ࢠ� ����� �⮣� �ਯ�)
ping localhost -n 2 >nul
cls
@echo off
echo clear \Appdata\Temp...
del %USERPROFILE%\appdata\Local\Temp /q /f
echo .
echo \Appdata\Temp clear Done!
echo .
:start
set /p choice=Pokazat files or exit?
if '%choice%'=='1' goto :choice1
if '%choice%'=='2' goto :choice4
if '%choice%'=='Pokazat' goto :choice1
if '%choice%'=='exit' goto :choice4
echo Bat file by Russanandres
goto start
:choice1
cls
cd %USERPROFILE%\appdata\Local\Temp
dir
timeout /t 20
cls
echo clear C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp clear Done!
echo .
:start
set /p choice=Pokazat files or exit?
if '%choice%'=='1' goto :choice3
if '%choice%'=='2' goto :choice2
if '%choice%'=='Pokazat' goto :choice3
if '%choice%'=='exit' goto :choice2
echo Bat file by Russanandres
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
echo clear C:\Windows\temp...
echo .
del C:\Windows\Temp /q /f
echo \Windows\Temp clear Done!
echo .
:start
set /p choice=Pokazat files or exit?
if '%choice%'=='1' goto :choice3
if '%choice%'=='2' goto :choice2
if '%choice%'=='Pokazat' goto :choice3
if '%choice%'=='exit' goto :choice2
echo Bat file by Russanandres
goto end
pause


:bug
cls
echo [back] �����
set /p Ch=������ ��஫�: 
REM ���ᬮ�५ ����!
if '%Ch%'=='Russanandres' goto debug
if '%Ch%'=='back' goto :start
echo ��஫� �� ����!
ping localhost -n 2 >nul
goto bug
:debug
cls
echo Errorlevel = %errorlevel%
echo OS = %WV%
set PF=1
echo [1] ��१���㧨�� �ਯ�
echo [3] ���
set /p Ch=
if '%Ch%'=='1' ping localhost -n 5 >nul & goto RELOAD_SCRIPT
if '%Ch%'=='3' exit
:game
cls
cd C:\
IF EXIST SeaBattle.cmd. (@echo off) ELSE echo.&echo.     ::��������::&echo.   -----------------&echo.&echo. ���� �� 䠩���&echo.     �ய��:&echo.&echo.   SeaBattle.cmd&echo.&echo. �� �㦥� �᫨ ��� �����&echo. � ���᪮� ���. ������ �����&echo. �� ������ � Telegramm.&echo.
IF EXIST snake.cmd. (@echo off) ELSE echo.&echo.     ::��������::&echo.   -----------------&echo.&echo. ���� �� 䠩���&echo.     �ய��:&echo.&echo.   snake.cmd&echo.&echo. �� �㦥� �᫨ ��� �����&echo. � ������. ������ �����&echo. �� ������ � Telegramm.&echo.
echo [back] �����
echo [try] ������ �᫮
echo [seab] ���᪮� ���
echo [snake] ������
set /p Ch=
if '%Ch%'=='back' goto :start
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
echo [back] �����
echo [1] �����襭�� ࠡ���
echo [2] ��� �� ��⥬�
echo [3] ��१���㧪�
set /p Ch=
if '%Ch%'=='3' shutdown /r&pause
if '%Ch%'=='2' shutdown /l&pause
if '%Ch%'=='1' shutdown /s&pause
if '%Ch%'=='back' goto :start
:clean
cls
echo [back] �����
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
if '%Ch%'=='back' goto :start
:run
cls
echo OS = %WV%
echo.
echo [back] �����
echo [kill] 㡨��
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
set /p Ch=
if '%Ch%'=='back' goto start
if '%Ch%'=='1' cd %SYSTEMROOT%\system32&explorer.exe&goto run
if '%Ch%'=='2' cd %SYSTEMROOT%\system32&taskmgr.exe&goto run
if '%Ch%'=='3' cd %SYSTEMROOT%\system32&cmd.exe&goto run
if '%Ch%'=='4' cd %SYSTEMROOT%\system32&control.exe&goto run
if '%Ch%'=='5' cd %SYSTEMROOT%\system32&msinfo32.exe&goto run
if '%Ch%'=='6' cd %SYSTEMROOT%\system32&dxdiag.exe&goto run
if '%Ch%'=='7' cd %SYSTEMROOT%\system32&notepad.exe&goto run
if '%Ch%'=='8' cd %SYSTEMROOT%\system32&calc.exe&goto run
if '%Ch%'=='9' cd %SYSTEMROOT%\system32&perfmon.exe&goto run
if '%Ch%'=='10' cd %SYSTEMROOT%\system32&winver.exe&goto run
if '%Ch%'=='kill' goto :kill
:kill
cls
msg * �ᯥ६��⠫쭠� �㭪��
echo [back] �����
echo [1] 㡨�� Explorer
echo [2] 㡨�� ��ᯥ��� �����
set /p Ch=
if '%Ch%'=='back' goto start
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
:ver
cls                  
echo �   �                                                           �۱۰
echo �� ��                                                            �۱ 
echo �� ۲�� �� ۰ ۱ ��۰ ��� ���۱ ��۰��۲  ��� ��   �� �� ۰  �� �� ��
echo  ۲� �� �� ۰�۱�� ۱�۰۲ ۱�� �۱�� ��  ۲۱�۱  �� �� ۲  �� ۱���
echo  ��� ����� ۲�۱ ۲� �۲۲��  ۰�   ����  � ۰���۱����� ���۰� ۲�۲
echo  �۲ �� �� �۰۱�� ۲��   �� �� ۱  ۲�� �� ۱�� �۱� �� ۰ ۱� �۱��
echo ���  �� �� �� ۲�۲۱ ��۱ ���� ��۱���۱۱ ۱���۱�� �� ��۲�� �� ��
echo  �    �  � �     ��    �� �۰�   ��  �   �     ��      � ���         
echo                           ��                                                                                                  
echo  ��������۲�       ����۱  ������������۲   
echo  ���۱�����۲�     �����۱  �������۲����   
echo  ����    ���۰    ��۱��۲      ��۲        
echo  ���۱����۲     ��۲  ��۱     ��۲        
echo  ���������۲     ��۰   ��۰    ��۲        
echo  ���۰  ����۱  ���۱�����۲    ��۲        
echo  ����     ��۲  �����������۱   ��۲        
echo  ���۲������۱ ��۲� �������۰  ��۲        
echo  ���������۲� ���۰      ���۲  ���۰       
echo        �       �                            
echo ����� �ਯ�: %ver%
echo ����� ����: %vermenu%
echo.
echo OS = %WV%
timeout /t -1
goto start
:Title
REM ��������� ������
title Hello and welcome!
if exist C:\Users set uservar=%Username%
echo                                                                    �                     
echo �   �                                                           �۱۰
echo �� ��                                                            �۱ 
echo �� ۲�� �� ۰ ۱ ��۰ ��� ���۱ ��۰��۲  ��� ��   �� �� ۰  �� �� ��
echo  ۲� �� �� ۰�۱�� ۱�۰۲ ۱�� �۱�� ��  ۲۱�۱  �� �� ۲  �� ۱���
echo  ��� ����� ۲�۱ ۲� �۲۲��  ۰�   ����  � ۰���۱����� ���۰� ۲�۲
echo  �۲ �� �� �۰۱�� ۲��   �� �� ۱  ۲�� �� ۱�� �۱� �� ۰ ۱� �۱��
echo ���  �� �� �� ۲�۲۱ ��۱ ���� ��۱���۱۱ ۱���۱�� �� ��۲�� �� ��
echo  �    �  � �     ��    �� �۰�   ��  �   �     ��      � ���         
echo                           ��                                                             
echo.                                        
echo  ��������۲�       ����۱  ������������۲   
echo  ���۱�����۲�     �����۱  �������۲����   
echo  ����    ���۰    ��۱��۲      ��۲        
echo  ���۱����۲     ��۲  ��۱     ��۲        
echo  ���������۲     ��۰   ��۰    ��۲        
echo  ���۰  ����۱  ���۱�����۲    ��۲        
echo  ����     ��۲  �����������۱   ��۲        
echo  ���۲������۱ ��۲� �������۰  ��۲        
echo  ���������۲� ���۰      ���۲  ���۰    
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
if %a%==4 set ST=Does barrel roll!
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
if %a%==17 set ST=#HL2_title_screen!
if %a%==18 set ST=https://t.me/bat_by_RR!
if %a%==19 set ST=����������!
if %a%==20 set ST=����ࢮ����� ��� �㪢!
if %a%==21 set ST=����� � ���� 2.9!
if %a%==22 set ST=���⨪ �� ����!
if %a%==23 set ST=Aperture science � ᮮ⢥��⢨� � Black Mesa!
if %a%==24 set ST=������� ��-� ��ᠫ ��� ��� � ��譥� �஬�ᮬ��!
if %a%==25 set ST=� ����� ��㪨!
if %a%==26 set ST=���஡� 堪���� ���⠣��!
if %a%==27 set ST=�� �� ᤥ����� �᫨ ����� ���� ⥡� �����?
if %a%==28 set ST=������� 1 祫������!
if %a%==29 set ST=�� ���� �ࠡ?
if %a%==30 set ST=������� � ������� DOS'�!
if %a%==31 set ST=��� ⥡� ⠪��, ���� ���?
if %a%==32 set ST=���� ���ࠢ���� ��� bat?
if %a%==33 set ST=������ � ������!
if %a%==34 set ST=1, 2, 3, clear!
if %a%==35 set ST=���?
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
if %a%==50 set ST=��� debug � ������� ����!
if %a%==51 set ST=����� ��� ���!
if %a%==52 set ST=��஫�: Russanandres!
if %a%==53 set ST=64 ���� �� - �� ����.. �द�, ���訩 ����⮪ ��� �����஢!