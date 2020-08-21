find_package(curlpp ${curlpp_MINIMUM_REQUIRED} QUIET COMPONENTS ${curlpp_COMPONENTS_REQUIRED})

project(download_curlpp VERSION "1.0.0")

if(curlpp_FOUND)
  message(STATUS "Found curlpp version ${curlpp_MAJOR_VERSION}.${curlpp_MINOR_VERSION}.${curlpp_SUBMINOR_VERSION}")
  add_library(curlpp_external INTERFACE)
else()
  message(STATUS "curlpp ${curlpp_MINIMUM_REQUIRED} could not be located, Building curlpp instead.")
  include(FetchContent)

  FetchContent_Declare(curlpp
    GIT_REPOSITORY https://github.com/jpbarrette/curlpp.git
    GIT_TAG v0.8.1)
  
  FetchContent_GetProperties(curlpp)
  if(NOT curlpp_POPULATED)
    FetchContent_Populate(curlpp)
    add_subdirectory(${curlpp_SOURCE_DIR} ${curlpp_BINARY_DIR} EXCLUDE_FROM_ALL)
  endif()
endif()