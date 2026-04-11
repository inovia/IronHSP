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

:: 拡張ファイルをコピー
echo [*] 拡張をインストールしています...
echo     コピー先: %TARGET%
xcopy /E /I /Q "%SCRIPT_DIR%*" "%TARGET%\" >nul 2>&1

if not exist "%TARGET%\package.json" (
    echo [!] 拡張のコピーに失敗しました。
    pause
    exit /b 1
)
echo     拡張ファイル: OK

:: nhspc.exe と NhspCompiler.Core.dll をコピー
set "COMPILER_DIR=%TARGET%\compiler"
mkdir "%COMPILER_DIR%" >nul 2>&1

set "NHSPC_FOUND=0"

:: Debug ビルドを探す
if exist "%SCRIPT_DIR%..\nhspc\bin\Debug\nhspc.exe" (
    echo [*] コンパイラをコピーしています (Debug)...
    copy /Y "%SCRIPT_DIR%..\nhspc\bin\Debug\nhspc.exe" "%COMPILER_DIR%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%..\nhspc\bin\Debug\NhspCompiler.Core.dll" "%COMPILER_DIR%\" >nul 2>&1
    set "NHSPC_FOUND=1"
)

:: Release ビルドがあればそちらを優先
if exist "%SCRIPT_DIR%..\nhspc\bin\Release\nhspc.exe" (
    echo [*] コンパイラをコピーしています (Release)...
    copy /Y "%SCRIPT_DIR%..\nhspc\bin\Release\nhspc.exe" "%COMPILER_DIR%\" >nul 2>&1
    copy /Y "%SCRIPT_DIR%..\nhspc\bin\Release\NhspCompiler.Core.dll" "%COMPILER_DIR%\" >nul 2>&1
    set "NHSPC_FOUND=1"
)

if "!NHSPC_FOUND!"=="1" (
    echo     コンパイラ: %COMPILER_DIR%\nhspc.exe
) else (
    echo [!] nhspc.exe が見つかりません。
    echo     先に nhspc をビルドしてから再実行してください:
    echo       cd nhspc
    echo       dotnet build nhspc\nhspc.csproj
)

echo.
echo ========================================
echo   インストール完了!
echo ========================================
echo.
echo   拡張:      %TARGET%
if "!NHSPC_FOUND!"=="1" (
    echo   コンパイラ: %COMPILER_DIR%\nhspc.exe
    echo.
    echo   VS Code で .nhsp ファイルを開いて F5 でコンパイルできます。
    echo   nhspc.exe は拡張に同梱されているのでパス設定は不要です。
) else (
    echo   コンパイラ: 見つかりません
    echo.
    echo   VS Code の設定で nhspc.exe のパスを指定してください:
    echo     nhsp.compilerPath
)
echo.
echo   VS Code を再起動してください。
echo.
pause
