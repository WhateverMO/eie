cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

project(cloud_viewer)

find_package(PCL REQUIRED)

include_directories(${PCL_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})
message(STATUS "library dirs: ${PCL_LIBRARY_DIRS} ")
message(STATUS "libraries: ${PCL_LIBRARIES} ")
message(STATUS "include: ${PCL_INCLUDE_DIRS}  ")
add_executable (cloud_viewer cloud_viewer.cpp)
target_link_libraries (cloud_viewer ${PCL_LIBRARIES})