cmake_minimum_required(VERSION 3.20)

file(GLOB_RECURSE src "src/*.cpp")

add_library(NpeRenderer STATIC
    src/Renderer.cpp
)

target_include_directories(NpeRenderer PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_library(NPE::NpeRenderer ALIAS NpeRenderer)