@echo off
color 06
rem Variables setted by default to something, to prevent crashing
set UserName=0
set WorldName=0
set W_N_input=0
set speak=0
set reset=0
set check=0
rem Variables setted to specific values, don't change those
set F_time=1
set hour=%time:~0,5%
set W_N_extention=.db
set /a hello=%random% %%10 +1 
set /a goodbye=%random% %%10 +1
set m_path=%ProgramFiles(x86)%\Steam\steamapps\common\Scrap Mechanic
echo.
rem First start indicator
if not exist "%m_path%\Survival Backups\F_time.log" (echo %F_time%> "%m_path%\Survival Backups\F_time.log") else (set F_time=0)
if "%F_time%"=="1" (type "%m_path%\Survival Backups\Description_R.txt" | more) else (set speak=1)
rem Greetings, this script has 100 possible "greeting-parting" combinations 
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="1" (echo. Nice to see ya again!)))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="2" (echo. Welcome back.)))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="3" (echo. Hello my friend!)))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="4" (echo. Whats'up?)))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="5" (echo. Hello there.)))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="6" (echo. Hi dear mechanic, how are you?)))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="7" (echo. How was your grinding?)))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="8" (echo. Have you upgraded your base defense?)))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="9" (IF %hour% GEQ 05:00 (IF %hour% LEQ 11:59 (echo. Good morning.)))))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="9" (IF %hour% GEQ 12:00 (IF %hour% LEQ 17:59 (echo. Good afternoon.)))))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="9" (IF %hour% GEQ 18:00 (IF %hour% LEQ 23:59 (echo. Good evening.)))))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="9" (IF %hour% GEQ 00:00 (IF %hour% LEQ 04:59 (echo. Good night.)))))
if "%speak%"=="1" (IF "%reset%"=="0" (IF "%hello%"=="10" (echo. Long time no see.)))
rem Chek
echo.
set /p check="Do you want to restore the world [Y/N]?"
if /i "%check%" neq "y" (exit)
echo.
rem Steam user name input and check
if exist "%m_path%\Survival Backups\Steam user name.log" (set /p UserName="" <"%m_path%\Survival Backups\Steam user name.log") 
if not exist "%m_path%\Survival Backups\Steam user name.log" (color 04 & echo. Wrong order, you must use "Create backup SM.bat" first. & timeout /t 5 & exit) 
rem World name input
set /p W_N_input=Enter world name:
set WorldName=%W_N_input%%W_N_extention%
rem Copy & paste world data base file 
echo.
echo=====Restoring your world...
echo.  
copy /y "%m_path%\Survival Backups\%WorldName%" "%homepath%\AppData\Roaming\Axolot Games\Scrap Mechanic\User\%UserName%\Save\Survival") 
rem Partings
if %errorlevel% equ 0 (IF exist "%m_path%\Survival Backups\reset_wn.tmp" (del "%m_path%\Survival Backups\reset_wn.tmp")) 
if %errorlevel% equ 0 (IF "%goodbye%"=="1" (echo. Bye.))
if %errorlevel% equ 0 (IF "%goodbye%"=="2" (echo. Goodbye.))
if %errorlevel% equ 0 (IF "%goodbye%"=="3" (echo. Good luck!))
if %errorlevel% equ 0 (IF "%goodbye%"=="4" (echo. See you later.))
if %errorlevel% equ 0 (IF "%goodbye%"=="5" (echo. Have a good play time.))
if %errorlevel% equ 0 (IF "%goodbye%"=="6" (echo. Have a good day.))
if %errorlevel% equ 0 (IF "%goodbye%"=="7" (echo. Start from chekpoint.))
if %errorlevel% equ 0 (IF "%goodbye%"=="8" (echo. Restore completed.))
if %errorlevel% equ 0 (IF "%goodbye%"=="9" (echo. Oh geeze, this tapebots...))
if %errorlevel% equ 0 (IF "%goodbye%"=="10" (echo. Here it is, your fresh restored world.))
if %errorlevel% equ 0 (color 0a & timeout /t 5)
if %errorlevel% equ 1 (color 04 & echo. There are no worlds with this name, try again. & echo %reset%> "%m_path%\Survival Backups\reset_wn.tmp" & timeout /t 2 /nobreak & call ".\Create backup SM.bat" & exit)
echo.
