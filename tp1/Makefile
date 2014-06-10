CC:=gcc
CFLAGS:= -std=c99 -Wextra -pedantic -pedantic-errors -O3 -DNDEBUG -ggdb -DDEBUG -fno-inline -Wall #-Werror
VFLAGS:= --track-origins=yes --leak-check=full --trace-children=yes --show-reachable=yes -v

RM:= rm -fr
EXEC:= tp0

.PHONY: clean all

all: $(EXEC)

$(EXEC): main.o base_64.o arg_parse.o
	$(CC) $(CFLAGS) $^ -o $@

valgrind: $(EXEC)
	valgrind $(VFLAGS) ./$(EXEC) -e

clean:
	- $(RM) *.o $(EXEC)

pdf: clean
	a2ps *.h *.c  -Av --header="[66.20] Organizacion de computadoras" --footer="Curso Jueves - Tp0" --line-numbers=1 --borders=yes --columns=2  --landscape --output="Codigo Tp0" --encoding="ISO-8859-1" --tabsize=4 --major=columns --toc  | ps2pdf "Codigo Tp0" fuente.pdf
