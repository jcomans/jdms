add_executable(jdms 
  main.cpp
  gui/Gui.cpp
  gui/GuiApplication.cpp
  gui/MainWidget.cpp
  )

target_compile_features(jdms PRIVATE cxx_std_17)

target_link_libraries(jdms PRIVATE 
  Wt::Wt
  Wt::HTTP
  )