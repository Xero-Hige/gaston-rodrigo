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
		fprintf(stderr,"No se especifico ningun comando\n");
		return 1;
	}
	TParseArg* args;
	char *input = NULL;
	int* res = NULL;
	int fd;
	int i;
	int* lines;
	int* words;
	int* bytes;
	int flagsPassed = 0;

	// Creo el parseador de argumentos
	args = ParseArg_new(5);
	// Agrego los argumentos a parsear, si uso valores por defecto como NULL con tama~no 0,
	// estoy haciendo qe sean obligatorios los argumentos
	ParseArg_addArg(args, NULL, 'V', "version", NULL, 0);
	ParseArg_addArg(args, NULL, 'h', "help", NULL, 0);
	ParseArg_addArg(args, NULL, 'w', "words", NULL, 0);
	ParseArg_addArg(args, NULL, 'l', "lines", NULL, 0);
	ParseArg_addArg(args, NULL, 'c', "bytes", NULL, 0);
	//ParseArg_addArg(args, &ParseArg_parseStr, " ", "", NULL, 0);
	ParseArg_parse(args, argc, argv);

	if(ParseArg_getArg(args, 'h')){
		flagsPassed++;
		usage(argv[0]);
		ParseArg_delete(args);
		return 0;
	}

	if(ParseArg_getArg(args, 'l')){
		flagsPassed++;
		printf("l\n");
		//ParseArg_delete(args);
		//return 0;
	}


	if(ParseArg_getArg(args, 'w')){
		flagsPassed++;
		printf("w\n");
		//ParseArg_delete(args);
		//return 0;
	}


	if(ParseArg_getArg(args, 'c')){
		flagsPassed++;
		printf("c\n");
		//ParseArg_delete(args);
		//return 0;
	}

	if(ParseArg_getArg(args, 'V')){
		flagsPassed++;
		printf("V\n");
		version(argv[0]);
		ParseArg_delete(args);
		return 0;
	}


	//Si no tengo argumentos tengo que leer de stdin y hacer todo
	if (argc == 1 ){
		//CONTAR BYTES, PALABRAS Y LINEAS DEL ARCHIVO STDIN
	}

	//Si la diferencia entre argumentos y flags es mayor a 2 entonces
	//tengo mas de 1 archivo y los leo todos 
	printf("flags %d\n",flagsPassed);
	if ( 1 + argc - flagsPassed > 2 ){
		for ( i = flagsPassed+1 ; i < argc ; i++ ){
			//printf("en i: %d %s \n",i, argv[argc+flagsPassed-i]);
			fd = open(argv[argc+flagsPassed-i], O_RDONLY, S_IRUSR|S_IWUSR);
			wc(fd, lines, words ,bytes);
			printf("Lines: %d \t words: %d \t bytes: %d \n",*lines,*words,*bytes);
		}
	}

	//Si la diferencia es 2, puede ser un archivo o stdin
	//TODO: Poner en el informe que los archivos siempre van dsp de los argumentos 
	if ( 1 + argc - flagsPassed == 2 ){
		printf("archivo o stdin\n");
		printf("es el %s", argv[1+argc-flagsPassed]);
		fd = open(argv[argc+flagsPassed-i], O_RDONLY, S_IRUSR|S_IWUSR);
		wc(fd, lines, words ,bytes);
		printf("Lines: %d \t words: %d \t bytes: %d \n",*lines,*words,*bytes);
	}

	//input = (char*) ParseArg_getArg(args, ' ');
	

	//if(input == NULL){
	//	printf("es stdin\n");
	//	inFile = stdin;
	//}else{
	//	printf("es archivo \n");
	//	inFile = fopen(input, "r");
	//	if(!inFile){
	//		free(input);
	//		ParseArg_delete(args);
	//		return 1;
	//	}
	//}

//	if(inFile != stdin)
//		fclose(inFile);

	if( !(ParseArg_getArg(args,'V')) || !(ParseArg_getArg(args,'h')) || !(ParseArg_getArg(args,'w')) || !(ParseArg_getArg(args,'l') || !(ParseArg_getArg(args,'c')))){
		fprintf(stderr,"Parametro invalido\n");
		return 1;
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
