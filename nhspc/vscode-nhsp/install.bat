@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   NHSP VS Code 拡張 インストーラー
echo ========================================
echo.

set "VSCODE_EXT=%USERPROFILE%\.vscode\extensions"
set "TARGET=%VSCODE_EXT%\nhsp-language-0.1.0"
set "SCRIPT_DIR=%~dp0"

if not exist "%VSCODE_EXT%" (
    echo [!] VS Code 拡張ディレクトリが見つかりません。
    pause
    exit /b 1
)

if exist "%TARGET%" (
    echo [*] 既存のインストールを削除しています。
    rmdir /S /Q "%TARGET%"
)

echo [*] 拡張ファイルをコピーしています。
xcopy /E /I /Q "%SCRIPT_DIR%." "%TARGET%\" >nul 2>&1

if not exist "%TARGET%\package.json" (
    echo [!] コピーに失敗しました。
    pause
    exit /b 1
)
echo     拡張ファイル: OK

set "COMPILER_DIR=%TARGET%\compiler"
mkdir "%COMPILER_DIR%" 2>nul
set "NHSPC_FOUND=0"

for %%I in ("%SCRIPT_DIR%\..") do set "NHSPC_ROOT=%%~fI"

if exist "%NHSPC_ROOT%\nhspc\bin\Debug\nhspc.exe" (
    echo [*] コンパイラをコピーしています [Debug]
    copy /Y "%NHSPC_ROOT%\nhspc\bin\Debug\nhspc.exe" "%COMPILER_DIR%\" >nul
    copy /Y "%NHSPC_ROOT%\nhspc\bin\Debug\NhspCompiler.Core.dll" "%COMPILER_DIR%\" >nul
    set "NHSPC_FOUND=1"
)

if exist "%NHSPC_ROOT%\nhspc\bin\Release\nhspc.exe" (
    echo [*] コンパイラをコピーしています [Release]
    copy /Y "%NHSPC_ROOT%\nhspc\bin\Release\nhspc.exe" "%COMPILER_DIR%\" >nul
    copy /Y "%NHSPC_ROOT%\nhspc\bin\Release\NhspCompiler.Core.dll" "%COMPILER_DIR%\" >nul
    set "NHSPC_FOUND=1"
)

echo.
echo ========================================
echo   インストール完了
echo ========================================
echo.
echo   拡張:      %TARGET%
if "!NHSPC_FOUND!"=="1" (
    echo   コンパイラ: %COMPILER_DIR%\nhspc.exe
    echo.
    echo   VS Code で .nhsp を開いて F5 でコンパイルできます。
    echo   パス設定は不要です。
) else (
    echo   コンパイラ: 見つかりません
    echo   VS Code の設定で nhsp.compilerPath を指定してください。
)
echo.
echo   VS Code を再起動してください。
echo.
pause
