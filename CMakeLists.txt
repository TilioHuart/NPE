cmake_minimum_required(VERSION 3.20)
project(npe
        VERSION 1.0.0
        LANGUAGES CXX)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
#set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)
set(CMAKE_CXX_STANDARD 23 CACHE STRING "C++ standard")
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(cmake/CPM.cmake)
CPMUsePackageLock(package-lock.cmake)

add_executable(sandbox Sandbox/Simulation.cpp)


add_subdirectory(Core/Physics)
add_subdirectory(Core/Renderer)

target_link_libraries(sandbox PRIVATE NPE::NpePhysics NPE::NpeRenderer)
