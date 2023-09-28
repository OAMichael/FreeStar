cmake_minimum_required(VERSION 3.11)

project(Free-Star VERSION 1.0)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

find_package(CSFML 2.5 REQUIRED)

set(LINK_OPT -lcsfml-system -lcsfml-window -lcsfml-graphics)

include_directories(lib)

file(GLOB SRCS ./*.c ./lib/*.c)

add_executable(FreeStar.exe ${SRCS})

target_link_libraries(FreeStar.exe PUBLIC ${LINK_OPT})