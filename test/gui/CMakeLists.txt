add_jtest(NAME test-gui-main-widget
  SOURCES
   testMainWidget.cpp
   ${CMAKE_SOURCE_DIR}/source/gui/MainWidget.cpp
  INCLUDE_DIRS
   ${CMAKE_SOURCE_DIR}/source/gui
  LINK_LIBRARIES
   Wt::Wt
   Wt::Test
   Boost::unit_test_framework
  )
  