@echo off
setlocal enabledelayedexpansion

echo ========================================
echo   NHSP VS Code Extension Installer
echo ========================================
echo.

set "VSCODE_EXT=%USERPROFILE%\.vscode\extensions"
set "TARGET=%VSCODE_EXT%\nhsp-language-0.1.0"
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%\..") do set "NHSPC_ROOT=%%~fI"
set "DIST_DIR=%NHSPC_ROOT%\dist"

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
    echo [!] 拡張のコピーに失敗しました。
    pause
    exit /b 1
)
echo     拡張ファイル: OK

set "COMPILER_DIR=%TARGET%\compiler"
mkdir "%COMPILER_DIR%" 2>nul

:: dist/ フォルダから全ファイルをコピー
if exist "%DIST_DIR%\nhspc.exe" (
    echo [*] dist/ からコンパイラ+ツールをコピーしています。
    copy /Y "%DIST_DIR%\*.*" "%COMPILER_DIR%\" >nul 2>nul
    echo     コンパイラ: OK
    echo     PDB変換:   OK
) else (
    echo [!] dist/ フォルダが見つかりません。
    echo     先にビルドしてください:
    echo       cd nhspc
    echo       dotnet build NhspCompiler.sln -c Release
    pause
    exit /b 1
)

echo.
echo ========================================
echo   インストール完了
echo ========================================
echo.
echo   拡張:      %TARGET%
echo   コンパイラ: %COMPILER_DIR%\nhspc.exe
echo   PDB変換:   %COMPILER_DIR%\Pdb2PortablePdb.exe
echo.
echo   VS Code で .nhsp を開いて F5 でコンパイルできます。
echo   パス設定は不要です。
echo.
echo   VS Code を再起動してください。
echo.
pause
