cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

PROJECT(eigen_test)

find_package(Eigen3 REQUIRED)

INCLUDE_DIRECTORIES(${EIGEN3_INCLUDE_DIR})

message(STATUS "include: ${EIGEN3_INCLUDE_DIR}  ")
add_executable(eigen_test eigen_test.cpp)

