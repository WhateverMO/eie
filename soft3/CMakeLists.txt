#
# Created by zjj on 9/5/23.
#

cmake_minimum_required(VERSION 3.26)
project(eie_3_soft)

set(CMAKE_CXX_STANDARD 17)

add_executable(eie_3_soft main.cpp distribute.h distribute.cpp Subject.h Observer.h)
