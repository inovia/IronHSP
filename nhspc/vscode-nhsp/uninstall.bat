@echo off
setlocal

echo ========================================
echo   NHSP VS Code 拡張 アンインストーラー
echo ========================================
echo.

set "TARGET=%USERPROFILE%\.vscode\extensions\nhsp-language-0.1.0"

if exist "%TARGET%" (
    echo [*] 拡張を削除しています...
    echo     %TARGET%
    rmdir /S /Q "%TARGET%"
    echo.
    echo   アンインストール完了。VS Code を再起動してください。
) else (
    echo [*] 拡張はインストールされていません。
)

echo.
pause
