@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   NHSP VS Code Extension Installer
echo ========================================
echo.

set "VSCODE_EXT=%USERPROFILE%\.vscode\extensions"
set "TARGET=%VSCODE_EXT%\nhsp-language-0.1.0"
set "SCRIPT_DIR=%~dp0"

if not exist "%VSCODE_EXT%" (
    echo [ERROR] .vscode\extensions not found.
    pause
    exit /b 1
)

if exist "%TARGET%" (
    echo [*] Removing old install...
    rmdir /S /Q "%TARGET%"
)

echo [*] Copying extension files...
xcopy /E /I /Q "%SCRIPT_DIR%." "%TARGET%\" >nul 2>&1

if not exist "%TARGET%\package.json" (
    echo [ERROR] Copy failed.
    pause
    exit /b 1
)
echo     Extension: OK

:: Find and copy compiler
set "COMPILER_DIR=%TARGET%\compiler"
mkdir "%COMPILER_DIR%" 2>nul
set "NHSPC_FOUND=0"

:: Go up one level from vscode-nhsp to nhspc, then into nhspc/bin
for %%I in ("%SCRIPT_DIR%\..") do set "NHSPC_ROOT=%%~fI"

if exist "%NHSPC_ROOT%\nhspc\bin\Debug\nhspc.exe" (
    echo [*] Copying compiler [Debug]...
    copy /Y "%NHSPC_ROOT%\nhspc\bin\Debug\nhspc.exe" "%COMPILER_DIR%\" >nul
    copy /Y "%NHSPC_ROOT%\nhspc\bin\Debug\NhspCompiler.Core.dll" "%COMPILER_DIR%\" >nul
    set "NHSPC_FOUND=1"
)

if exist "%NHSPC_ROOT%\nhspc\bin\Release\nhspc.exe" (
    echo [*] Copying compiler [Release]...
    copy /Y "%NHSPC_ROOT%\nhspc\bin\Release\nhspc.exe" "%COMPILER_DIR%\" >nul
    copy /Y "%NHSPC_ROOT%\nhspc\bin\Release\NhspCompiler.Core.dll" "%COMPILER_DIR%\" >nul
    set "NHSPC_FOUND=1"
)

echo.
echo ========================================
echo   Install complete!
echo ========================================
echo.
echo   Extension: %TARGET%
if "!NHSPC_FOUND!"=="1" (
    echo   Compiler:  %COMPILER_DIR%\nhspc.exe
    echo.
    echo   Open .nhsp in VS Code, press F5 to compile.
) else (
    echo   Compiler:  NOT FOUND
    echo   Set nhsp.compilerPath in VS Code settings.
)
echo.
echo   Restart VS Code to activate.
echo.
pause
