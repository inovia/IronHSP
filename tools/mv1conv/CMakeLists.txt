cmake_minimum_required(VERSION 3.20)
project(mv1conv LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC)
    add_compile_options(/W4 /utf-8 /Zc:__cplusplus /EHsc)
    add_compile_definitions(_CRT_SECURE_NO_WARNINGS NOMINMAX)
else()
    add_compile_options(-Wall -Wextra -Wpedantic)
endif()

add_executable(mv1conv
    src/main.cpp
    src/dxa.cpp
    src/mv1_reader.cpp
    src/mv1_dump.cpp
)

target_include_directories(mv1conv PRIVATE src)
