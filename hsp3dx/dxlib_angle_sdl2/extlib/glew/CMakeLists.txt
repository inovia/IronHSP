# GLEW 2.2.0 static bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/nigels-com/glew (modified BSD / MIT / Khronos)
# GL extension function pointer loader。Live2D Cubism Framework の
# Rendering/OpenGL backend が #include <GL/glew.h> を要求するので bundle。

cmake_minimum_required(VERSION 3.15)
project(dx_glew C)

add_library(dx_glew STATIC src/glew.c)
target_include_directories(dx_glew PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_compile_definitions(dx_glew PUBLIC
    GLEW_STATIC=1
    GLEW_NO_GLU=1       # GLU 依存を切る
)
if(WIN32)
    target_link_libraries(dx_glew PUBLIC opengl32)
elseif(APPLE)
    target_link_libraries(dx_glew PUBLIC "-framework OpenGL")
elseif(UNIX)
    target_link_libraries(dx_glew PUBLIC GL)
endif()
if(MSVC)
    target_compile_definitions(dx_glew PRIVATE _CRT_SECURE_NO_WARNINGS)
    target_compile_options(dx_glew PRIVATE /wd4005 /wd4996)
endif()
set_target_properties(dx_glew PROPERTIES POSITION_INDEPENDENT_CODE ON)
