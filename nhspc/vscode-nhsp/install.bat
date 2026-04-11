@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   NHSP VS Code 拡張 インストーラー
echo ========================================
echo.

set "VSCODE_EXT=%USERPROFILE%\.vscode\extensions"
set "TARGET=%VSCODE_EXT%\nhsp-language-0.1.0"
set "SCRIPT_DIR=%~dp0"

:: 拡張ディレクトリが存在するか確認
if not exist "%VSCODE_EXT%" (
    echo [!] VS Code 拡張ディレクトリが見つかりません:
    echo     %VSCODE_EXT%
    echo     VS Code をインストールしてから再実行してください。
    echo.
    pause
    exit /b 1
)

:: 既存のインストールがあれば削除
if exist "%TARGET%" (
    echo [*] 既存のインストールを削除しています...
    rmdir /S /Q "%TARGET%"
)

:: コピー
echo [*] 拡張をインストールしています...
echo     コピー先: %TARGET%
xcopy /E /I /Q "%SCRIPT_DIR%*" "%TARGET%\" >nul 2>&1

if not exist "%TARGET%\package.json" (
    echo [!] コピーに失敗しました。
    pause
    exit /b 1
)

:: nhspc.exe の自動検出
set "NHSPC_PATH="
if exist "%SCRIPT_DIR%..\nhspc\bin\Debug\nhspc.exe" set "NHSPC_PATH=%SCRIPT_DIR%..\nhspc\bin\Debug\nhspc.exe"
if exist "%SCRIPT_DIR%..\nhspc\bin\Release\nhspc.exe" set "NHSPC_PATH=%SCRIPT_DIR%..\nhspc\bin\Release\nhspc.exe"

echo.
echo ========================================
echo   インストール完了!
echo ========================================
echo.
echo   拡張: %TARGET%
if defined NHSPC_PATH (
    echo   nhspc.exe: !NHSPC_PATH!
    echo.
    echo   nhspc.exe を自動検出しました。
    echo   VS Code で .nhsp ファイルを開いて F5 でコンパイルできます。
) else (
    echo   nhspc.exe: 見つかりません
    echo.
    echo   VS Code の設定で nhspc.exe のパスを指定してください:
    echo     nhsp.compilerPath
)
echo.
echo   VS Code を再起動してください。
echo.
pause
