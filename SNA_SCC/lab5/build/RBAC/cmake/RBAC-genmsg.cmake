# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "RBAC: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(RBAC_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv" NAME_WE)
add_custom_target(_RBAC_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "RBAC" "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(RBAC
  "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RBAC
)

### Generating Module File
_generate_module_cpp(RBAC
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RBAC
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(RBAC_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(RBAC_generate_messages RBAC_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv" NAME_WE)
add_dependencies(RBAC_generate_messages_cpp _RBAC_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RBAC_gencpp)
add_dependencies(RBAC_gencpp RBAC_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RBAC_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(RBAC
  "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RBAC
)

### Generating Module File
_generate_module_eus(RBAC
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RBAC
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(RBAC_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(RBAC_generate_messages RBAC_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv" NAME_WE)
add_dependencies(RBAC_generate_messages_eus _RBAC_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RBAC_geneus)
add_dependencies(RBAC_geneus RBAC_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RBAC_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(RBAC
  "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RBAC
)

### Generating Module File
_generate_module_lisp(RBAC
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RBAC
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(RBAC_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(RBAC_generate_messages RBAC_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv" NAME_WE)
add_dependencies(RBAC_generate_messages_lisp _RBAC_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RBAC_genlisp)
add_dependencies(RBAC_genlisp RBAC_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RBAC_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(RBAC
  "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RBAC
)

### Generating Module File
_generate_module_nodejs(RBAC
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RBAC
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(RBAC_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(RBAC_generate_messages RBAC_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv" NAME_WE)
add_dependencies(RBAC_generate_messages_nodejs _RBAC_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RBAC_gennodejs)
add_dependencies(RBAC_gennodejs RBAC_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RBAC_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(RBAC
  "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RBAC
)

### Generating Module File
_generate_module_py(RBAC
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RBAC
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(RBAC_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(RBAC_generate_messages RBAC_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/zjj/Documents/workspace/eie/SNA_SCC/lab5/src/RBAC/srv/access.srv" NAME_WE)
add_dependencies(RBAC_generate_messages_py _RBAC_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(RBAC_genpy)
add_dependencies(RBAC_genpy RBAC_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS RBAC_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RBAC)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/RBAC
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(RBAC_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RBAC)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/RBAC
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(RBAC_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RBAC)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/RBAC
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(RBAC_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RBAC)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/RBAC
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(RBAC_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RBAC)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RBAC\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RBAC
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  string(REGEX REPLACE "([][+.*()^])" "\\\\\\1" ESCAPED_PATH "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RBAC")
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/RBAC
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${ESCAPED_PATH}/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(RBAC_generate_messages_py std_msgs_generate_messages_py)
endif()
