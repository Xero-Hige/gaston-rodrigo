#include "md5.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

void get_sum(char *input, char *output)
{	
	int i;
	MD5_CTX contexto;
	unsigned char *buffer = (unsigned char *) malloc(17);
	MD5_Init(&contexto);
	MD5_Update(&contexto, input, strlen(input));
	MD5_Final(buffer, &contexto);
	*output=0;
	for (i=0;i<16;i++)
	{
		sprintf(output,"%s%02x",output, buffer[i]);
	}
}
