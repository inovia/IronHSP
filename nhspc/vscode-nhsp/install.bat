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
    echo         Please install VS Code first.
    echo.
    pause
    exit /b 1
)

if exist "%TARGET%" (
    echo [*] Removing old install...
    rmdir /S /Q "%TARGET%"
)

echo [*] Copying extension files...
echo     To: %TARGET%
xcopy /E /I /Q "%SCRIPT_DIR%*" "%TARGET%\" >nul 2>&1

if not exist "%TARGET%\package.json" (
    echo [ERROR] Copy failed.
    pause
    exit /b 1
)
echo     Extension: OK

set "COMPILER_DIR=%TARGET%\compiler"
mkdir "%COMPILER_DIR%" >nul 2>&1
set "NHSPC_FOUND=0"

if exist "%SCRIPT_DIR%..\nhspc\bin\Debug\nhspc.exe" (
    echo [*] Copying compiler (Debug build)...
    copy /Y "%SCRIPT_DIR%..\nhspc\bin\Debug\nhspc.exe" "%COMPILER_DIR%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%..\nhspc\bin\Debug\NhspCompiler.Core.dll" "%COMPILER_DIR%\" >nul 2>&1
    set "NHSPC_FOUND=1"
)

if exist "%SCRIPT_DIR%..\nhspc\bin\Release\nhspc.exe" (
    echo [*] Copying compiler (Release build)...
    copy /Y "%SCRIPT_DIR%..\nhspc\bin\Release\nhspc.exe" "%COMPILER_DIR%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%..\nhspc\bin\Release\NhspCompiler.Core.dll" "%COMPILER_DIR%\" >nul 2>&1
    set "NHSPC_FOUND=1"
)

if "!NHSPC_FOUND!"=="1" (
    echo     Compiler: %COMPILER_DIR%\nhspc.exe
) else (
    echo [WARN] nhspc.exe not found. Build it first:
    echo        cd nhspc
    echo        dotnet build nhspc\nhspc.csproj
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
    echo   Open a .nhsp file in VS Code and press F5 to compile.
    echo   No path configuration needed.
) else (
    echo   Compiler:  NOT FOUND
    echo.
    echo   Set nhsp.compilerPath in VS Code settings.
)
echo.
echo   Please restart VS Code.
echo.
pause
