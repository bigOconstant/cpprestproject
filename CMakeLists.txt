cmake_minimum_required(VERSION 3.7)
project(main)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall")

set(cpprestsdk_DIR /usr/lib/${CMAKE_LIBRARY_ARCHITECTURE}/cmake/)

find_package(cpprestsdk CONFIG REQUIRED)
find_package(Boost COMPONENTS system REQUIRED)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE cpprestsdk::cpprest ${Boost_SYSTEM_LIBRARY})