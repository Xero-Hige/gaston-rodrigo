CC:=gcc
CFLAGS:= -std=c99 -pedantic -pedantic-errors -DNDEBUG -ggdb -DDEBUG -fno-inline -Wall #-Werror
VFLAGS:= --track-origins=yes --leak-check=full --trace-children=yes --show-reachable=yes -v

RM:= rm -fr
EXEC:= tp1

.PHONY: clean all assembly

#all: $(EXEC)

#$(EXEC): main.o arg_parse.o wc.o
#	$(CC) $(CFLAGS) main.o arg_parse.o wc.o count.o -o $(EXEC)

all: 
	#gcc -c arg_parse.c -o arg_parse.o
	gcc -c wc.c -o wc.o
	gcc -c main.c -o main.o
	gcc wc.o main.o -o $(EXEC)

valgrind: $(EXEC)
	valgrind $(VFLAGS) ./$(EXEC) -e

clean:
	$(RM) *.o assembly/*.o $(EXEC)

assembly:
	gcc -c wc.S -o wc.o
	gcc -c count.S -o count.o
	gcc -c arg_parse.c -o arg_parse.o
	gcc -c main.c -o main.o
	gcc wc.o count.o arg_parse.o main.o -o $(EXEC)
