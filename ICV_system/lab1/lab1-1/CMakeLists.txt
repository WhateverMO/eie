cmake_minimum_required(VERSION 3.0.0)

project(pclshiyan VERSION 0.1.0)

find_package(PCL REQUIRED)
find_package(Boost REQUIRED COMPONENTS system chrono thread)

include_directories(${PCL_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS})
link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})


add_executable(zhitonglvbo zhitonglvbo.cpp)
target_link_libraries(zhitonglvbo 
			${PCL_LIBRARIES} ${Boost_LIBRARIES})