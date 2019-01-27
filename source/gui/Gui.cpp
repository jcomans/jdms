#include "Gui.hpp"

#include "GuiApplication.hpp"

using Gui = jdms::Gui;

Gui::Gui(int argc, char** argv)
{
  Wt::WRun(argc, argv, [](const Wt::WEnvironment& env) 
                       {
                         return std::make_unique<jdms::gui::Application>(env);
                       });
}
