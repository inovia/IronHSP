@echo off
set "ARCH_NAME=x64"
set "ARCH_TAG=64"
call "%~dp0_build_opencv_common.bat"
exit /b %errorlevel%
