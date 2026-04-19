@echo off
rem ============================================================
rem  Build NHSP Language Support .vsix for Visual Studio 2022.
rem
rem  Delegates the actual packaging to build_vsix.ps1 because that
rem  script builds the ZIP one entry at a time with forward-slash
rem  paths (required by OPC) and stays in sync with the list of
rem  files the VSIX needs (pkgdef + language-configuration.json +
rem  grammar + DLLs + config). The older `CreateFromDirectory` path
rem  this .bat used to inline produced backslash-separated entries
rem  that VS 2022's OPC reader silently dropped, making the VSIX
rem  look valid on disk but fail installation.
rem ============================================================
setlocal
set "ROOT=%~dp0"
set "REPO=%ROOT%.."

rem Locate MSBuild via vswhere.
set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" (
    echo [error] vswhere.exe not found. Install Visual Studio 2022.
    exit /b 1
)
for /f "usebackq tokens=*" %%i in (`"%VSWHERE%" -latest -property installationPath`) do set "VS_DIR=%%i"
set "MSBUILD=%VS_DIR%\MSBuild\Current\Bin\MSBuild.exe"
if not exist "%MSBUILD%" (
    echo [error] MSBuild.exe not found.
    exit /b 1
)

echo === Building NhspVsLanguageClient ===
"%MSBUILD%" "%REPO%\NhspVsLanguageClient\NhspVsLanguageClient.csproj" /p:Configuration=Release /v:minimal /t:Restore;Build
if errorlevel 1 exit /b 1

echo === Building NhspLanguageServer ===
"%MSBUILD%" "%REPO%\NhspLanguageServer\NhspLanguageServer.csproj" /p:Configuration=Release /v:minimal /t:Restore;Build
if errorlevel 1 exit /b 1

echo === Packaging VSIX ===
powershell -NoProfile -ExecutionPolicy Bypass -File "%ROOT%build_vsix.ps1"
if errorlevel 1 (
    echo [error] failed to build vsix.
    exit /b 1
)

echo.
echo Done. Double-click %ROOT%nhsp-language.vsix to install into Visual Studio 2022.
echo After install: restart VS 2022 completely, then open any .nhsp file.
echo You should see syntax coloring + real-time diagnostics from nhspls.exe.
echo.
endlocal
