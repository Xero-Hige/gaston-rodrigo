#include <stdio.h>
#include <stdlib.h>

#include "base_64.h"
#include "arg_parse.h"

void usage();
void version(char* nombre);

int main(int argc, char* argv[]){
	TParseArg* args;
	char *output = NULL;
	char *input = NULL;
	int* res = NULL;
	FILE* inFile;
	FILE* outFile;

	// Creo el parseador de argumentos
	args = ParseArg_new(6);
	// Agrego los argumentos a parsear, si uso valores por defecto como NULL con tama~no 0,
	// estoy haciendo qe sean obligatorios los argumentos
	ParseArg_addArg(args, NULL, 'h', "help", NULL, 0);
	ParseArg_addArg(args, NULL, 'v', "version", NULL, 0);
	ParseArg_addArg(args, NULL, 'e', "encode", NULL, 0);
	ParseArg_addArg(args, NULL, 'd', "decode", NULL, 0);
	ParseArg_addArg(args, &ParseArg_parseStr, 'o', "output", NULL, 0);
	ParseArg_addArg(args, &ParseArg_parseStr, 'i', "input", NULL, 0);
	ParseArg_parse(args, argc, argv);

	if(ParseArg_getArg(args, 'h')){
		usage();
		ParseArg_delete(args);
		return 0;
	}

	if(ParseArg_getArg(args, 'v')){
		version(argv[0]);
		ParseArg_delete(args);
		return 0;
	}
	input = (char*) ParseArg_getArg(args, 'i');
	output = (char*) ParseArg_getArg(args, 'o');

	if(input == NULL){
		inFile = stdin;
	}else{
		inFile = fopen(input, "r");
		if(!inFile){
			free(input);
			ParseArg_delete(args);
			return 1;
		}
	}

	if(output == NULL){
		outFile = stdout;
	}else{
		outFile = fopen(output, "wb");
		if(!outFile){
			free(output);
			ParseArg_delete(args);
			return 1;
		}
	}

	if(ParseArg_getArg(args, 'e')){
		encode(inFile,outFile);
		ParseArg_delete(args);
		return 0;
	}

	if(ParseArg_getArg(args, 'd')){
		decode(inFile,outFile);
		ParseArg_delete(args);
		return 0;
	}
	
	if(outFile != stdout)
		fclose(outFile);

	if(inFile != stdin)
		fclose(inFile);

	free(res);
	free(output);
	free(input);
	ParseArg_delete(args);

	return 0;
}

void version(char* nombre){
	printf("%s 1.0.0\n", nombre);
}

void usage(){
	printf("OPTIONS:\n");
	printf("-d --decode Decodes from Base64\n");
	printf("-i --input file Reads from file or stdin\n");
	printf("-o --output file Writes to file or stdout\n");
	printf("-v --version Show version string\n");
	printf("-h --help Print this message and quit\n");
}
