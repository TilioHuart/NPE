cmake_minimum_required(VERSION 3.20)

add_library(NpeRenderer STATIC
    src/Renderer.cpp
)

find_package(Vulkan REQUIRED)
find_package(glfw3 REQUIRED)

target_include_directories(NpeRenderer PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(NpeRenderer PRIVATE glfw Vulkan::Vulkan)

add_library(NPE::NpeRenderer ALIAS NpeRenderer)