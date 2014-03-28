CC:=gcc
CFLAGS:= -std=c99 -Wextra -pedantic -pedantic-errors -O3 -DNDEBUG -ggdb -DDEBUG -fno-inline
#-Wall -Werror
VFLAGS:= --track-origins=yes --leak-check=full --trace-children=yes --show-reachable=yes -v

RM:= rm -fr
EXEC:= tp0

.PHONY: clean all

all: $(EXEC)

$(EXEC): main.o base_64.o arg_parse.o
	$(CC) $(CFLAGS) $^ -o $@

valgrind: $(EXEC)
	valgrind $(VFLAGS) ./$(EXEC)

clean:
	- $(RM) *.o $(EXEC)
