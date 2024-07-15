@echo off
rem BSCRIPT02.bat - Calculate area and properties of shapes

:menu
cls
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit
set /p choice=Enter your choice (1/2/3): 

if %choice%==1 goto circle
if %choice%==2 goto triangle
if %choice%==3 goto quadrilateral
if %choice%==4 goto quit

goto menu

:circle
set /p radius=Enter the radius of the circle: 
set /a pi=31416
set /a radius_squared=%radius% * %radius%
set /a area_times_10000=%pi% * %radius_squared% / 10000
echo The approximate area of the circle is %area_times_10000%

pause
goto menu

:triangle
set /p a=Enter the length of side a: 
set /p b=Enter the length of side b: 
set /p c=Enter the length of side c: 

rem Classify the triangle
if %a%==%b% (
    if %b%==%c% (
        echo The triangle is equilateral.
    ) else (
        echo The triangle is isosceles.
    )
) else (
    if %a%==%c% (
        echo The triangle is isosceles.
    ) else if %b%==%c% (
        echo The triangle is isosceles.
    ) else (
        echo The triangle is scalene.
    )
)

pause
goto menu

:quadrilateral
set /p length=Enter the length: 
set /p width=Enter the width: 
set /a area=%length% * %width%
if %length%==%width% (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
echo The area of the quadrilateral is %area%
pause
goto menu

:quit
echo Thank you for using bscript02, bye!
pause
exit

