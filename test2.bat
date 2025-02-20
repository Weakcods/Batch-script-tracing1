@echo off
cls

REM Get input for a with validation
set /P a=Enter a value for a: 

REM Validate input is a number
set "numbers=0123456789-"
set "input=%a%"
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

REM Main logic for checking value of a
if %a% GEQ 1 goto aaa
goto tapos

:aaa
if %a% LEQ 5 goto bbb
if %a% GEQ 6 goto ccc

:ccc
if %a% LEQ 10 goto ddd
echo 9999
goto tapos

:bbb
echo 1234
goto tapos

:ddd
echo 5678

:tapos
