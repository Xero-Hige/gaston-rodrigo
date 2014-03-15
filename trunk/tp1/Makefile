CC:=gcc
CFLAGS:= -std=c99 -Wall -Werror -pedantic -pedantic-errors -O3 -DNDEBUG -ggdb -DDEBUG -fno-inline
RM:= rm -fr

.PHONY: clean all

all: tp0

tp0: main.o arg_parse.o
	$(CC) $(CFLAGS) $^ -o $@

clean:
	- $(RM) *.o tp0
