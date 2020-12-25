@echo off
color 06
rem Variables setted by default to something, to prevent crashing
set steam_u_n=0
set _move=0
set UserName=0
set U_N=0
set WorldName=0
set W_N_input=0
set speak=0
set reset=0
set move_remind=0
rem Variables setted to specific values, don't change those
set F_time=1
set hour=%time:~0,5%
set W_N_extention=.db
set /a hello=%random% %%10 +1 
set /a goodbye=%random% %%10 +1
set m_path=%ProgramFiles(x86)%\Steam\steamapps\common\Scrap Mechanic
echo.
cd ..
rem Creates main directory for backups and stuff
if not exist "%m_path%\Survival Backups" (md "%m_path%\Survival Backups")
if not exist "%m_path%\Survival Backups\Description_B.txt" (move ".\SM backup scripts\Description_B.txt" "%m_path%\Survival Backups")
if not exist "%m_path%\Survival Backups\Description_R.txt" (move ".\SM backup scripts\Description_R.txt" "%m_path%\Survival Backups")
rem Reset indicators
if exist "%m_path%\Survival Backups\reset_un.tmp" (set reset=1) 
if exist "%m_path%\Survival Backups\reset_wn.tmp" (set reset=1)
rem Moves files to the desktop
if not exist "%m_path%\Survival Backups\Move_remind.log" (IF not exist "%homepath%\desktop\SM backup scripts" (IF "%reset%"=="0" (set /p _move=Want to move scripts to your desktop [Y/N]?)))
if not exist "%m_path%\Survival Backups\Move_remind.log" (IF not exist "%homepath%\desktop\SM backup scripts" (IF /i "%_move%"=="y" (@echo. All the scripts will be moved to your desktop. & @timeout /t 5 & move /y ".\SM backup scripts" "%homepath%\desktop"))) else (set /p move_remind=No more remind [Y/N]?) 
if /i "%move_remind%"=="y" (echo %move_remind%> "%m_path%\Survival Backups\Move_remind.log")
rem First start indicator
if not exist "%m_path%\Survival Backups\F_time.log" (echo %F_time%> "%m_path%\Survival Backups\F_time.log") else (set F_time=0)
if "%F_time%"=="1" (type "%m_path%\Survival Backups\Description_B.txt" | more) else (set speak=1)
if "%F_time%"=="1" (set /p steam_u_n=Need help with steam user folder name [Y/N]?)   
if /i "%steam_u_n%"=="y" (start /wait "Windows Explorer" "explorer.exe" "%homepath%\AppData\Roaming\Axolot Games\Scrap Mechanic\User")
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
rem Steam user name input and check
echo. 
if exist "%m_path%\Survival Backups\reset_un.tmp" (set /p steam_u_n=Need help with steam user folder name [Y/N]?)
if /i "%steam_u_n%"=="y" (start /wait "Windows Explorer" "explorer.exe" "%homepath%\AppData\Roaming\Axolot Games\Scrap Mechanic\User")
if not exist "%m_path%\Survival Backups\Steam user name.log" (set /p UserName=Enter your steam user folder name:) else (set /p UserName="" <"%m_path%\Survival Backups\Steam user name.log") 
if not exist "%m_path%\Survival Backups\Steam user name.log" (echo %UserName%> "%m_path%\Survival Backups\Steam user name.log")
set U_N=%UserName:~0,5%
if not "%U_N%"=="User_" (echo.)
if not "%U_N%"=="User_" (color 04 & echo. Wrong steam user folder name, resetting the script... & del "%m_path%\Survival Backups\Steam user name.log" & echo %reset%> "%m_path%\Survival Backups\reset_un.tmp" & timeout /T 2 /nobreak & cd ".\SM backup scripts" & call ".\Create backup SM.bat" & exit) else (IF exist "%m_path%\Survival Backups\reset_un.tmp" (del "%m_path%\Survival Backups\reset_un.tmp"))
if not "%U_N%"=="User_" (echo.)
rem World name input
set /p W_N_input=Enter world name:
set WorldName=%W_N_input%%W_N_extention%
rem Copy & paste world data base file 
echo.
echo =====Making a backup file...
copy /y "%homepath%\AppData\Roaming\Axolot Games\Scrap Mechanic\User\%UserName%\Save\Survival\%WorldName%" "%m_path%\Survival Backups" 
echo.
rem Partings
if %errorlevel% equ 0 (IF exist "%m_path%\Survival Backups\reset_wn.tmp" (del "%m_path%\Survival Backups\reset_wn.tmp")) 
if %errorlevel% equ 0 (IF "%goodbye%"=="1" (echo. Bye.))
if %errorlevel% equ 0 (IF "%goodbye%"=="2" (echo. Goodbye.))
if %errorlevel% equ 0 (IF "%goodbye%"=="3" (echo. Good luck!))
if %errorlevel% equ 0 (IF "%goodbye%"=="4" (echo. See you later.))
if %errorlevel% equ 0 (IF "%goodbye%"=="5" (echo. Have a good play time.))
if %errorlevel% equ 0 (IF "%goodbye%"=="6" (echo. Have a good day.))
if %errorlevel% equ 0 (IF "%goodbye%"=="7" (echo. Backup completed, now you can experiment.))
if %errorlevel% equ 0 (IF "%goodbye%"=="8" (echo. Don't worry about your world, I'll keep it safe.))
if %errorlevel% equ 0 (IF "%goodbye%"=="9" (echo. Farmbots? Raid? Hah, you have a backup now!))
if %errorlevel% equ 0 (IF "%goodbye%"=="10" (echo. Checkpoint activated.))
if %errorlevel% equ 0 (color 0a & timeout /t 5)
if %errorlevel% equ 1 (color 04 & echo. There are no worlds with this name, try again. & echo %reset%> "%m_path%\Survival Backups\reset_wn.tmp" & timeout /t 2 /nobreak & cd ".\SM backup scripts" & call ".\Create backup SM.bat" & exit)
echo.
