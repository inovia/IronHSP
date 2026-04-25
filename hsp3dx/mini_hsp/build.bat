@echo off
rem mini_hsp.exe build script (MSVC cl.exe)
rem
rem Usage:
rem   1. Open "x64 Native Tools Command Prompt for VS 2022" (or 2019)
rem   2. cd j:\HNWorks\IronHSP_2026\hsp3dx\mini_hsp
rem   3. build.bat
rem
rem Output: mini_hsp.exe
rem Run:    mini_hsp.exe                     (default demo.ax)
rem         mini_hsp.exe path\to\file.ax     (any .ax)
rem Keys:   F5 = reload .ax / Esc = quit

setlocal
where cl >nul 2>nul
if errorlevel 1 (
    echo [ERROR] cl.exe not found. Open "x64 Native Tools Command Prompt for VS 2022" first.
    exit /b 1
)

cl /nologo /EHsc /std:c++17 /O2 /W3 /utf-8 ^
    mini_hsp.cpp ^
    /link /SUBSYSTEM:CONSOLE user32.lib gdi32.lib /OUT:mini_hsp.exe

if errorlevel 1 (
    echo [ERROR] build failed.
    exit /b 1
)

echo.
echo [OK] mini_hsp.exe built.
endlocal
