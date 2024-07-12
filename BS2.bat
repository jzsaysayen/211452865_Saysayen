@echo off
setlocal enabledelayedexpansion
echo ...............................................................
echo Enabled script: Reverse Multiplication Table depending on Input
echo ...............................................................

:main
pause
cls

echo (C)ontinue or (E)xit the script?:
set /p des=

if /i "%des%"=="E" (
    echo Thank you for using our script!
    pause
    cls
    echo Exiting script...
    goto end
) else if /i "%des%"=="C" (
    cls
    echo redirecting to script...
    pause
    cls
    goto reverse_multi
) else (
    echo Invalid choice. Please enter 'C' to continue or 'E' to exit.
    goto main
)

:reverse_multi
set /p num=Enter an integer: 

echo Multiplication Times Table for %num%:

REM Determine length of multiplication table
set max_len=0
for /l %%i in (1,1,%num%) do (
    for /l %%j in (1,1,%num%) do (
        set /a result=%%i*%%j
        if !result! gtr !max_len! set max_len=!result!
    )
)

REM multiplication table with adjusted spacing kaso fixed hahaha
REM di ko na kaya yung para maganda tignan
for /l %%i in (1,1,%num%) do (
    REM finifigure out ko pano lalagyan ng extra na repeated number to the left add i lang pala
    set column=%%i
    set line=
    for /l %%j in (1,1,%num%) do (
        set /a result=%%i*%%j
        REM fixed space nalang haha hirap i if else
        set "frmtd_result=     !result!"
        set "frmtd_result=!frmtd_result:~-%max_len%!"
        set "line=!line!!frmtd_result! "
    )
    
    echo !column!!line!
)

goto main

:end 
exit