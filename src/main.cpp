#include <entt/entt.hpp>
#include <edyn/edyn.hpp>

int main(int argc, const char** argv)
{
  entt::registry reg;
  edyn::attach(reg);

  for(int i = 0; i < 10; ++i)
  {
    edyn::update(reg);
  }

  return 0;
}
