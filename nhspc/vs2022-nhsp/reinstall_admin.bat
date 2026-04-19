@echo off
setlocal

rem Self-elevate via PowerShell Start-Process -Verb RunAs.
net session >nul 2>&1
if %errorlevel% neq 0 goto :elevate

cd /d "%~dp0"

set "VSIX=%~dp0nhsp-language.vsix"
set "EXT_ID=IronHSP.NhspLanguage.5b3a8b62-3f6e-4f9e-a2bd-6e4a8c1e6b7e"

set "VSIXER="
for %%S in (Community Professional Enterprise) do (
    if exist "%ProgramFiles%\Microsoft Visual Studio\2022\%%S\Common7\IDE\VSIXInstaller.exe" (
        set "VSIXER=%ProgramFiles%\Microsoft Visual Studio\2022\%%S\Common7\IDE\VSIXInstaller.exe"
        goto :found
    )
)
:found
if "%VSIXER%"=="" (
    echo ERROR: VSIXInstaller.exe not found under any VS 2022 SKU.
    pause
    exit /b 1
)
if not exist "%VSIX%" (
    echo ERROR: %VSIX% not found. Run build_vsix.ps1 first.
    pause
    exit /b 1
)

echo using: %VSIXER%
echo vsix : %VSIX%
echo.

echo [1/2] Uninstalling old version...
"%VSIXER%" /admin /q /u:%EXT_ID%

echo [2/2] Installing new VSIX...
"%VSIXER%" /admin /q "%VSIX%"
if %errorlevel% neq 0 (
    echo ERROR: install failed with exit %errorlevel%.
    pause
    exit /b %errorlevel%
)

echo.
echo DONE. Please restart Visual Studio.
pause
endlocal
exit /b

:elevate
echo Relaunching with admin privileges...
powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
exit /b
