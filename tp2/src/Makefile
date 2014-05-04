CC:=gcc
CFLAGS:= -std=c99 -pedantic -pedantic-errors -O3 -DNDEBUG -ggdb -DDEBUG -fno-inline -Wall #-Werror
VFLAGS:= --track-origins=yes --leak-check=full --trace-children=yes --show-reachable=yes -v

RM:= rm -fr
EXEC:= tp1

.PHONY: clean all assembly

all: $(EXEC)

$(EXEC): main.o arg_parse.o
	$(CC) $(CFLAGS) main.o arg_parse.o wc.o -o $(EXEC)

valgrind: $(EXEC)
	valgrind $(VFLAGS) ./$(EXEC) -e

clean:
	$(RM) *.o assembly/*.o $(EXEC)

assembly:
	#main.o arg_parse.o
	gcc -c assembly/wc.S -o wc.o
	gcc -c assembly/count.S -o count.o
	#$(CC) $(CFLAGS) main.o arg_parse.o wc.o count.o -o tp1
