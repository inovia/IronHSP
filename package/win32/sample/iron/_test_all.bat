@echo off
REM ============================================================
REM  iron_* サンプル全ファイル統合コンパイルテスト
REM
REM  使い方:
REM    cd package\win32\sample\iron
REM    _test_all.bat C:\path\to\hsp3_root
REM
REM  第 1 引数: HSP3 ルートディレクトリ (hspcmp.exe + iron_*.hsp が参照可能な場所)
REM  省略時は ../../../../ を使う
REM
REM  前提: hspcmp.exe / 必要な DLL 群 / iron_*.hsp の参照パスが通っていること
REM ============================================================

setlocal

if "%~1"=="" (
    set HSPROOT=..\..\..\..
) else (
    set HSPROOT=%~1
)

set HSPCMP=%HSPROOT%\hsp3\win32\Release\hspcmp.exe
if not exist "%HSPCMP%" set HSPCMP=%HSPROOT%\hsp3\hsp3_64\x64\Release\hspcmp.exe

if not exist "%HSPCMP%" (
    echo [error] hspcmp.exe が見つかりません
    echo Searched: %HSPROOT%\hsp3\win32\Release\hspcmp.exe
    echo           %HSPROOT%\hsp3\hsp3_64\x64\Release\hspcmp.exe
    exit /b 1
)

set OK=0
set NG=0

for %%F in (sample_*.hsp) do (
    echo [TEST] %%F
    "%HSPCMP%" -d -i "%%F" > _test_out.tmp 2>&1
    if errorlevel 1 (
        echo   FAIL
        type _test_out.tmp
        set /a NG+=1
    ) else (
        set /a OK+=1
    )
)

del _test_out.tmp 2>nul

echo.
echo ============================================================
echo  Result:  OK=%OK%  NG=%NG%
echo ============================================================

if %NG% gtr 0 (exit /b 1)
exit /b 0
