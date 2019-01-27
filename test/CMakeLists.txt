enable_testing()

add_custom_target(testsuite)

add_custom_target(check COMMAND "ctest" "--output-on-failure")
add_dependencies(check testsuite)

function(ADD_JTEST)
  cmake_parse_arguments(PARSE_ARGV 0 TEST_ARGS "" "NAME" "SOURCES;INCLUDE_DIRS;LINK_LIBRARIES")

  add_executable(${TEST_ARGS_NAME}
    ${TEST_ARGS_SOURCES}
    )

  target_compile_definitions(${TEST_ARGS_NAME}
    PRIVATE
    BOOST_TEST_DYN_LINK
    BOOST_TEST_MODULE=${TEST_ARGS_NAME}
    )

  if(TEST_ARGS_NAME)
    target_include_directories(${TEST_ARGS_NAME}
      PRIVATE
      ${TEST_ARGS_INCLUDE_DIRS}
      )
  endif()

  if(TEST_ARGS_LINK_LIBRARIES)
    target_link_libraries(test-gui-main-widget
      PRIVATE
      ${TEST_ARGS_LINK_LIBRARIES}
      )
  endif()

  add_dependencies(testsuite ${TEST_ARGS_NAME})

  add_test(${TEST_ARGS_NAME} ${TEST_ARGS_NAME})
endfunction()

add_subdirectory(gui)