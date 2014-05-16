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
	if (argc < 1){
		fprintf(stderr,"No se especifico ningun comando. Ingrese -h para mostrar la ayuda\n");
		return 1;
	}

	TParseArg* args;
	char* file;
	int fd = 1;
	int i=0;
	int lines=0;
	int words=0;
	int bytes=0;
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
	ParseArg_parse(args, argc, argv);


	//Si no tengo ninguno de los argumentos y tengo un -, entonces parametro invalido
	if( !(ParseArg_getArg(args,'V')) && !(ParseArg_getArg(args,'h')) && !(ParseArg_getArg(args,'w')) && !(ParseArg_getArg(args,'l')) && !(ParseArg_getArg(args,'c'))){
		for ( i = 0 ; i < argc ; i++ ){ if (argv[i][0]=='-'){
				fprintf(stderr,"Parametro invalido. Ingrese -h para mostrar la ayuda\n");
				return 1;
			}
		}
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
	}

	if(ParseArg_getArg(args, 'w')){
		flagsPassed++;
	}

	if(ParseArg_getArg(args, 'c')){
		flagsPassed++;
	}

	//Si la diferencia entre argumentos y flags es mayor a 2 entonces
	//tengo mas de 1 archivo y los leo todos 
	//if ( 1 + argc - flagsPassed >= 2 ){
	int linesTotal = 0;
	int wordsTotal = 0;
	int bytesTotal = 0;


	if ( argc -1 == flagsPassed ){
		fd = 0;
		file = "";
	}

	// Supongo que los archivos siempre estan al final (dsp de los argumentos)
	// Loopeo por todos los archivos 
	i = flagsPassed +1 ;
	while ( i < argc || fd == 0){

		if (fd !=0){
			file = argv[i];
			fd = open(file,O_RDONLY);
		}
		
		wc(fd, &lines, &words ,&bytes);

		if(ParseArg_getArg(args, 'l')){
			printf("%d \t ",lines);
		}

		if(ParseArg_getArg(args, 'w')){
			printf("%d \t ",words);
		}

		if(ParseArg_getArg(args, 'c')){
			printf("%d \t ",bytes);
		}

		//Por defecto ejecuta esta 
		if (flagsPassed==0){
			printf("%d \t %d \t%d \t",lines,words,bytes);
		}
		
		printf("%s \n",file);

		linesTotal = linesTotal + lines;
		wordsTotal = wordsTotal + words;
		bytesTotal = bytesTotal + bytes;
		i++;
		fd = 1;
	}
	//Imprime TOTAL cuando hay mas de 1 archivo
	if (argc - flagsPassed > 2){
		if(ParseArg_getArg(args, 'l')){
			printf("%d \t ",linesTotal);
		}

		if(ParseArg_getArg(args, 'w')){
			printf("%d \t ",wordsTotal);
		}

		if(ParseArg_getArg(args, 'c')){
			printf("%d \t ",bytesTotal);
		}

		if (flagsPassed==0){
				printf("%d \t %d \t%d \t",linesTotal,wordsTotal,bytesTotal);
		}

		printf("total \n");
	}
	

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
