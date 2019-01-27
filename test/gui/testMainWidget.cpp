#include <boost/test/unit_test.hpp>

#include <Wt/WApplication.h>
#include <Wt/WContainerWidget.h>
#include <Wt/Test/WTestEnvironment.h>

#include "MainWidget.hpp"

BOOST_AUTO_TEST_CASE( simple )
{
  Wt::Test::WTestEnvironment env;
  Wt::WApplication app(env);

  jdms::gui::MainWidget* widget = app.root()->addWidget(std::make_unique<jdms::gui::MainWidget>());

  BOOST_REQUIRE(widget->text() == "Welcome to jdms!");
}
