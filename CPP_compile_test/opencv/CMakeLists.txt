cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(canny)

find_package(OpenCV REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS})

message(STATUS "version: ${OpenCV_VERSION} ")
message(STATUS "libraries: ${OpenCV_LIBS} ")
message(STATUS "include: ${OpenCV_INCLUDE_DIRS}  ")

add_executable (canny canny.cpp)
target_link_libraries (canny ${OpenCV_LIBS})