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
