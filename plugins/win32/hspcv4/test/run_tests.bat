@echo off
rem ============================================================
rem  hspcv4 : automated headless self-test runner
rem
rem  Prerequisites:
rem    - plugins\win32\hspcv4\Release\hspcv4.dll has been built
rem      (run build_all.bat + msbuild on hspcv4.vcxproj first).
rem    - Repository root contains hsp3\win32\Release\hsp3cl.exe
rem      and package\win32\hspcmp.exe (standard IronHSP layout).
rem
rem  What it does:
rem    1. Resolve repo root (this script lives in plugins\win32\hspcv4\test).
rem    2. Stage a temporary work dir next to this script
rem       with hspcv4.dll, hspcv4.as, hspcmp.exe, hsp3cl.exe, test image.
rem    3. Compile and run test_headless.hsp.
rem    4. Grep output for "ALL PASSED" (success) or "FAIL" (failure).
rem    5. Exit 0 on pass, 1 on fail.
rem ============================================================
setlocal enableextensions

set "SCRIPT_DIR=%~dp0"
set "HSPCV4_DIR=%SCRIPT_DIR%.."
set "REPO_ROOT=%HSPCV4_DIR%\..\..\.."
set "WORK_DIR=%SCRIPT_DIR%_work"

set "HSPCV4_DLL=%HSPCV4_DIR%\Release\hspcv4.dll"
set "HSPCV4_AS=%HSPCV4_DIR%\package\hspcv4.as"
rem Use the freshly built hspcmp (supports #defstruct/NSTRUCT),
rem NOT the stale package/win32/hspcmp.exe (2021, pre-defstruct).
set "HSPCMP_EXE=%REPO_ROOT%\hspcmp\win32\Release\hspcmp.exe"
set "HSP3CL_EXE=%REPO_ROOT%\hsp3\win32\Release\hsp3cl.exe"

echo === hspcv4 headless self-test ===
echo.

if not exist "%HSPCV4_DLL%" (
    echo [error] hspcv4.dll not found: %HSPCV4_DLL%
    echo         Build the plugin first ^(see docs\hspcv4_build.html^).
    exit /b 1
)
if not exist "%HSPCMP_EXE%" (
    echo [error] hspcmp.exe not found: %HSPCMP_EXE%
    exit /b 1
)
if not exist "%HSP3CL_EXE%" (
    echo [error] hsp3cl.exe not found: %HSP3CL_EXE%
    echo         Build hsp3\win32 Release first.
    exit /b 1
)

if exist "%WORK_DIR%" rmdir /s /q "%WORK_DIR%"
mkdir "%WORK_DIR%"

copy /y "%HSPCV4_DLL%"               "%WORK_DIR%\hspcv4.dll"       >nul
copy /y "%HSPCV4_AS%"                "%WORK_DIR%\hspcv4.as"        >nul
copy /y "%HSPCMP_EXE%"               "%WORK_DIR%\hspcmp.exe"       >nul
copy /y "%HSP3CL_EXE%"               "%WORK_DIR%\hsp3cl.exe"       >nul
copy /y "%SCRIPT_DIR%test_image.png" "%WORK_DIR%\test_image.png"   >nul
copy /y "%SCRIPT_DIR%test_headless.hsp" "%WORK_DIR%\test_headless.hsp" >nul

rem Stage Haar cascade XML if OpenCV install dir exists (Phase 2e)
set "OPENCV_ETC_32=%HSPCV4_DIR%\build\opencv_install_32\etc\haarcascades"
set "OPENCV_ETC_64=%HSPCV4_DIR%\build\opencv_install_64\etc\haarcascades"
if exist "%OPENCV_ETC_32%\haarcascade_frontalface_default.xml" (
    copy /y "%OPENCV_ETC_32%\haarcascade_frontalface_default.xml" "%WORK_DIR%\" >nul
) else if exist "%OPENCV_ETC_64%\haarcascade_frontalface_default.xml" (
    copy /y "%OPENCV_ETC_64%\haarcascade_frontalface_default.xml" "%WORK_DIR%\" >nul
)

pushd "%WORK_DIR%"

echo [1/2] Compiling test_headless.hsp
".\hspcmp.exe" -otest.ax test_headless.hsp
if errorlevel 1 (
    echo [error] hspcmp failed.
    popd
    exit /b 1
)

echo.
echo [2/2] Running test.ax
".\hsp3cl.exe" test.ax > test_output.log 2>&1
type test_output.log

echo.
findstr /c:"ALL PASSED" test_output.log >nul
if errorlevel 1 (
    echo === RESULT: FAIL ===
    popd
    exit /b 1
)
findstr /c:"FAIL" test_output.log >nul
if not errorlevel 1 (
    echo === RESULT: FAIL ^(FAIL token found^) ===
    popd
    exit /b 1
)

echo === RESULT: PASS ===
popd
endlocal
exit /b 0
