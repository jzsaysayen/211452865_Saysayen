@echo off
rem BSCRIPT04.bat - Sort, archive, and manage text files

set archiveDir=Z:\archive

rem Create archive directory if it doesn't exist
if not exist %archiveDir% mkdir %archiveDir%

rem Sort and move old files
forfiles /P C:\ /M *.txt /D -30 /C "cmd /c move @file %archiveDir%"

rem Sort archived files by size
forfiles /P %archiveDir% /M *.txt /C "cmd /c echo @fsize @fname" | sort /R > %archiveDir%\sorted_files_by_size.txt

rem Prompt to delete old, large files
echo The following files are large and older than 30 days:
type %archiveDir%\sorted_files_by_size.txt
set /p delete=Do you want to delete these files? (y/n): 
if /i "%delete%"=="y" (
    for /F "tokens=2*" %%i in (%archiveDir%\sorted_files_by_size.txt) do del /F /Q "%archiveDir%\%%i"
    echo Files deleted.
) else (
    echo Files not deleted.
)

pause
