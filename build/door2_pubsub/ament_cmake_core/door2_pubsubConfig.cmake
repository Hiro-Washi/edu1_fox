# generated from ament/cmake/core/templates/nameConfig.cmake.in

# prevent multiple inclusion
if(_door2_pubsub_CONFIG_INCLUDED)
  # ensure to keep the found flag the same
  if(NOT DEFINED door2_pubsub_FOUND)
    # explicitly set it to FALSE, otherwise CMake will set it to TRUE
    set(door2_pubsub_FOUND FALSE)
  elseif(NOT door2_pubsub_FOUND)
    # use separate condition to avoid uninitialized variable warning
    set(door2_pubsub_FOUND FALSE)
  endif()
  return()
endif()
set(_door2_pubsub_CONFIG_INCLUDED TRUE)

# output package information
if(NOT door2_pubsub_FIND_QUIETLY)
  message(STATUS "Found door2_pubsub: 0.0.0 (${door2_pubsub_DIR})")
endif()

# warn when using a deprecated package
if(NOT "" STREQUAL "")
  set(_msg "Package 'door2_pubsub' is deprecated")
  # append custom deprecation text if available
  if(NOT "" STREQUAL "TRUE")
    set(_msg "${_msg} ()")
  endif()
  # optionally quiet the deprecation message
  if(NOT ${door2_pubsub_DEPRECATED_QUIET})
    message(DEPRECATION "${_msg}")
  endif()
endif()

# flag package as ament-based to distinguish it after being find_package()-ed
set(door2_pubsub_FOUND_AMENT_PACKAGE TRUE)

# include all config extra files
set(_extras "")
foreach(_extra ${_extras})
  include("${door2_pubsub_DIR}/${_extra}")
endforeach()
