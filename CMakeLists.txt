cmake_minimum_required( VERSION 3.10 )

project( TEST_OSG )

set( CMAKE_CXX_STANDARD_REQUIRED ON )
set( CMAKE_CXX_STANDARD 17 )

option( architecture_64 "select build architecture (32 or 64) bit." ON )

set( release_compile_flags "-O2 -Wall -Wextra -s" )
set( debug_compile_flags "-g3 -Wall -Wextra" )

if( architecture_64 )
    set( target_architecture "64" )
else()
    set( target_architecture "32" )
endif()

if( WIN32 ) 
    set( target_os "windows" )

elseif( UNIX )
    if( CMAKE_SYSTEM_NAME STREQUAL "Linux" )
        set( target_os "linux" )
    else()
        message( FATAL_ERROR "UNIX platform other than Linux detected!\n" )
    endif() 

else()
    message( FATAL_ERROR "only windows and linux are currently supported!\n" )
endif()

if( CMAKE_BUILD_TYPE STREQUAL "Debug" )
    set(target_build_type "debug")
else()
    set(target_build_type "release")
endif()

find_package( OpenThreads )
find_package( osg )
find_package( osgDB )
find_package( osgUtil )
find_package( osgViewer )
find_package( osgParticle )

include_directories(src)

macro( config_project PROJNAME LIBNAME )
    include_directories( ${${LIBNAME}_INCLUDE_DIR} )
    target_link_libraries( ${PROJNAME} ${${LIBNAME}_LIBRARY} )
endmacro()

set(executable_build_path "../build/${target_build_type}/")

file(GLOB_RECURSE target_source_files src/*.cpp)

add_executable( sandbox ${target_source_files} )

set_target_properties( sandbox PROPERTIES
                            RUNTIME_OUTPUT_DIRECTORY "${executable_build_path}"
                     )

if( CMAKE_BUILD_TYPE STREQUAL "Debug" )
    set_target_properties( sandbox PROPERTIES
                            COMPILE_FLAGS "-m${target_architecture} ${debug_compile_flags}"
                        )
else()
    set_target_properties( sandbox PROPERTIES
                            COMPILE_FLAGS "-m${target_architecture} ${release_compile_flags}"
                         )


endif()

config_project( sandbox OPENTHREADS )
config_project( sandbox OSG )
config_project( sandbox OSGDB )
config_project( sandbox OSGUTIL )
config_project( sandbox OSGVIEWER )
config_project( sandbox OSGPARTICLE )