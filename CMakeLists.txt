# ================================================================

CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
PROJECT(lua)

# ================================================================

SET(CMAKE_DEBUG_POSTFIX "d")
set(CMAKE_C_FLAGS "-g -Wall ${CMAKE_C_FLAGS}")
set(CMAKE_CXX_FLAGS "-g -Wall ${CMAKE_CXX_FLAGS}")

# ================================================================

FILE(GLOB src ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
FILE(GLOB inc ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR}/src)

ADD_LIBRARY(lua ${src} ${inc})

# ================================================================