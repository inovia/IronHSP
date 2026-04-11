@echo off
chcp 65001 >nul 2>&1
setlocal

echo ========================================
echo   NHSP VS Code 拡張 インストーラー
echo ========================================
echo.

:: VS Code の拡張ディレクトリを決定
set "VSCODE_EXT=%USERPROFILE%\.vscode\extensions"
set "TARGET=%VSCODE_EXT%\nhsp-language-0.1.0"
set "SCRIPT_DIR=%~dp0"

:: VS Code がインストールされているか確認
where code >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [!] VS Code (code コマンド) が見つかりません。
    echo     VS Code をインストールしてから再実行してください。
    echo     https://code.visualstudio.com/
    echo.
    pause
    exit /b 1
)

:: 拡張ディレクトリが存在するか確認
if not exist "%VSCODE_EXT%" (
    echo [!] VS Code 拡張ディレクトリが見つかりません:
    echo     %VSCODE_EXT%
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
echo     %SCRIPT_DIR% → %TARGET%
xcopy /E /I /Q "%SCRIPT_DIR%*" "%TARGET%\" >nul 2>&1

if %ERRORLEVEL% neq 0 (
    echo [!] コピーに失敗しました。
    pause
    exit /b 1
)

:: nhspc.exe の自動検出
set "NHSPC_PATH="
:: 同階層の nhspc/bin/Debug
if exist "%SCRIPT_DIR%..\nhspc\bin\Debug\nhspc.exe" (
    set "NHSPC_PATH=%SCRIPT_DIR%..\nhspc\bin\Debug\nhspc.exe"
)
:: 同階層の nhspc/bin/Release
if exist "%SCRIPT_DIR%..\nhspc\bin\Release\nhspc.exe" (
    set "NHSPC_PATH=%SCRIPT_DIR%..\nhspc\bin\Release\nhspc.exe"
)

echo.
echo ========================================
echo   インストール完了!
echo ========================================
echo.
echo   拡張: %TARGET%
if defined NHSPC_PATH (
    echo   nhspc.exe: %NHSPC_PATH%
    echo.
    echo   nhspc.exe を自動検出しました。
    echo   VS Code で .nhsp ファイルを開いて F5 でコンパイルできます。
) else (
    echo   nhspc.exe: 見つかりません
    echo.
    echo   VS Code の設定で nhspc.exe のパスを指定してください:
    echo     設定 → nhsp.compilerPath
)
echo.
echo   VS Code を再起動してください。
echo.
pause
