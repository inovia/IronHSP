# Cubism SDK for Native 5.r5 — hsp3dx 同梱
# - Core は prebuilt (binary) を import
# - Framework は source bundle (OpenGL backend のみ有効化)
# - ライセンス: Core は Live2D Proprietary、Framework は MIT (LICENSE_*.md 参照)
#
# この CMakeLists は 2 つの target を作る:
#   - dx_cubism_core      : IMPORTED STATIC library (platform 別 prebuilt)
#   - dx_cubism_framework : Framework source から OpenGL backend 付きで build
#
# ユーザーは DxLib 側で `#ifndef DX_NON_LIVE2D_CUBISM4` が有効なときに
# CubismFramework::StartUp() 等を呼ぶ統合コードを書く (L2 では infrastructure のみ)。

cmake_minimum_required(VERSION 3.15)
project(dx_cubism CXX)

# --- Cubism Core (IMPORTED prebuilt) --------------------------------------
add_library(dx_cubism_core STATIC IMPORTED GLOBAL)
set_target_properties(dx_cubism_core PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_SOURCE_DIR}/include"
)
if(WIN32)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        set_target_properties(dx_cubism_core PROPERTIES
            IMPORTED_LOCATION_DEBUG   "${CMAKE_CURRENT_SOURCE_DIR}/lib/windows/x64/Live2DCubismCore_MDd.lib"
            IMPORTED_LOCATION_RELEASE "${CMAKE_CURRENT_SOURCE_DIR}/lib/windows/x64/Live2DCubismCore_MD.lib"
            IMPORTED_LOCATION         "${CMAKE_CURRENT_SOURCE_DIR}/lib/windows/x64/Live2DCubismCore_MD.lib"
        )
    else()
        # x86 は含めていない。必要なら Core/lib/windows/x86/{143}/ からコピーを追加
        message(WARNING "Cubism Core: x86 Windows lib not bundled")
    endif()
elseif(APPLE)
    # Mac のlib は Core/lib/macos/ を別途コピー (placeholder)
    message(STATUS "Cubism Core Mac lib: copy Core/lib/macos/libLive2DCubismCore.a to extlib/cubism/lib/macos/ to enable")
elseif(UNIX)
    # Linux のlib は Core/lib/linux/ を別途コピー (placeholder)
    message(STATUS "Cubism Core Linux lib: copy Core/lib/linux/x86_64/libLive2DCubismCore.a to extlib/cubism/lib/linux/ to enable")
endif()

# --- Cubism Framework source bundle --------------------------------------
# OpenGL backend を含めてソースコンパイル (D3D/Metal/Vulkan 除外)

file(GLOB_RECURSE CUBISM_FW_SRC CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/framework/*.cpp"
)
# Rendering backend は全て除外 (core logic のみ build)
# OpenGL backend は GLEW 依存、D3D/Metal/Vulkan は別 API 要求
# 描画は MV1 draw 側との自前統合で対応予定 (L2 infrastructure のみ)
list(FILTER CUBISM_FW_SRC EXCLUDE REGEX "Rendering/")

add_library(dx_cubism_framework STATIC ${CUBISM_FW_SRC})
target_include_directories(dx_cubism_framework PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/framework
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)
target_link_libraries(dx_cubism_framework PUBLIC dx_cubism_core)
target_compile_definitions(dx_cubism_framework PUBLIC
    # OpenGL backend を使用 (platform 別に正しいマクロを選択)
    #   CSM_TARGET_WIN_GL  — Windows MSVC 専用 (_snprintf_s 等を使う)
    #   CSM_TARGET_MAC_GL  — Mac
    #   CSM_TARGET_LINUX_GL — Linux
)
if(WIN32)
    target_compile_definitions(dx_cubism_framework PUBLIC CSM_TARGET_WIN_GL=1)
elseif(APPLE)
    target_compile_definitions(dx_cubism_framework PUBLIC CSM_TARGET_MAC_GL=1)
elseif(UNIX)
    target_compile_definitions(dx_cubism_framework PUBLIC CSM_TARGET_LINUX_GL=1)
endif()
if(MSVC)
    target_compile_definitions(dx_cubism_framework PRIVATE _CRT_SECURE_NO_WARNINGS)
    target_compile_options(dx_cubism_framework PRIVATE
        /wd4100  # unused parameter
        /wd4458  # declaration hides class member
        /wd4244 /wd4267 /wd4018 /wd4305
    )
endif()
set_target_properties(dx_cubism_framework PROPERTIES POSITION_INDEPENDENT_CODE ON)
