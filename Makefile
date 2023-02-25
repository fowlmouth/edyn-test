BIN := app

SRC := $(shell find src -type f -name '*.cpp')
OBJ := $(SRC:.cpp=.o)

CXXFLAGS := -std=c++20 -Ideps/entt/src -Ideps/edyn/include
LDLIBS := -Ldeps -ledyn

EDYN_LIB := deps/libedyn.a

ALL: run
.PHONY: clean cleanall init run

init:
	git submodule update --init

run: $(BIN)
	./$(BIN)

$(BIN): $(OBJ) $(EDYN_LIB)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $(OBJ) $(LDLIBS)

$(EDYN_LIB):
	$(MAKE) -C deps

clean:
	rm -f $(OBJ)

cleanall: clean
	rm -f $(BIN)
	$(MAKE) -C deps cleanall


