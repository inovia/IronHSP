# Bullet Physics 3.25 minimal bundle (hsp3dx dxlib_angle_sdl2 fork)
# upstream: https://github.com/bulletphysics/bullet3 (zlib license)
# LinearMath / BulletCollision / BulletDynamics / BulletSoftBody /
# BulletInverseDynamics の 5 モジュール、Bullet3* (experimental) / OpenCL は除外。

cmake_minimum_required(VERSION 3.15)
project(dx_bullet CXX)

# Bullet の元 CMakeLists は option だらけなので、ここは GLOB で simple build
file(GLOB_RECURSE BULLET_SRC CONFIGURE_DEPENDS
    "${CMAKE_CURRENT_SOURCE_DIR}/src/LinearMath/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/BulletCollision/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/BulletDynamics/*.cpp"
    "${CMAKE_CURRENT_SOURCE_DIR}/src/BulletSoftBody/*.cpp"
)
# BulletInverseDynamics は Bullet3Common に依存するため除外 (experimental 相当)

add_library(dx_bullet STATIC ${BULLET_SRC})
target_include_directories(dx_bullet PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)
if(MSVC)
    target_compile_definitions(dx_bullet PRIVATE _CRT_SECURE_NO_WARNINGS)
    target_compile_options(dx_bullet PRIVATE
        /wd4244 /wd4267 /wd4305 /wd4018 /wd4100 /wd4458 /wd4702 /wd4456 /wd4800 /wd4996
    )
    # Bullet はしばしば /EHsc を必要 (CMake デフォルト)
else()
    target_compile_options(dx_bullet PRIVATE -Wno-unused-parameter -Wno-unused-variable)
endif()
set_target_properties(dx_bullet PROPERTIES POSITION_INDEPENDENT_CODE ON)
