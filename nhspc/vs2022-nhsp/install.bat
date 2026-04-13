@echo off
rem ============================================================
rem  Install NHSP Language Support into Visual Studio 2022.
rem
rem  Usage:
rem    install.bat [/q] [/home [path]] [/openfolder <project-dir>] [/noinstall]
rem
rem    /q                       Silent install (no GUI prompt).
rem    /home [path]             Set NHSPC_HOME user env var to <path>.
rem                             Path is optional — if omitted, auto-detect
rem                             by looking for nhspc.exe in common spots.
rem                             Required for Phase B Open Folder templates.
rem    /openfolder <dir>        Copy launch.vs.json + tasks.vs.json into
rem                             <dir>\.vs\ so the Open Folder workflow
rem                             (F5 = build + debug) works in that project.
rem    /noinstall               Skip the VSIXInstaller step. Use this when
rem                             the extension is already installed and you
rem                             only want to apply /home and/or /openfolder.
rem
rem  Examples:
rem    install.bat
rem    install.bat /q
rem    install.bat /home C:\tools\nhspc
rem    install.bat /home /openfolder C:\projects\myapp
rem    install.bat /q /home C:\tools\nhspc /openfolder C:\projects\myapp
rem    install.bat /noinstall /openfolder C:\projects\myapp
rem ============================================================
setlocal EnableDelayedExpansion
set "ROOT=%~dp0"
set "VSIX=%ROOT%nhsp-language.vsix"
set "QUIET="
set "DO_HOME=0"
set "HOME_PATH="
set "OPENFOLDER_DIR="
set "NO_INSTALL=0"

rem --- Parse args ---
rem  Note: cmd.exe expands %~1 inside a (...) block at parse time, BEFORE
rem  any `shift` runs. So we must not combine `shift` with a `%~1` lookup
rem  on the same parenthesized line. Use flat goto branches instead.
:argloop
if "%~1"=="" goto argdone
if /I "%~1"=="/q"          goto arg_q
if /I "%~1"=="/noinstall"  goto arg_noinstall
if /I "%~1"=="/home"       goto arg_home
if /I "%~1"=="/openfolder" goto arg_openfolder
echo [warn] Unknown argument: %~1
shift
goto argloop

:arg_q
set "QUIET=/quiet"
shift
goto argloop

:arg_noinstall
set "NO_INSTALL=1"
shift
goto argloop

:arg_home
set "DO_HOME=1"
shift
rem Optional next arg = path (skip if it's another flag, i.e. starts with /).
if "%~1"=="" goto argloop
set "_first=%~1"
set "_first=%_first:~0,1%"
if "%_first%"=="/" goto argloop
set "HOME_PATH=%~1"
shift
goto argloop

:arg_openfolder
shift
if "%~1"=="" (
    echo [error] /openfolder requires a directory argument.
    exit /b 1
)
set "OPENFOLDER_DIR=%~1"
shift
goto argloop

:argdone

if "%NO_INSTALL%"=="1" goto home_step

rem ============================================================
rem  1. Build vsix if missing
rem ============================================================
if not exist "%VSIX%" (
    echo [info] %VSIX% not found. Running build.bat first ...
    call "%ROOT%build.bat"
    if errorlevel 1 (
        echo [error] build.bat failed. Cannot continue.
        exit /b 1
    )
)
if not exist "%VSIX%" (
    echo [error] vsix still missing after build.
    exit /b 1
)

rem ============================================================
rem  2. Locate VS 2022
rem ============================================================
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
echo [info] VS 2022: %VS_DIR%
set "VSIXINSTALLER=%VS_DIR%\Common7\IDE\VSIXInstaller.exe"
if not exist "%VSIXINSTALLER%" (
    echo [error] VSIXInstaller.exe not found at "%VSIXINSTALLER%".
    exit /b 1
)

rem ============================================================
rem  3. Run VSIXInstaller (Phase A + C bundle)
rem ============================================================
echo [info] Installing %VSIX% ...
echo [info] Close any running Visual Studio 2022 instance first
echo        (otherwise the install is queued until VS exits).
echo.
"%VSIXINSTALLER%" %QUIET% "%VSIX%"
if errorlevel 1 (
    echo.
    echo [warn] VSIXInstaller returned a non-zero exit code.
    echo        Common causes:
    echo          - User cancelled the install dialog
    echo          - VS 2022 was running and the install is queued
    echo          - Extension already installed at this version
)

:home_step
rem ============================================================
rem  4. /home : set NHSPC_HOME env var (Phase B prereq)
rem ============================================================
if not "%DO_HOME%"=="1" goto openfolder_step
if not "%HOME_PATH%"=="" goto home_apply

echo [info] /home auto-detect: searching for nhspc.exe ...
for %%C in (
    "%ROOT%..\nhspc\bin\Release\nhspc.exe"
    "%ROOT%..\dist\nhspc.exe"
    "%ROOT%..\..\dist\nhspc.exe"
    "%ROOT%..\..\nhspc\nhspc\bin\Release\nhspc.exe"
    "%ROOT%..\nhspc\nhspc\bin\Release\nhspc.exe"
) do call :try_home %%C
if "%HOME_PATH%"=="" (
    echo [error] Could not auto-detect nhspc.exe. Pass an explicit path:
    echo            install.bat /home C:\path\to\nhspc-folder
    goto openfolder_step
)
echo [info] auto-detected nhspc.exe at: %HOME_PATH%

:home_apply
if not exist "%HOME_PATH%\nhspc.exe" (
    echo [warn] %HOME_PATH%\nhspc.exe does not exist; setting NHSPC_HOME anyway.
)
echo [info] setting NHSPC_HOME = %HOME_PATH%
setx NHSPC_HOME "%HOME_PATH%" >nul
if errorlevel 1 (
    echo [warn] setx failed. You may need to set NHSPC_HOME manually.
) else (
    echo [info] NHSPC_HOME persisted. New shells will see it; current shell will not.
)

:openfolder_step
rem ============================================================
rem  5. /openfolder : drop launch.vs.json + tasks.vs.json
rem ============================================================
if "%OPENFOLDER_DIR%"=="" goto end_step
if not exist "%OPENFOLDER_DIR%" (
    echo [error] /openfolder target does not exist: %OPENFOLDER_DIR%
    exit /b 1
)
set "VSDIR=%OPENFOLDER_DIR%\.vs"
if not exist "%VSDIR%" mkdir "%VSDIR%"
set "TPL=%ROOT%openfolder-templates"

call :copy_template launch.vs.json
call :copy_template tasks.vs.json

echo [info] Open Folder templates installed in %VSDIR%
echo [info] In VS 2022: File - Open - Folder - %OPENFOLDER_DIR% - F5

:end_step
echo.
echo [done] NHSP Language Support installation complete.
echo        Restart Visual Studio 2022 and open any .nhsp file.
echo.
endlocal
exit /b 0

rem ============================================================
rem  Subroutines
rem ============================================================

:try_home
if not "%HOME_PATH%"=="" goto :eof
if not exist "%~f1" goto :eof
set "HOME_PATH=%~dp1"
if "%HOME_PATH:~-1%"=="\" set "HOME_PATH=%HOME_PATH:~0,-1%"
goto :eof

:copy_template
set "_F=%~1"
if exist "%VSDIR%\%_F%" (
    if "%QUIET%"=="" (
        set "_yn="
        set /p "_yn=[prompt] %VSDIR%\%_F% already exists. Overwrite? (y/N) "
        if /I not "!_yn!"=="y" (
            echo [info] skipped %_F%
            goto :eof
        )
    )
)
copy /y "%TPL%\%_F%" "%VSDIR%\%_F%" >nul
if errorlevel 1 (
    echo [warn] failed to copy %_F%
) else (
    echo [info] installed %VSDIR%\%_F%
)
goto :eof
