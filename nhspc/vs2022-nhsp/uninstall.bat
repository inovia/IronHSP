@echo off
rem ============================================================
rem  Uninstall NHSP Language Support from Visual Studio 2022.
rem
rem  Uses VSIXInstaller.exe /uninstall:<extension-id>. The id must
rem  match the <Identity Id="..."> in extension.vsixmanifest.
rem
rem  Pass /q for a quiet (silent) uninstall.
rem ============================================================
setlocal
set "EXT_ID=IronHSP.NhspLanguage.5b3a8b62-3f6e-4f9e-a2bd-6e4a8c1e6b7e"
set "QUIET="
if /I "%~1"=="/q" set "QUIET=/quiet"

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" (
    echo [error] vswhere.exe not found at "%VSWHERE%".
    exit /b 1
)

set "VS_DIR="
for /f "usebackq tokens=*" %%i in (`"%VSWHERE%" -latest -version "[17.0,18.0)" -property installationPath`) do set "VS_DIR=%%i"
if "%VS_DIR%"=="" (
    echo [error] No Visual Studio 2022 instance found by vswhere.
    exit /b 1
)

set "VSIXINSTALLER=%VS_DIR%\Common7\IDE\VSIXInstaller.exe"
if not exist "%VSIXINSTALLER%" (
    echo [error] VSIXInstaller.exe not found at "%VSIXINSTALLER%".
    exit /b 1
)

echo [info] Uninstalling %EXT_ID% from %VS_DIR% ...
echo [info] Close any running Visual Studio 2022 instance first.
echo.
"%VSIXINSTALLER%" %QUIET% /uninstall:%EXT_ID%
if errorlevel 1 (
    echo.
    echo [warn] VSIXInstaller returned a non-zero exit code.
    echo        Possible causes: extension not installed, user cancelled,
    echo        VS 2022 was running so the uninstall is queued.
    exit /b 1
)

echo.
echo [done] NHSP Language Support uninstalled.
echo.
endlocal
