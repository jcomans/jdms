#include "GuiApplication.hpp"

#include <memory>

#include <Wt/WContainerWidget.h>

#include "MainWidget.hpp"

using Application = jdms::gui::Application;

Application::Application(const Wt::WEnvironment& env) :
  Wt::WApplication(env)
{
  setTitle("jdms");

  root()->addWidget(std::make_unique<jdms::gui::MainWidget>());
}
