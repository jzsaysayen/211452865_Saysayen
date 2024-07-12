@echo off
echo .....................................................
echo Enabled script: 24hr to 12hr format Time converter
echo .....................................................

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
    goto convert_time
) else (
    echo Invalid choice. Please enter 'C' to continue or 'E' to exit.
    goto main
)

:convert_time
:: rememer that 12:00 AM is 00:00 not 24:00
:: this will make the input to 12:00 PM
cls
echo Enter time in 24-hour format (HH:MM):
echo Minimum: 00:00; Maximum: 23:59

set /p time_24= "input: "

:: Extract hours and minutes
set hour=%time_24:~0,2%
set minutes=%time_24:~3,2%

:: Convert hour from string to integer
set /a hour_int=%hour%
set period=AM

if %hour_int% geq 12 (
    set period=PM
    if %hour_int% gtr 12 (
        set /a hour_int=hour_int - 12
    )
) else (
    if %hour_int% equ 0 (
        set /a hour_int=12
    )
)

:: Format hour with leading zero if necessary
if %hour_int% lss 10 (
    set hour_str=0%hour_int%
) else (
    set hour_str=%hour_int%
)

echo Time in 12-hour format: %hour_str%:%minutes% %period%
echo .....................................................
goto main

:end
pause
