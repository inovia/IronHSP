@echo off
rem ============================================================
rem  hspcv4 : all-in-one builder
rem    1. setup_opencv.bat   (DL + extract if missing)
rem    2. build_opencv_64.bat
rem    3. build_opencv_32.bat
rem ============================================================
setlocal

call "%~dp0setup_opencv.bat"
if errorlevel 1 exit /b 1

call "%~dp0build_opencv_64.bat"
if errorlevel 1 exit /b 1

call "%~dp0build_opencv_32.bat"
if errorlevel 1 exit /b 1

echo.
echo === ALL DONE ===
echo.
endlocal
exit /b 0
