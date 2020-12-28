@echo off
color 06
set speak=1
set cmds=0
set mode=0
set enabled=2
set f_time=0
set /a hello=%random% %%3 +1 
set /a goodbye=%random% %%3 +1
set hour=%time:~0,5%
if exist ".\f_time.log" (set f_time=1) else (set speak=0)
if exist ".\enabled.log" (set /p enabled="" <".\enabled.log")
set f_path=C:\Program Files (x86)\Steam\steamapps\common\Scrap Mechanic\Survival\Scripts\game
cd ..
echo.
if "%f_time%"=="0" (echo.    __*!Developed by DANser!*__ )
if "%f_time%"=="0" echo.    if you're in trouble contact me on: Telegram (DANser) or Discord (DANser#6915).
rem Greetings for mechanic with enabled dev mode
if "%enabled%"=="1" (IF "%speak%"=="1" (IF "%hello%"=="1" (echo. It's a great honor to see you my King.)))
if "%enabled%"=="1" (IF "%speak%"=="1" (IF "%hello%"=="2" (IF %hour% GEQ 05:00 (IF %hour% LEQ 11:59 (echo. Good morning Your Majesty.)))))
if "%enabled%"=="1" (IF "%speak%"=="1" (IF "%hello%"=="2" (IF %hour% GEQ 12:00 (IF %hour% LEQ 17:59 (echo. Good afternoon Your Majesty.)))))
if "%enabled%"=="1" (IF "%speak%"=="1" (IF "%hello%"=="2" (IF %hour% GEQ 18:00 (IF %hour% LEQ 23:59 (echo. Good evening Your Majesty.)))))
if "%enabled%"=="1" (IF "%speak%"=="1" (IF "%hello%"=="2" (IF %hour% GEQ 00:00 (IF %hour% LEQ 04:59 (echo. Good night Your Majesty.)))))
if "%enabled%"=="1" (IF "%speak%"=="1" (IF "%hello%"=="3" (echo. I am honored by your visit Your Grace.)))
rem "Greetings" for simple mechanic
if "%enabled%"=="0" (IF "%speak%"=="1" (IF "%hello%"=="1" (echo. Ah it's you, beggar, what do you want from me?)))
if "%enabled%"=="0" (IF "%speak%"=="1" (IF "%hello%"=="2" (echo. Peasant, tell me why you came, and don't detain me.)))
if "%enabled%"=="0" (IF "%speak%"=="1" (IF "%hello%"=="3" (echo. Beg me for the honor of giving you my time!)))
echo.
set /p mode=You want to enable or disable dev mode [E/D]?
echo.
rem Chek for logs
if /i "%mode%"=="e" (IF "%enabled%"=="1" (echo. Dev mode is already enabled. & color 04 & timeout /t 5 & exit))
if /i "%mode%"=="d" (IF "%enabled%"=="0" (echo. Dev mode is already disabled. & color 04 & timeout /t 5 & exit))
rem Enables dev mode
if not exist ".\Dev mode script\SurvivalGame.saved" (IF /i "%mode%"=="e" (ren "%f_path%\SurvivalGame.lua" "SurvivalGame.saved")) 
if not exist ".\Dev mode script\SurvivalGame.saved" (IF /i "%mode%"=="e" (move /y "%f_path%\SurvivalGame.saved" ".\Dev mode script"))
if /i "%mode%"=="e" (copy /y ".\Dev mode script\SurvivalGame.lua" "%f_path%")
rem Disables dev mode
if not exist ".\Dev mode script\SurvivalGame.saved" (ren "%f_path%\SurvivalGame.lua" "SurvivalGame.saved")
if not exist ".\Dev mode script\SurvivalGame.saved" (move /y "%f_path%\SurvivalGame.saved" ".\Dev mode script")
if exist "%f_path%\SurvivalGame.lua" (IF /i "%mode%"=="d" (del /q "%f_path%\SurvivalGame.lua"))
if /i "%mode%"=="d" (copy /y ".\Dev mode script\SurvivalGame.saved" "%f_path%")
if /i "%mode%"=="d" (ren "%f_path%\SurvivalGame.saved" "SurvivalGame.lua")
rem Color thing
if %errorlevel% equ 0 (color 0a)
if %errorlevel% equ 1 (color 04)
rem Creates log files 
if /i "%mode%"=="e" (<nul set /p "=1">".\Dev mode script\enabled.log")
if /i "%mode%"=="d" (<nul set /p "=0">".\Dev mode script\enabled.log")
if not exist ".\Dev mode script\f_time.log" (echo 0> ".\Dev mode script\f_time.log")
echo.
if /i "%mode%"=="e" (set /p cmds=Need the list of commands [Y/N]?)
IF /i "%cmds%"=="y" (type ".\Dev mode script\commands.txt" | more)
echo.
rem Partings for mechanic with enabled dev mode
if /i "%mode%"=="e" (IF "%speak%"=="1" (IF "%goodbye%"=="1" (echo. I hope to see you again my King.)))
if /i "%mode%"=="e" (IF "%speak%"=="1" (IF "%goodbye%"=="2" (echo. Good health Your Highness!)))
if /i "%mode%"=="e" (IF "%speak%"=="1" (IF "%goodbye%"=="3" (echo. All the best Your Lordship!)))
rem "Partings" for simple mechanic
if /i "%mode%"=="d" (IF "%speak%"=="1" (IF "%goodbye%"=="1" (echo. You are just a peasant now.)))
if /i "%mode%"=="d" (IF "%speak%"=="1" (IF "%goodbye%"=="2" (echo. Time is up, now get out of here.)))
if /i "%mode%"=="d" (IF "%speak%"=="1" (IF "%goodbye%"=="3" (echo. Now you are my lifelong debtor.)))
echo.
pause