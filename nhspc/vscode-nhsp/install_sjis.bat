@echo off
chcp 932 >nul 2>&1
setlocal

echo ========================================
echo   NHSP VS Code 拡張 インストーラー
echo ========================================
echo.

:: VS Code の拡張ディレクトリを決定
set "VSCODE_EXT=%USERPROFILE%