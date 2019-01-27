#ifndef JDMS_GUI_APPLICATION_H
#define JDMS_GUI_APPLICATION_H

#include <Wt/WApplication.h>

namespace jdms::gui
{
class Application: public Wt::WApplication
{
public:
  Application(const Wt::WEnvironment& env);
};
}

#endif /* JDMS_GUI_APPLICATION_H */
