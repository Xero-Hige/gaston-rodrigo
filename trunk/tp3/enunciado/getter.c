#include "md5.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void get_sum(char *input, char *output);

int main (int argc, char **argv)
{
	char *input = (char *) argv[1];
	char *output;
	
	output = (char *) malloc(33);
	
	get_sum(input, output);
	printf ("%s\n", output);
	return 0;
}