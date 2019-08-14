# Install script for directory: /home/li/ONScripter-Switch/SDL_kitchensink

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kitchensink.h;/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kitcodec.h;/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kitconfig.h;/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kiterror.h;/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kitformat.h;/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kitlib.h;/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kitplayer.h;/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kitsource.h;/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink/kitutils.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/li/ONScripter-Switch/SDL_kitchensink/Output/include/kitchensink" TYPE FILE FILES
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kitchensink.h"
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kitcodec.h"
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kitconfig.h"
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kiterror.h"
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kitformat.h"
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kitlib.h"
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kitplayer.h"
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kitsource.h"
    "/home/li/ONScripter-Switch/SDL_kitchensink/include/kitchensink/kitutils.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/li/ONScripter-Switch/SDL_kitchensink/Output/lib/libSDL_kitchensink.a")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/li/ONScripter-Switch/SDL_kitchensink/Output/lib" TYPE STATIC_LIBRARY FILES "/home/li/ONScripter-Switch/SDL_kitchensink/build/libSDL_kitchensink.a")
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/li/ONScripter-Switch/SDL_kitchensink/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
