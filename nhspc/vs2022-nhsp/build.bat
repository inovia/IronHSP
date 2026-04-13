@echo off
rem ============================================================
rem  Build NHSP Language Support .vsix for Visual Studio 2022.
rem
rem  Bundles:
rem    1. TextMate grammar (Grammars\nhsp.tmLanguage.json)
rem    2. NhspVsLanguageClient.dll (MEF ILanguageClient + content type)
rem    3. nhspls.exe + dependencies (LSP server)
rem
rem  A .vsix is just an OPC ZIP, so we use System.IO.Compression
rem  via PowerShell — no VS SDK required.
rem ============================================================
setlocal
set "ROOT=%~dp0"
set "OUT=%ROOT%nhsp-language.vsix"
set "REPO=%ROOT%.."
set "VSCLIENT_BIN=%REPO%\NhspVsLanguageClient\bin\Release\net472"
set "LSP_BIN=%REPO%\NhspLanguageServer\bin\Release\net48"

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

if not exist "%VSCLIENT_BIN%\NhspVsLanguageClient.dll" (
    echo [error] NhspVsLanguageClient.dll missing at %VSCLIENT_BIN%
    exit /b 1
)
if not exist "%LSP_BIN%\nhspls.exe" (
    echo [error] nhspls.exe missing at %LSP_BIN%
    exit /b 1
)

if exist "%OUT%" del "%OUT%"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ErrorActionPreference='Stop';" ^
    "$src = '%ROOT%';" ^
    "$dst = '%OUT%';" ^
    "$vsclient = '%VSCLIENT_BIN%';" ^
    "$lsp = '%LSP_BIN%';" ^
    "$tmp = Join-Path $env:TEMP ('nhspvsix_' + [Guid]::NewGuid().ToString());" ^
    "New-Item -ItemType Directory -Path $tmp -Force | Out-Null;" ^
    "Copy-Item -LiteralPath (Join-Path $src 'extension.vsixmanifest') -Destination (Join-Path $tmp 'extension.vsixmanifest');" ^
    "Copy-Item -LiteralPath (Join-Path $src '[Content_Types].xml')   -Destination (Join-Path $tmp '[Content_Types].xml');" ^
    "Copy-Item -LiteralPath (Join-Path $src 'Grammars')              -Destination (Join-Path $tmp 'Grammars') -Recurse;" ^
    "Copy-Item -LiteralPath (Join-Path $vsclient 'NhspVsLanguageClient.dll') -Destination (Join-Path $tmp 'NhspVsLanguageClient.dll');" ^
    "Copy-Item -LiteralPath (Join-Path $lsp 'nhspls.exe')            -Destination (Join-Path $tmp 'nhspls.exe');" ^
    "Copy-Item -LiteralPath (Join-Path $lsp 'NhspCompiler.Core.dll') -Destination (Join-Path $tmp 'NhspCompiler.Core.dll');" ^
    "Copy-Item -LiteralPath (Join-Path $lsp 'Newtonsoft.Json.dll')   -Destination (Join-Path $tmp 'Newtonsoft.Json.dll');" ^
    "if (Test-Path -LiteralPath (Join-Path $lsp 'nhspls.exe.config')) { Copy-Item -LiteralPath (Join-Path $lsp 'nhspls.exe.config') -Destination (Join-Path $tmp 'nhspls.exe.config') };" ^
    "$zip = $dst -replace '\.vsix$', '.zip';" ^
    "if (Test-Path -LiteralPath $zip) { Remove-Item -LiteralPath $zip -Force };" ^
    "Add-Type -Assembly System.IO.Compression.FileSystem;" ^
    "[System.IO.Compression.ZipFile]::CreateFromDirectory($tmp, $zip, [System.IO.Compression.CompressionLevel]::Optimal, $false);" ^
    "Move-Item -LiteralPath $zip -Destination $dst -Force;" ^
    "Remove-Item -LiteralPath $tmp -Recurse -Force;" ^
    "Write-Host ('built: ' + $dst);"

if errorlevel 1 (
    echo [error] failed to build vsix.
    exit /b 1
)

echo.
echo Done. Double-click %OUT% to install into Visual Studio 2022.
echo Then open any .nhsp file and you should see syntax coloring +
echo real-time diagnostics from nhspls.exe.
echo.
endlocal
