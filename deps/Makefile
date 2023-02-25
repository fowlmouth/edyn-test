EDYN_LIB := libedyn.a
EDYN_SRC := $(shell find edyn/src -type f -name '*.cpp' -not -path edyn/src/edyn/time/windows/time.cpp)
EDYN_OBJ := $(EDYN_SRC:.cpp=.o)
EDYN_HEADER := edyn/include/edyn/build_settings.h

CXXFLAGS := -std=c++20 -Ientt/src -Iedyn/include

ALL: $(EDYN_LIB)
.PHONY: clean cleanall init

init:
	git submodule update --init

%.o: %.cpp $(EDYN_HEADER)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(EDYN_LIB): $(EDYN_OBJ)
	ar rvs $@ $^

$(EDYN_HEADER): init
	sed 's/#cmakedefine /#define /' edyn/cmake/in/build_settings.h.in > $@

clean:
	rm -f $(EDYN_OBJ) $(EDYN_HEADER)

cleanall: clean
	rm -f $(EDYN_LIB)


