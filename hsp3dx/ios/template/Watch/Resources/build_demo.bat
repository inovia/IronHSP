@echo off
rem build_demo.bat - Build Watch demo.ax from hello_watch.hsp via hspcmp.
rem
rem Usage:
rem   cd hsp3dx\ios\template\Watch\Resources
rem   build_demo.bat
rem
rem Output: demo.ax (bundled in Watch app Resources)
rem ContentView.swift loads it via Bundle.main.url(forResource:"demo", withExtension:"ax").
rem
rem Note: hspcmp needs both -i (input UTF-8) and -u (output UTF-8).
rem       --compath points to package/win32/common so we don't need to copy it.

setlocal
cd /d "%~dp0"

set "ROOT=%~dp0..\..\..\..\.."
set "HSPCMP=%ROOT%\package\win32\hspcmp.exe"
set "COMMON=%ROOT%\package\win32\common"

if not exist "%HSPCMP%" (
    echo [ERROR] hspcmp not found: %HSPCMP%
    exit /b 1
)
if not exist "%COMMON%" (
    echo [ERROR] common dir not found: %COMMON%
    exit /b 1
)

"%HSPCMP%" -i -u "--compath=%COMMON%/" -odemo.ax hello_watch.hsp
if errorlevel 1 (
    echo [ERROR] hspcmp failed.
    exit /b 1
)

if not exist demo.ax (
    echo [ERROR] demo.ax not produced.
    exit /b 1
)

echo [OK] demo.ax updated:
dir /B demo.ax
for %%F in (demo.ax) do echo     size=%%~zF bytes
endlocal
