@echo off
set "ARCH_NAME=Win32"
set "ARCH_TAG=32"
call "%~dp0_build_opencv_common.bat"
exit /b %errorlevel%
