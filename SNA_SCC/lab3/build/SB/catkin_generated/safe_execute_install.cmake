execute_process(COMMAND "/home/zjj/Documents/workspace/eie/SNA_SCC/lab3/build/SB/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/zjj/Documents/workspace/eie/SNA_SCC/lab3/build/SB/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
