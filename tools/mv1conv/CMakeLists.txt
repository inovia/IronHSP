cmake_minimum_required(VERSION 3.20)
project(mv1conv LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC)
    add_compile_definitions(_CRT_SECURE_NO_WARNINGS NOMINMAX)
endif()

# ===== assimp (optional, but enabled by default) =====
option(MV1CONV_USE_ASSIMP "Enable assimp-powered importer (FBX/glTF/3MF/DAE/etc)" ON)

if(MV1CONV_USE_ASSIMP)
    include(FetchContent)
    set(ASSIMP_BUILD_TESTS OFF CACHE BOOL "" FORCE)
    set(ASSIMP_BUILD_ASSIMP_TOOLS OFF CACHE BOOL "" FORCE)
    set(ASSIMP_INSTALL OFF CACHE BOOL "" FORCE)
    set(ASSIMP_WARNINGS_AS_ERRORS OFF CACHE BOOL "" FORCE)
    set(ASSIMP_BUILD_ZLIB ON CACHE BOOL "" FORCE)
    set(BUILD_SHARED_LIBS OFF CACHE BOOL "" FORCE)
    # export only reasonable formats (inbound のみ必要)
    set(ASSIMP_BUILD_ALL_EXPORTERS_BY_DEFAULT OFF CACHE BOOL "" FORCE)
    set(ASSIMP_BUILD_USD_IMPORTER ON CACHE BOOL "" FORCE)
    FetchContent_Declare(
        assimp
        GIT_REPOSITORY https://github.com/assimp/assimp.git
        GIT_TAG v5.4.3
    )
    FetchContent_MakeAvailable(assimp)
endif()

add_executable(mv1conv
    src/main.cpp
    src/dxa.cpp
    src/mv1_reader.cpp
    src/mv1_dump.cpp
    src/mv1_writer.cpp
    src/obj_export.cpp
    src/obj_import.cpp
    src/stl_import.cpp
    src/ply_import.cpp
    src/x_import.cpp
    src/mini_json.cpp
    src/glb_import.cpp
    src/wrl_import.cpp
    src/pmd_import.cpp
    src/pmx_import.cpp
    src/gpb_import.cpp
    src/mv1_to_ir.cpp
)

if(MV1CONV_USE_ASSIMP)
    target_sources(mv1conv PRIVATE src/assimp_import.cpp)
    target_link_libraries(mv1conv PRIVATE assimp::assimp)
    target_compile_definitions(mv1conv PRIVATE MV1CONV_HAVE_ASSIMP=1)
endif()

target_include_directories(mv1conv PRIVATE src)

if(MSVC)
    target_compile_options(mv1conv PRIVATE /W4 /utf-8 /Zc:__cplusplus /EHsc)
else()
    target_compile_options(mv1conv PRIVATE -Wall -Wextra -Wpedantic)
endif()

# ===== mv1_ref_gen (test oracle、DxLib 本家で正解 .mv1 生成) =====
# Windows + x64 + VS2015+ の組合わせのみ (プリビルト lib の関係)
option(MV1CONV_BUILD_REF_GEN "Build DxLib-linked MV1 reference generator (Windows only)" ON)

if(MV1CONV_BUILD_REF_GEN AND WIN32 AND MSVC AND CMAKE_SIZEOF_VOID_P EQUAL 8)
    set(DXLIB_ROOT "${CMAKE_SOURCE_DIR}/../../hsp3dx/extlib/dxlib_win/DxLib_VC")
    add_executable(mv1_ref_gen WIN32 test_ref/ref_gen.cpp)
    target_include_directories(mv1_ref_gen PRIVATE "${DXLIB_ROOT}")
    target_link_directories(mv1_ref_gen PRIVATE "${DXLIB_ROOT}")
    target_link_libraries(mv1_ref_gen PRIVATE
        DxLibW_vs2015_x64_MT
        DxUseCLibW_vs2015_x64_MT
        DxDrawFunc_vs2015_x64_MT
    )
    # DxLib は /MT 前提 (マルチスレッド静的) — assimp (通常 /MD) と分けるため別 exe
    target_compile_options(mv1_ref_gen PRIVATE /utf-8 /MT)
    target_compile_definitions(mv1_ref_gen PRIVATE _UNICODE UNICODE)
    set_target_properties(mv1_ref_gen PROPERTIES
        LINK_FLAGS "/SUBSYSTEM:WINDOWS"
        MSVC_RUNTIME_LIBRARY "MultiThreaded"
    )

    # --- mv1_load_check (DxLib で load 成功/失敗だけ返す checker) ---
    add_executable(mv1_load_check WIN32 test_ref/load_check.cpp)
    target_include_directories(mv1_load_check PRIVATE "${DXLIB_ROOT}")
    target_link_directories(mv1_load_check PRIVATE "${DXLIB_ROOT}")
    target_link_libraries(mv1_load_check PRIVATE
        DxLibW_vs2015_x64_MT
        DxUseCLibW_vs2015_x64_MT
        DxDrawFunc_vs2015_x64_MT
    )
    target_compile_options(mv1_load_check PRIVATE /utf-8 /MT)
    target_compile_definitions(mv1_load_check PRIVATE _UNICODE UNICODE)
    set_target_properties(mv1_load_check PROPERTIES
        LINK_FLAGS "/SUBSYSTEM:WINDOWS"
        MSVC_RUNTIME_LIBRARY "MultiThreaded"
    )
endif()
