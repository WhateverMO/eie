# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build

# Include any dependencies generated for this target.
include my_navigation/CMakeFiles/recognize.dir/depend.make

# Include the progress variables for this target.
include my_navigation/CMakeFiles/recognize.dir/progress.make

# Include the compile flags for this target's objects.
include my_navigation/CMakeFiles/recognize.dir/flags.make

my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o: my_navigation/CMakeFiles/recognize.dir/flags.make
my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o: /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/src/my_navigation/src/recognize.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o"
	cd /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/my_navigation && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/recognize.dir/src/recognize.cpp.o -c /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/src/my_navigation/src/recognize.cpp

my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/recognize.dir/src/recognize.cpp.i"
	cd /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/my_navigation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/src/my_navigation/src/recognize.cpp > CMakeFiles/recognize.dir/src/recognize.cpp.i

my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/recognize.dir/src/recognize.cpp.s"
	cd /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/my_navigation && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/src/my_navigation/src/recognize.cpp -o CMakeFiles/recognize.dir/src/recognize.cpp.s

my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o.requires:

.PHONY : my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o.requires

my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o.provides: my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o.requires
	$(MAKE) -f my_navigation/CMakeFiles/recognize.dir/build.make my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o.provides.build
.PHONY : my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o.provides

my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o.provides.build: my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o


# Object files for target recognize
recognize_OBJECTS = \
"CMakeFiles/recognize.dir/src/recognize.cpp.o"

# External object files for target recognize
recognize_EXTERNAL_OBJECTS =

/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: my_navigation/CMakeFiles/recognize.dir/build.make
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libtf.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libtf2_ros.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libactionlib.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libmessage_filters.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libroscpp.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libboost_filesystem.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libtf2.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /home/agilex/catkin_ws/devel/lib/libcv_bridge.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_core.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_imgproc.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_imgcodecs.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/librosconsole.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/liblog4cxx.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libboost_regex.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/librostime.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /opt/ros/melodic/lib/libcpp_common.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libboost_system.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libboost_thread.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libboost_chrono.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libboost_date_time.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libboost_atomic.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libpthread.so
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libconsole_bridge.so.0.4
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_shape.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_stitching.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_superres.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_videostab.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_aruco.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_bgsegm.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_bioinspired.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_ccalib.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_datasets.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_dpm.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_face.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_freetype.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_fuzzy.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_hdf.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_line_descriptor.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_optflow.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_plot.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_reg.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_saliency.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_stereo.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_structured_light.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_surface_matching.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_text.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_ximgproc.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_xobjdetect.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_xphoto.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_video.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_viz.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_phase_unwrapping.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_rgbd.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_calib3d.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_features2d.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_flann.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_objdetect.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_ml.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_highgui.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_photo.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_videoio.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_imgcodecs.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_imgproc.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: /usr/lib/aarch64-linux-gnu/libopencv_core.so.3.2.0
/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize: my_navigation/CMakeFiles/recognize.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize"
	cd /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/my_navigation && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/recognize.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
my_navigation/CMakeFiles/recognize.dir/build: /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/devel/lib/my_navigation/recognize

.PHONY : my_navigation/CMakeFiles/recognize.dir/build

my_navigation/CMakeFiles/recognize.dir/requires: my_navigation/CMakeFiles/recognize.dir/src/recognize.cpp.o.requires

.PHONY : my_navigation/CMakeFiles/recognize.dir/requires

my_navigation/CMakeFiles/recognize.dir/clean:
	cd /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/my_navigation && $(CMAKE_COMMAND) -P CMakeFiles/recognize.dir/cmake_clean.cmake
.PHONY : my_navigation/CMakeFiles/recognize.dir/clean

my_navigation/CMakeFiles/recognize.dir/depend:
	cd /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/src /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/src/my_navigation /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/my_navigation /home/agilex/Documents/workspace/eie/soft/agilex_soft/agx4/build/my_navigation/CMakeFiles/recognize.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : my_navigation/CMakeFiles/recognize.dir/depend

