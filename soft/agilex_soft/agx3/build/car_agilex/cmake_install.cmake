# Install script for directory: /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/src/car_agilex

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/car_agilex/msg" TYPE FILE FILES
    "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/src/car_agilex/msg/ActuatorState.msg"
    "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/src/car_agilex/msg/LightState.msg"
    "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/src/car_agilex/msg/ScoutState.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/car_agilex/srv" TYPE FILE FILES
    "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/src/car_agilex/srv/ScoutMotionCmd.srv"
    "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/src/car_agilex/srv/ScoutLightCmd.srv"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/car_agilex/cmake" TYPE FILE FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/build/car_agilex/catkin_generated/installspace/car_agilex-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/devel/include/car_agilex")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/devel/share/roseus/ros/car_agilex")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/devel/share/common-lisp/ros/car_agilex")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/devel/share/gennodejs/ros/car_agilex")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/devel/lib/python2.7/dist-packages/car_agilex")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/devel/lib/python2.7/dist-packages/car_agilex")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/build/car_agilex/catkin_generated/installspace/car_agilex.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/car_agilex/cmake" TYPE FILE FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/build/car_agilex/catkin_generated/installspace/car_agilex-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/car_agilex/cmake" TYPE FILE FILES
    "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/build/car_agilex/catkin_generated/installspace/car_agilexConfig.cmake"
    "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/build/car_agilex/catkin_generated/installspace/car_agilexConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/car_agilex" TYPE FILE FILES "/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx3/src/car_agilex/package.xml")
endif()

