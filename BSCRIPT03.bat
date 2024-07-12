@echo off
rem BSCRIPT03.bat - Execute basic Windows utilities

:menu
cls
echo Select a utility to execute:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
echo -----------
echo 0. exit
set /p choice=Enter your choice of utility (1-8): 

if %choice%==1 goto ipconfig
if %choice%==2 goto tasklist
if %choice%==3 goto taskkill
if %choice%==4 goto chkdsk
if %choice%==5 goto format
if %choice%==6 goto defrag
if %choice%==7 goto find
if %choice%==8 goto attrib
if %choice%==0 goto quit

echo Invalid choice. Please enter a number between 1 and 8.
pause
goto menu

:ipconfig
ipconfig
if %errorlevel% neq 0 echo Error executing ipconfig.
pause
goto menu

:tasklist
tasklist
if %errorlevel% neq 0 echo Error executing tasklist.
pause
goto menu

:taskkill
set /p pid=Enter the PID to kill: 
taskkill /PID %pid%
if %errorlevel% neq 0 echo Error killing process with PID %pid%.
pause
goto menu

:chkdsk
echo Available drives:
wmic logicaldisk get name
set /p drive=Enter the drive letter (e.g., C:): 
chkdsk %drive%
if %errorlevel% neq 0 echo Error executing chkdsk on drive %drive%.
pause
goto menu

:format
echo Available drives:
wmic logicaldisk get name
set /p drive=Enter the drive letter to format (e.g., E:): 
echo WARNING: Formatting will erase all data on the drive.
pause
format %drive%
if %errorlevel% neq 0 echo Error formatting drive %drive%.
pause
goto menu

:defrag
echo Available drives:
wmic logicaldisk get name
set /p drive=Enter the drive letter to defragment (e.g., C:): 
defrag %drive%
if %errorlevel% neq 0 echo Error defragmenting drive %drive%.
pause
goto menu

:find
set /p text=Enter the text to find: 
set /p file=Enter the file to search in: 
find "%text%" %file%
if %errorlevel% neq 0 echo Error finding "%text%" in file %file%.
pause
goto menu

:attrib
set /p file=Enter the file or directory to change attributes: 
attrib %file%
if %errorlevel% neq 0 echo Error changing attributes of %file%.
pause
goto menu

:quit
echo Thank you for using bscript03, bye!
pause
exit