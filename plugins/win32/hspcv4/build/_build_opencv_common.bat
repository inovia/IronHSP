@echo off
rem ============================================================
rem  Internal: configure+build OpenCV for a single architecture
rem  Called by build_opencv_32.bat / build_opencv_64.bat
rem
rem  Inputs:
rem    ARCH_NAME : "Win32" or "x64"
rem    ARCH_TAG  : "32" or "64"
rem ============================================================
setlocal

if "%ARCH_NAME%"=="" (
    echo [error] ARCH_NAME not set. Call build_opencv_32.bat or build_opencv_64.bat.
    exit /b 1
)
if "%ARCH_TAG%"=="" (
    echo [error] ARCH_TAG not set.
    exit /b 1
)

set "OPENCV_VERSION=4.12.0"
set "SCRIPT_DIR=%~dp0"
set "ROOT_DIR=%SCRIPT_DIR%.."
set "OPENCV_SRC_DIR=%ROOT_DIR%\third_party\opencv-%OPENCV_VERSION%"
set "BUILD_DIR=%SCRIPT_DIR%opencv_build_%ARCH_TAG%"
set "INSTALL_DIR=%SCRIPT_DIR%opencv_install_%ARCH_TAG%"

rem --- Locate Visual Studio 2022 via vswhere ---
set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist "%VSWHERE%" (
    echo [error] vswhere.exe not found. Install Visual Studio 2022.
    exit /b 1
)
for /f "usebackq tokens=*" %%i in (`"%VSWHERE%" -latest -property installationPath`) do set "VS_DIR=%%i"
if "%VS_DIR%"=="" (
    echo [error] Visual Studio 2022 not found.
    exit /b 1
)
set "CMAKE_EXE=%VS_DIR%\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
set "MSBUILD_EXE=%VS_DIR%\MSBuild\Current\Bin\MSBuild.exe"
if not exist "%CMAKE_EXE%" (
    echo [error] cmake.exe not found inside VS. Install CMake tools for VS.
    echo         Expected: %CMAKE_EXE%
    exit /b 1
)
if not exist "%MSBUILD_EXE%" (
    echo [error] msbuild.exe not found.
    exit /b 1
)

rem --- Run setup if needed ---
if not exist "%OPENCV_SRC_DIR%\CMakeLists.txt" (
    echo [setup] OpenCV source missing, running setup_opencv.bat ...
    call "%SCRIPT_DIR%setup_opencv.bat"
    if errorlevel 1 exit /b 1
)

rem --- Skip if already built (install dir contains opencv_world lib) ---
if exist "%INSTALL_DIR%\x64\vc17\staticlib\opencv_world4120.lib" goto :already_built_x64
if exist "%INSTALL_DIR%\x86\vc17\staticlib\opencv_world4120.lib" goto :already_built_x86
goto :build

:already_built_x64
echo [skip] Already built: %INSTALL_DIR%\x64\vc17\staticlib\opencv_world4120.lib
echo        Delete %INSTALL_DIR% to rebuild.
goto :done

:already_built_x86
echo [skip] Already built: %INSTALL_DIR%\x86\vc17\staticlib\opencv_world4120.lib
echo        Delete %INSTALL_DIR% to rebuild.
goto :done

:build
rem --- Optional FFmpeg support ---
rem   Set HSPCV4_WITH_FFMPEG=1 to enable cv::VideoWriter with MJPG/H264/MP4.
rem   OpenCV will attempt to auto-download opencv_videoio_ffmpeg.dll during
rem   cmake configure; you need a working internet connection and the
rem   resulting DLL must be placed next to hspcv4.dll at runtime.
rem   Default is OFF to keep the static build fully self-contained.
if /I "%HSPCV4_WITH_FFMPEG%"=="1" (
    set "FFMPEG_FLAG=ON"
    echo [ffmpeg] HSPCV4_WITH_FFMPEG=1 -- FFmpeg support enabled
) else (
    set "FFMPEG_FLAG=OFF"
)

rem --- Optional opencv_contrib support ---
rem   The main hspcv4.dll does not use any contrib symbols, so its size
rem   is unaffected by contrib being present in opencv_world lib.
rem   hspcv4_contrib.dll is a separate DLL that links the same
rem   opencv_world lib and pulls contrib symbols.
set "CONTRIB_MODULES_PATH=%ROOT_DIR%\third_party\opencv_contrib-%OPENCV_VERSION%\modules"
set "CONTRIB_FLAG="
set "CONTRIB_BUILD_LIST="
if exist "%CONTRIB_MODULES_PATH%" goto :use_contrib
echo [contrib] opencv_contrib not found, building without contrib modules
goto :after_contrib

:use_contrib
set "CONTRIB_FLAG=-DOPENCV_EXTRA_MODULES_PATH=%CONTRIB_MODULES_PATH%"
rem Only enable the modules we plan to wrap. Others are skipped via
rem BUILD_LIST to keep the opencv_world binary size reasonable.
set "CONTRIB_BUILD_LIST=core,imgproc,imgcodecs,videoio,highgui,video,calib3d,features2d,objdetect,dnn,photo,stitching,ml,tracking,aruco,xfeatures2d,bgsegm,ximgproc,img_hash,optflow,dnn_superres,face,text,xphoto,freetype,wechat_qrcode,plot,quality,saliency,shape"
echo [contrib] opencv_contrib modules enabled
:after_contrib

if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

echo.
echo === Configuring OpenCV %OPENCV_VERSION% (%ARCH_NAME%) ===
echo     src     : %OPENCV_SRC_DIR%
echo     build   : %BUILD_DIR%
echo     install : %INSTALL_DIR%
echo.

if not "%CONTRIB_BUILD_LIST%"=="" (
    set "BUILD_LIST_FLAG=-DBUILD_LIST=%CONTRIB_BUILD_LIST%"
) else (
    set "BUILD_LIST_FLAG="
)

rem --- FreeType / HarfBuzz via vcpkg-installed staticlib (Phase 22 follow) ---
rem   When third_party\vcpkg_work\installed has freetype.lib and
rem   harfbuzz.lib for the current ARCH, point cmake at them so
rem   opencv_freetype can be built.
set "VCPKG_WORK=%ROOT_DIR%\third_party\vcpkg_work"
if /I "%ARCH_NAME%"=="x64" (
    set "VCPKG_TRIPLET=x64-windows-static-md"
) else (
    set "VCPKG_TRIPLET=x86-windows-static-md"
)
set "VCPKG_INSTALLED=%VCPKG_WORK%\installed\%VCPKG_TRIPLET%"
set "FT_LIB=%VCPKG_INSTALLED%\lib\freetype.lib"
set "HB_LIB=%VCPKG_INSTALLED%\lib\harfbuzz.lib"
set "FREETYPE_FLAG="
if not exist "%FT_LIB%" goto :no_freetype
if not exist "%HB_LIB%" goto :no_freetype
rem cmake は path 内の \H を escape sequence として解釈するので forward slash に変換する。
set "FT_LIB_F=%FT_LIB:\=/%"
set "HB_LIB_F=%HB_LIB:\=/%"
set "FT_INC_F=%VCPKG_INSTALLED:\=/%/include"
set "HB_INC_F=%VCPKG_INSTALLED:\=/%/include/harfbuzz"
rem hspcv4 patches opencv_contrib/freetype/CMakeLists.txt to honor these vars
rem and skip the pkg-config probe entirely.
set "FREETYPE_FLAG=-DWITH_FREETYPE=ON -DHSPCV4_FREETYPE_LIB=%FT_LIB_F% -DHSPCV4_FREETYPE_INC=%FT_INC_F% -DHSPCV4_HARFBUZZ_LIB=%HB_LIB_F% -DHSPCV4_HARFBUZZ_INC=%HB_INC_F%"
echo [freetype] vcpkg %VCPKG_TRIPLET% staticlib detected, injecting via HSPCV4_* vars
:no_freetype

"%CMAKE_EXE%" ^
    -S "%OPENCV_SRC_DIR%" ^
    -B "%BUILD_DIR%" ^
    -G "Visual Studio 17 2022" ^
    -A %ARCH_NAME% ^
    -DCMAKE_INSTALL_PREFIX="%INSTALL_DIR%" ^
    -DBUILD_SHARED_LIBS=OFF ^
    -DBUILD_WITH_STATIC_CRT=OFF ^
    -DBUILD_opencv_world=ON ^
    %BUILD_LIST_FLAG% ^
    %CONTRIB_FLAG% ^
    %FREETYPE_FLAG% ^
    -DBUILD_TESTS=OFF ^
    -DBUILD_PERF_TESTS=OFF ^
    -DBUILD_EXAMPLES=OFF ^
    -DBUILD_DOCS=OFF ^
    -DBUILD_opencv_apps=OFF ^
    -DBUILD_opencv_python3=OFF ^
    -DBUILD_opencv_java=OFF ^
    -DBUILD_opencv_js=OFF ^
    -DBUILD_JAVA=OFF ^
    -DBUILD_PACKAGE=OFF ^
    -DWITH_CUDA=OFF ^
    -DWITH_OPENCL=ON ^
    -DWITH_IPP=ON ^
    -DWITH_TBB=OFF ^
    -DWITH_OPENEXR=OFF ^
    -DWITH_FFMPEG=%FFMPEG_FLAG% ^
    -DWITH_MSMF=ON ^
    -DWITH_DSHOW=ON ^
    -DCMAKE_BUILD_TYPE=Release

if errorlevel 1 (
    echo [error] cmake configure failed.
    exit /b 1
)

echo.
echo === Building OpenCV (Release, %ARCH_NAME%) ===
echo.

"%CMAKE_EXE%" --build "%BUILD_DIR%" --config Release --target INSTALL -- -maxCpuCount
if errorlevel 1 (
    echo [error] build failed.
    exit /b 1
)

:done
echo.
echo === OpenCV %ARCH_NAME% build complete ===
echo     install dir: %INSTALL_DIR%
echo.
endlocal
exit /b 0
