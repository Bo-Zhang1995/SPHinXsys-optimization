if(NOT BUILD_WITH_SIMBODY)
    FINDLIBHOME(SIMBODY_HOME)
    FIND_PACKAGE(SIMBODY REQUIRED)
    IF(SIMBODY_FOUND)
        INCLUDE_DIRECTORIES("${Simbody_INCLUDE_DIR}")
        LINK_DIRECTORIES("${Simbody_LIB_DIR}")
        MESSAGE("${Simbody_INCLUDE_DIR}")
        MESSAGE("${Simbody_LIB_DIR}")
        MESSAGE("${Simbody_LIBRARIES}")
        MESSAGE("${Simbody_RELEASE_LIBRARIES}")
        MESSAGE("${Simbody_DEBUG_LIBRARIES}")
    ELSE(SIMBODY_FOUND)
        MESSAGE(FATAL_ERROR "Simbody library not found")
    ENDIF(SIMBODY_FOUND)
endif()

if(NOT EMSCRIPTEN)
    FINDLIBHOME(TBB_HOME)
    FIND_PACKAGE(TBB REQUIRED)
    IF(TBB_FOUND)
        INCLUDE_DIRECTORIES("${TBB_INCLUDE_DIR}")
        LINK_DIRECTORIES("${TBB_LIB_DIR}")
        MESSAGE("${TBB_INCLUDE_DIR}")
        MESSAGE("${TBB_LIB_DIR}")
        MESSAGE("${TBB_LIBRARIES}")
    ELSE(TBB_FOUND)
        MESSAGE(FATAL_ERROR "TBB library not found")
    ENDIF(TBB_FOUND)

    if(DEFINED BOOST_AVAILABLE)
        FINDLIBHOME(BOOST_HOME)
        set(BOOST_ROOT "${BOOST_HOME}")
        IF(MSVC)
        FIND_PACKAGE(Boost REQUIRED 
            COMPONENTS program_options)
        ELSE(MSVC)
            FIND_PACKAGE(Boost REQUIRED 
            COMPONENTS program_options filesystem system )
        ENDIF(MSVC)
        IF(Boost_FOUND)
            INCLUDE_DIRECTORIES("${Boost_INCLUDE_DIRS}")
            LINK_DIRECTORIES("${Boost_LIBRARY_DIRS}")
            MESSAGE("${Boost_INCLUDE_DIRS}")
            MESSAGE("${Boost_LIBRARY_DIRS}")
            MESSAGE("${Boost_LIBRARIES}")
        ELSE(Boost_FOUND)
            MESSAGE(FATAL_ERROR "Boost library not found")
        ENDIF(Boost_FOUND)
    endif()
endif()

IF(MSVC)
    FINDLIBHOME(GTEST_HOME)
    set(GTest_ROOT "${GTEST_HOME}") 
    find_package(GTest CONFIG REQUIRED)
    IF(GTest_FOUND)
       INCLUDE_DIRECTORIES(${GTEST_HOME}/include)
       LINK_DIRECTORIES("${GTEST_HOME}/lib")
    ELSE(GTest_FOUND)
        MESSAGE(FATAL_ERROR "GTest library not found")
    ENDIF(GTest_FOUND)
ENDIF(MSVC)
