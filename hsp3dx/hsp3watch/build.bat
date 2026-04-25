@echo off
rem hsp3watch_64.exe build script (MSVC cl.exe, x64)
rem
rem Usage:
rem   1. Open "x64 Native Tools Command Prompt for VS 2022" (or 2019)
rem   2. cd j:\HNWorks\IronHSP_2026\hsp3dx\hsp3watch
rem   3. build.bat
rem
rem Output: hsp3watch_64.exe
rem Run:    hsp3watch_64.exe                     (default demo.ax)
rem         hsp3watch_64.exe path\to\file.ax     (any .ax)
rem Keys:   F5 = reload .ax / Esc = quit

setlocal
where cl >nul 2>nul
if errorlevel 1 (
    echo [ERROR] cl.exe not found. Open "x64 Native Tools Command Prompt for VS 2022" first.
    exit /b 1
)

cl /nologo /EHsc /std:c++17 /O2 /W3 /utf-8 ^
    hsp3watch.cpp ^
    /link /SUBSYSTEM:CONSOLE user32.lib gdi32.lib /OUT:hsp3watch_64.exe

if errorlevel 1 (
    echo [ERROR] build failed.
    exit /b 1
)

echo.
echo [OK] hsp3watch_64.exe built.
endlocal
