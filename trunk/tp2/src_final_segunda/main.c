#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <getopt.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <stdlib.h>

void usage();
void wc(int fd, int* lines, int* words, int* bytes); void version(char* nombre);
static struct option const longopts[] = {
	{"bytes", no_argument, NULL, 'c'},
	{"lines", no_argument, NULL, 'l'},
	{"words", no_argument, NULL, 'w'},
	{"version", no_argument, NULL, 'v'},
	{"help", no_argument, NULL, 'h'},
	{NULL, 0, NULL, 0}
};


int main(int argc, char* argv[]){
	if (argc < 1){
		fprintf(stderr,"No se especifico ningun comando. Ingrese -h para mostrar la ayuda\n");
		return 1;
	}

	char* file;
	int fd = 1;
	int i=1;
	int must_print_bytes = 0;
	int must_print_lines = 0;
	int must_print_words = 0;
	int lines=0;
	int words=0;
	int bytes=0;
	int optc;

	while ((optc = getopt_long (argc, argv, "clwhv", longopts, NULL)) != -1){
		switch(optc){
			case 'c':
				must_print_bytes=1;
				break;
			case 'l':
				must_print_lines=1;
				break;
			case 'w':
				must_print_words=1;
				break;
			case 'h':
				usage(argv[0]);
				break;
			case 'v':
				version(argv[0]);
				break;
			default:
				fprintf(stderr,"Parametro invalido. Ingrese -h para mostrar la ayuda\n");
				return 1;
		}
	}

	int linesTotal = 0;
	int wordsTotal = 0;
	int bytesTotal = 0;


	if ( argc -1 == must_print_lines + must_print_words + must_print_bytes ){
		fd = 0;
		file = "";
	}


	// Loopeo por todos los archivos 
	while ( i < argc || fd == 0){
		lines = 0;
		words = 0;
		bytes = 0;
		if ( fd != 0 && i!=0 ){
			if ( argv[i][0] != '-' ){
				file = argv[i];
				if (!access (file,X_OK))
						words++;
				fd = open(file,O_RDONLY);
				if ( fd == -1 ){
					fprintf(stderr,"%s: %s: Archivo o directorio incorrecto\n",argv[0],file);
					i++;
					continue;
				}
			}else{
				i++;
				continue;
			}
		}	
			wc(fd, &lines, &words ,&bytes);

			if(must_print_lines){
				printf("%d \t ",lines);
			}

			if(must_print_words){
				printf("%d \t ",words);
			}

			if(must_print_bytes){
				printf("%d \t ",bytes);
			}

			//Por defecto ejecuta esta 
			if (must_print_bytes + must_print_lines + must_print_words == 0 ){
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
	if (argc - must_print_bytes - must_print_words - must_print_lines > 2){
		if(must_print_lines){
			printf("%d \t ",linesTotal);
		}

		if(must_print_words){
			printf("%d \t ",wordsTotal);
		}

		if(must_print_bytes){
			printf("%d \t ",bytesTotal);
		}

		if (must_print_bytes + must_print_lines + must_print_words == 0 ){
				printf("%d \t %d \t%d \t",linesTotal,wordsTotal,bytesTotal);
		}

		printf("total \n");
	}
	

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
