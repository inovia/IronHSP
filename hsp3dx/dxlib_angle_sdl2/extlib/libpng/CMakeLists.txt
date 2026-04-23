# libpng 1.6.45 minimal bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/glennrp/libpng (libpng/zlib license)
#
# pnglibconf.h は scripts/pnglibconf.h.prebuilt を root に copy 済 (upstream 標準設定)
# ARM NEON / Intel SSE SIMD はデフォルト ON、必要なら DX_PNG_DISABLE_SIMD=ON で OFF。

cmake_minimum_required(VERSION 3.15)
project(dx_png C)

set(PNG_SRC
    ${CMAKE_CURRENT_SOURCE_DIR}/png.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngerror.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngget.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngmem.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngpread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngread.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngrio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngrtran.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngrutil.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngset.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngtrans.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngwio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngwrite.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngwtran.c
    ${CMAKE_CURRENT_SOURCE_DIR}/pngwutil.c
)

option(DX_PNG_DISABLE_SIMD "Disable libpng NEON/SSE SIMD" OFF)

# ARM NEON (arm64 / arm32+NEON)
if(NOT DX_PNG_DISABLE_SIMD AND (
    CMAKE_SYSTEM_PROCESSOR MATCHES "^(aarch64|arm64|ARM64)$" OR
    (ANDROID AND ANDROID_ABI MATCHES "^(arm64-v8a|armeabi-v7a)$") OR
    CMAKE_OSX_ARCHITECTURES MATCHES "arm64"
))
    list(APPEND PNG_SRC
        ${CMAKE_CURRENT_SOURCE_DIR}/arm/arm_init.c
        ${CMAKE_CURRENT_SOURCE_DIR}/arm/filter_neon_intrinsics.c
        ${CMAKE_CURRENT_SOURCE_DIR}/arm/palette_neon_intrinsics.c
    )
endif()

# Intel SSE (SIMD は Android 外のみ、MSVC/GCC/Clang x86/x64)
if(NOT DX_PNG_DISABLE_SIMD AND NOT ANDROID AND
    CMAKE_SYSTEM_PROCESSOR MATCHES "^(x86_64|AMD64|amd64|i386|i686|x86)$")
    list(APPEND PNG_SRC
        ${CMAKE_CURRENT_SOURCE_DIR}/intel/intel_init.c
        ${CMAKE_CURRENT_SOURCE_DIR}/intel/filter_sse2_intrinsics.c
    )
endif()

add_library(dx_png STATIC ${PNG_SRC})

target_include_directories(dx_png PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# zlib link (親 CMakeLists で dx_zlib が作られている前提)
if(TARGET dx_zlib)
    target_link_libraries(dx_png PUBLIC dx_zlib)
elseif(TARGET zlib)
    target_link_libraries(dx_png PUBLIC zlib)
else()
    find_package(ZLIB REQUIRED)
    target_link_libraries(dx_png PUBLIC ZLIB::ZLIB)
endif()

if(MSVC)
    target_compile_options(dx_png PRIVATE /wd4244 /wd4267 /wd4996)
    target_compile_definitions(dx_png PRIVATE _CRT_SECURE_NO_WARNINGS)
else()
    target_compile_options(dx_png PRIVATE -Wno-implicit-function-declaration)
endif()
