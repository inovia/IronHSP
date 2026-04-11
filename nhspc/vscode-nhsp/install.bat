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

:: Pdb2PortablePdb (PDB変換ツール)
set "PDB_FOUND=0"
if exist "%NHSPC_ROOT%\Pdb2PortablePdb\bin\Debug\net48\Pdb2PortablePdb.exe" (
    echo [*] PDB変換ツールをコピーしています。
    copy /Y "%NHSPC_ROOT%\Pdb2PortablePdb\bin\Debug\net48\Pdb2PortablePdb.exe" "%COMPILER_DIR%\" >nul
    copy /Y "%NHSPC_ROOT%\Pdb2PortablePdb\bin\Debug\net48\Microsoft.DiaSymReader.*.dll" "%COMPILER_DIR%\" >nul 2>nul
    :: amd64 native DLL
    for /R "%USERPROFILE%\.nuget\packages\microsoft.diasymreader.native" %%F in (Microsoft.DiaSymReader.Native.amd64.dll) do (
        copy /Y "%%F" "%COMPILER_DIR%\" >nul 2>nul
    )
    :: x86 native DLL
    for /R "%USERPROFILE%\.nuget\packages\microsoft.diasymreader.native" %%F in (Microsoft.DiaSymReader.Native.x86.dll) do (
        copy /Y "%%F" "%COMPILER_DIR%\" >nul 2>nul
    )
    set "PDB_FOUND=1"
)

echo.
echo ========================================
echo   インストール完了
echo ========================================
echo.
echo   拡張:      %TARGET%
if "!NHSPC_FOUND!"=="1" (
    echo   コンパイラ: %COMPILER_DIR%\nhspc.exe
)
if "!PDB_FOUND!"=="1" (
    echo   PDB変換:   %COMPILER_DIR%\Pdb2PortablePdb.exe
)
echo.
if "!NHSPC_FOUND!"=="1" (
    echo   VS Code で .nhsp を開いて F5 でコンパイルできます。
    echo   パス設定は不要です。
) else (
    echo   コンパイラが見つかりません。先にビルドしてください:
    echo     cd nhspc
    echo     dotnet build NhspCompiler.sln
)
echo.
echo   VS Code を再起動してください。
echo.
pause
