BIN := app

SRC := $(shell find src -type f -name '*.cpp')
OBJ := $(SRC:.cpp=.o)

ALL: run
.PHONY: clean cleanall init run

init:
	git submodule update --init

run: $(BIN)
	./$(BIN)

$(BIN): $(OBJ)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)

clean:
	rm -f $(OBJ)

cleanall: clean
	rm -f $(BIN)


