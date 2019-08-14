cmake_minimum_required(VERSION 3.0)
#set(CMAKE_VERBOSE_MAKEFILE ON)
set(BUILD_SWITCH ON CACHE BOOL "Build with NX (SWITCH) support")


set(CMAKE_SYSTEM_NAME "Generic")

set(DEVKITPRO $ENV{DEVKITPRO})
set(CMAKE_SYSTEM_PROCESSOR "armv8-a")
set(CMAKE_C_COMPILER "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-gcc")
set(CMAKE_CXX_COMPILER "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-g++")
set(CMAKE_ASM_COMPILER "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-as")
set(CMAKE_INSTALL_INCLUDEDIR "${CMAKE_CURRENT_SOURCE_DIR}/Output/include")
set(CMAKE_INSTALL_LIBDIR "${CMAKE_CURRENT_SOURCE_DIR}/Output/lib")
FILE(GLOB INSTALL_HEADERS "include/kitchensink/*.h")
set(CMAKE_AR "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-gcc-ar" CACHE STRING "")
set(CMAKE_RANLIB "${DEVKITPRO}/devkitA64/bin/aarch64-none-elf-gcc-ranlib" CACHE STRING "")
set(CMAKE_C_FLAGS "-g -O2 -march=armv8-a -mtune=cortex-a57 -mtp=soft -ftls-model=local-exec -fPIC -I${DEVKITPRO}/libnx/include -I${DEVKITPRO}/portlibs/switch/include" CACHE STRING "C flags")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fno-rtti -fno-exceptions" CACHE STRING "C++ flags")
set(CMAKE_FIND_ROOT_PATH ${DEVKITPRO} ${DEVKITPRO}/devkitA64 ${DEVKITPRO}/libnx ${DEVKITPRO}/portlibs/switch)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "Shared libs not available")

project(SDL_kitchensink)
set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
set(KIT_VERSION_MAJOR "1")
set(KIT_VERSION_MINOR "0")
set(KIT_VERSION_PATCH "7")
set(KIT_VERSION ${KIT_VERSION_MAJOR}.${KIT_VERSION_MINOR}.${KIT_VERSION_PATCH})
add_definitions(
    -DKIT_VERSION_MAJOR=${KIT_VERSION_MAJOR}
    -DKIT_VERSION_MINOR=${KIT_VERSION_MINOR}
    -DKIT_VERSION_PATCH=${KIT_VERSION_PATCH}
)
set(SRC_DIRS
		src
        src/internal
        src/internal/audio
        src/internal/subtitle
        src/internal/subtitle/renderers
        src/internal/utils
        src/internal/video
        )

set(SRC_FILES )
foreach (DIR ${SRC_DIRS})
    file(GLOB FILES ${DIR}/*.c*)
    list(APPEND SRC_FILES ${FILES})
endforeach (DIR)


find_package(SDL2 REQUIRED)
message(STATUS "Found SDL2: ${SDL2_INCLUDE_DIRS}")
message(STATUS "Found SDL2_LIB: ${SDL2_LIBRARIES}")
find_package(ffmpeg COMPONENTS avcodec avformat avutil swscale swresample)
find_package(ass)

set(LIBRARIES
    ${SDL2_LIBRARIES}
    ${FFMPEG_LIBRARIES}
    ${ASS_LIBRARIES}
)
set(INCLUDES
    ${PROJECT_SOURCE_DIR}/include
    ${SDL2_INCLUDE_DIRS}
    ${FFMPEG_INCLUDE_DIRS}
    ${ASS_INCLUDE_DIRS}
)

# SDL2 library
add_library(${PROJECT_NAME} STATIC ${SRC_FILES})
target_include_directories(${PROJECT_NAME} PUBLIC ${SRC_DIRS} include)
set(PKG_CONFIG_FILE "${CMAKE_CURRENT_BINARY_DIR}/SDL_kitchensink.pc")

configure_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/pkg-config.pc.in"
    ${PKG_CONFIG_FILE}
    @ONLY
)

target_compile_options(${PROJECT_NAME} PUBLIC -O3 -D__PPLAY__ -D__SWITCH__ -DSDL_VIDEO_STATIC_ANGLE)
include_directories(${INCLUDES})
target_link_libraries(${PROJECT_NAME} ${LIBRARIES})
install(FILES ${INSTALL_HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/kitchensink)
install(TARGETS SDL_kitchensink
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
