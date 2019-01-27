cmake_minimum_required(VERSION 3.10)

project(jdms VERSION 0.0.1 LANGUAGES CXX)

find_package(Boost REQUIRED COMPONENTS unit_test_framework)

find_package(Wt REQUIRED)

add_subdirectory(source)
add_subdirectory(test)
