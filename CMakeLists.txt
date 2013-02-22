# ================================================================

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(lua)

# ================================================================

set(OutputDir ${CMAKE_CURRENT_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${OutputDir})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${OutputDir})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${OutputDir})

set(CMAKE_C_FLAGS "-g -Wall ${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "-g -Wall ${CMAKE_CXX_FLAGS}")
set(CMAKE_DEBUG_POSTFIX "d")

if(APPLE)
    # Set the Base SDK (only change the SDKVER value, if for instance, you are building for iOS 5.0):
    set(SDKVER "6.1")
    set(DEVROOT "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer")
    set(SDKROOT "${DEVROOT}/SDKs/iPhoneOS${SDKVER}.sdk")    
    if(APPLE_IOS OR APPLE_OSX)
        if(EXISTS ${SDKROOT})
            set(CMAKE_OSX_SYSROOT "${SDKROOT}")
        else()
            message("Warning, iOS Base SDK path not found: " ${SDKROOT})
        endif()
        # Will resolve to "Standard (armv6 armv7)" on Xcode 4.0.2 and to "Standard (armv7)" on Xcode 4.2:
        set(CMAKE_OSX_ARCHITECTURES "$(ARCHS_STANDARD_32_BIT)")
        # seamless toggle between device and simulator
        set(CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphoneos;-iphonesimulator")
    endif()
endif()

# ================================================================

SET(CMAKE_DEBUG_POSTFIX "d")
#SET(CMAKE_C_FLAGS "-w ${CMAKE_C_FLAGS}")
#SET(CMAKE_CXX_FLAGS "-w ${CMAKE_CXX_FLAGS}")

# ================================================================

FILE(GLOB src ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
FILE(GLOB inc ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/src)

ADD_LIBRARY(lua ${src} ${inc})

# ================================================================