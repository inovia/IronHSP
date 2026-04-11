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
    echo [ERROR] VS Code extensions directory not found.
    pause
    exit /b 1
)

if exist "%TARGET%" (
    echo [*] Removing old installation...
    rmdir /S /Q "%TARGET%"
)

echo [*] Installing extension files...
xcopy /E /I /Q "%SCRIPT_DIR%." "%TARGET%\" >nul 2>&1

if not exist "%TARGET%\package.json" (
    echo [ERROR] Failed to copy files.
    pause
    exit /b 1
)
echo     Extension files: OK

set "COMPILER_DIR=%TARGET%\compiler"
mkdir "%COMPILER_DIR%" 2>nul
set "NHSPC_FOUND=0"

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
    echo   Open .nhsp in VS Code and press F5 to compile.
    echo   No path configuration needed.
) else (
    echo   Compiler:  NOT FOUND
    echo   Set nhsp.compilerPath in VS Code settings.
)
echo.
echo   Please restart VS Code.
echo.
pause
