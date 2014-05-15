#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>

#include "arg_parse.h"

#define MAX_FLAGS 5

void usage();
void wc(int fd, int* lines, int* words, int* bytes); void version(char* nombre);

int main(int argc, char* argv[]){
	if (argc < 2){
		fprintf(stderr,"No se especifico ningun comando. Ingrese -h para mostrar la ayuda\n");
		return 1;
	}

	TParseArg* args;
	char *input = NULL;
	int* res = NULL;
	int fd;
	int i=0;
	int lines=0;
	int words=0;
	int bytes=0;
	int flagsPassed = 0;
	int flagPrintLines=1;
	int flagPrintWords=1;
	int flagPrintBytes=1;

	// Creo el parseador de argumentos
	args = ParseArg_new(5);
	// Agrego los argumentos a parsear, si uso valores por defecto como NULL con tama~no 0,
	// estoy haciendo qe sean obligatorios los argumentos
	ParseArg_addArg(args, NULL, 'V', "version", NULL, 0);
	ParseArg_addArg(args, NULL, 'h', "help", NULL, 0);
	ParseArg_addArg(args, NULL, 'w', "words", NULL, 0);
	ParseArg_addArg(args, NULL, 'l', "lines", NULL, 0);
	ParseArg_addArg(args, NULL, 'c', "bytes", NULL, 0);
	ParseArg_parse(args, argc, argv);

	if( !(ParseArg_getArg(args,'V')) || !(ParseArg_getArg(args,'h')) || !(ParseArg_getArg(args,'w')) || !(ParseArg_getArg(args,'l') || !(ParseArg_getArg(args,'c')))){
		fprintf(stderr,"Parametro invalido. Ingrese -h para mostrar la ayuda\n");
		return 1;
	}

	if(ParseArg_getArg(args, 'h')){
		flagsPassed++;
		usage(argv[0]);
		ParseArg_delete(args);
		return 0;
	}

	if(ParseArg_getArg(args, 'V')){
		flagsPassed++;
		version(argv[0]);
		ParseArg_delete(args);
		return 0;
	}

	if(ParseArg_getArg(args, 'l')){
		flagsPassed++;
		flagPrintLines=0;
	}

	if(ParseArg_getArg(args, 'w')){
		flagsPassed++;
		flagPrintWords=0;
	}

	if(ParseArg_getArg(args, 'c')){
		flagsPassed++;
		flagPrintBytes=0;
	}

	//Si la diferencia entre argumentos y flags es mayor a 2 entonces
	//tengo mas de 1 archivo y los leo todos 
	if ( 1 + argc - flagsPassed > 2 ){
		int linesTotal = 0;
		int wordsTotal = 0;
		int bytesTotal = 0;
		for ( i = flagsPassed+1 ; i < argc ; i++ ){
			char* file;
			file = argv[argc+flagsPassed-i];
			fd = open(argv[argc+flagsPassed-i],O_RDONLY);
			wc(fd, &lines, &words ,&bytes);
			linesTotal = linesTotal + lines;
			wordsTotal = wordsTotal + words;
			bytesTotal = bytesTotal + bytes;
			if (flagPrintLines) {
				printf("\n %d ",lines);
			}
			if (flagPrintWords) {
				printf(" %d ",words);
			}
			if (flagPrintBytes) {
				printf(" %d ",bytes);
			}
			printf(" %s \n", file);
		}
		if (flagPrintLines) {
			printf(" %d ",linesTotal);
		}
		if (flagPrintWords) {
			printf(" %d ",wordsTotal);
		}
		if (flagPrintBytes) {
			printf(" %d ",bytesTotal);
		}
		printf(" total \n");
	}

	//Si la diferencia es 2, puede ser un archivo o stdin
	if ( 1 + argc - flagsPassed == 2 ){
		char* file;
		file = argv[1+argc-flagsPassed];
		fd = open(argv[argc+flagsPassed-i],O_RDONLY);
		wc(fd, &lines, &words ,&bytes);
		if (flagPrintLines) {
			printf("\n %d ",lines);
		}
		if (flagPrintWords) {
			printf(" %d ",words);
		}
		if (flagPrintBytes) {
			printf(" %d ",bytes);
		}
		printf(" %s \n", file);
	}

	free(res);
	free(input);
	ParseArg_delete(args);

	return 0;
}

void version(char* nombre){
	printf("%s 1.0.0\n", nombre);
}

void usage(char* nombre){
	printf("Usage:\n");
	printf("  %s -h \n",nombre);
	printf("  %s -V \n",nombre);
	printf("  %s [options] [file...] \n",nombre);
	printf("Options: \n");
	printf("  -V, --version Print version and quit.\n");

	printf("  -h, --help \t Print this information and quit.\n");
	printf("  -w, --words \t Print the number of words.\n");
	printf("  -l, --lines \t Print the number of lines.\n");
	printf("  -c, --bytes \t Print the number of bytes.\n");
}