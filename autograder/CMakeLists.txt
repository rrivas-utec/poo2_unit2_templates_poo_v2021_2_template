cmake_minimum_required(VERSION 3.20)
project(poo2_unit2_templates_poo_v2021_2_test)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${OUTPUT_DEBUG})
if(UNIX AND NOT APPLE)
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
endif()

# Work Folders
include_directories(.)
include_directories(tests)
include_directories(../tools/catch)

# Source files
file(GLOB source_files
        ../src/*.h
        ../src/*.cpp
        )

foreach(full_file_name ${source_files})
    configure_file(${full_file_name} ${CMAKE_CURRENT_SOURCE_DIR}/tests/ COPYONLY)
endforeach(full_file_name)

# Project files
file(GLOB project_files
        tests/catch_test_*/*.cpp
        tests/*.h
        tests/*.cpp
        )

add_executable(${PROJECT_NAME}
        ${project_files}
    )

if(UNIX AND NOT APPLE)
    find_package(TBB)
    target_link_libraries(${PROJECT_NAME} TBB::tbb)
endif()

# Test files
file(GLOB test_files
        tests/catch_test_*/*.in
    )
foreach(full_test_file_name ${test_files})
    configure_file(${full_test_file_name} ${CMAKE_RUNTIME_OUTPUT_DIRECTORY} COPYONLY)
endforeach(full_test_file_name)