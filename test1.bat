@echo off
cls

REM Get input for Y with validation
set /P Y=Enter a number (Y): 

REM Improve number validation
set "numbers=0123456789-"
set "input=%Y%"
set "valid=true"
if "%input%"=="" set "valid=false"
setlocal enabledelayedexpansion
for /L %%i in (0,1,100) do (
    if "!input:~%%i,1!" neq "" (
        echo."!input:~%%i,1!"|findstr /i "[!numbers!]" >nul
        if errorlevel 1 set "valid=false"
    )
)
if "%valid%"=="false" (
    echo Error: Please enter a valid number.
    exit /b 1
)

REM Prevent division by zero
if "%Y%"=="0" (
    echo Error: Cannot divide by zero.
    exit /b 1
)

REM Calculate x using proper modulo syntax
set /A "x=(100 %% Y)+(Y / 3)"

REM Use proper if-else structure for main conditions
if %x% LSS 2 (
    echo Hello!
) else if %x% GTR 2 (
    echo Good Morning!
) else (
    echo God Bless!
)

REM Check specific Y values
if "%Y%"=="5" echo Y is 5
if "%Y%"=="9" echo Y is 9
if "%Y%"=="1" echo Y is 1
if "%Y%"=="2" echo Y is 2
if "%Y%"=="10" echo Y is 10
