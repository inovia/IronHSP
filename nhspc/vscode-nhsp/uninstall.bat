@echo off
setlocal

echo ========================================
echo   NHSP VS Code Extension Uninstaller
echo ========================================
echo.

set "TARGET=%USERPROFILE%\.vscode\extensions\nhsp-language-0.1.0"

if exist "%TARGET%" (
    echo [*] Removing extension...
    echo     %TARGET%
    rmdir /S /Q "%TARGET%"
    echo.
    echo   Uninstall complete. Please restart VS Code.
) else (
    echo [*] Extension is not installed.
)

echo.
pause
