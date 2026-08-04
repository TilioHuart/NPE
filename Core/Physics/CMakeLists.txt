cmake_minimum_required(VERSION 3.20)

add_library(NpePhysics STATIC
    src/Physics.cpp
)

target_include_directories(NpePhysics PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include/
)

add_library(NPE::NpePhysics ALIAS NpePhysics)