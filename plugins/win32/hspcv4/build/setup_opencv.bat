@echo off
rem ============================================================
rem  hspcv4 : OpenCV 4.12.0 downloader
rem  Uses curl (Win10 17063+) and PowerShell Expand-Archive.
rem  Idempotent - safe to re-run.
rem ============================================================
setlocal

set "OPENCV_VERSION=4.12.0"
set "OPENCV_ZIP_URL=https://github.com/opencv/opencv/archive/refs/tags/%OPENCV_VERSION%.zip"
set "CONTRIB_ZIP_URL=https://github.com/opencv/opencv_contrib/archive/refs/tags/%OPENCV_VERSION%.zip"
set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%.."
set "THIRD_PARTY_DIR=%ROOT_DIR%\third_party"
set "OPENCV_SRC_DIR=%THIRD_PARTY_DIR%\opencv-%OPENCV_VERSION%"
set "OPENCV_ZIP=%THIRD_PARTY_DIR%\opencv-%OPENCV_VERSION%.zip"
set "CONTRIB_SRC_DIR=%THIRD_PARTY_DIR%\opencv_contrib-%OPENCV_VERSION%"
set "CONTRIB_ZIP=%THIRD_PARTY_DIR%\opencv_contrib-%OPENCV_VERSION%.zip"

echo.
echo === hspcv4 : OpenCV %OPENCV_VERSION% setup ===
echo.

if exist "%OPENCV_SRC_DIR%\CMakeLists.txt" (
    echo [skip] Already extracted: %OPENCV_SRC_DIR%
    goto :contrib
)

if not exist "%THIRD_PARTY_DIR%" mkdir "%THIRD_PARTY_DIR%"

if not exist "%OPENCV_ZIP%" (
    echo [1/2] Downloading %OPENCV_ZIP_URL%
    curl -L -o "%OPENCV_ZIP%" "%OPENCV_ZIP_URL%"
    if errorlevel 1 (
        echo [error] curl failed. Please check your internet connection.
        exit /b 1
    )
) else (
    echo [1/2] Zip already downloaded: %OPENCV_ZIP%
)

echo [2/2] Extracting to %THIRD_PARTY_DIR% via PowerShell Expand-Archive
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "Expand-Archive -LiteralPath '%OPENCV_ZIP%' -DestinationPath '%THIRD_PARTY_DIR%' -Force"
if errorlevel 1 (
    echo [error] Expand-Archive failed.
    exit /b 1
)

if not exist "%OPENCV_SRC_DIR%\CMakeLists.txt" (
    echo [error] Extracted directory does not contain CMakeLists.txt.
    echo         Expected: %OPENCV_SRC_DIR%
    exit /b 1
)

:contrib
rem ---- Also download opencv_contrib (for hspcv4_contrib.dll) ----
if exist "%CONTRIB_SRC_DIR%\modules" goto :done

if not exist "%CONTRIB_ZIP%" (
    echo [contrib 1/2] Downloading %CONTRIB_ZIP_URL%
    curl -L -o "%CONTRIB_ZIP%" "%CONTRIB_ZIP_URL%"
    if errorlevel 1 (
        echo [error] curl failed for contrib zip.
        exit /b 1
    )
) else (
    echo [contrib 1/2] Zip already downloaded: %CONTRIB_ZIP%
)

echo [contrib 2/2] Extracting to %THIRD_PARTY_DIR% via PowerShell Expand-Archive
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "Expand-Archive -LiteralPath '%CONTRIB_ZIP%' -DestinationPath '%THIRD_PARTY_DIR%' -Force"
if errorlevel 1 (
    echo [error] contrib Expand-Archive failed.
    exit /b 1
)

if not exist "%CONTRIB_SRC_DIR%\modules" (
    echo [error] opencv_contrib extracted directory does not contain modules/.
    exit /b 1
)

:done
echo.
echo === OpenCV source ready: %OPENCV_SRC_DIR% ===
echo === opencv_contrib ready: %CONTRIB_SRC_DIR% ===
echo.
endlocal
exit /b 0
