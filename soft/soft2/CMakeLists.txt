#
# Created by zjj on 9/5/23.
#

cmake_minimum_required(VERSION 3.26)
project(eie_2_soft)

set(CMAKE_CXX_STANDARD 17)

add_executable(eie_2_soft main.cpp distribute.h distribute.cpp)
