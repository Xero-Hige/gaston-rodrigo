#include <fcntl.h>

void wc (int fd, int* lines, int* words, int* bytes){
	int leido=1;
	char c;
	char anterior = ' ';
	while (leido){
	leido = read(fd,&c,1);
		(*bytes)++;
		if ( c == '\n' )
			(*lines)++;
		
		if(anterior!=' ' && (c==' '||c=='\n'||c=='\t'))
			if(anterior!='\n'&& anterior!='\t')
				(*words)++;

		anterior = c;
	}
	(*lines)--;
	(*bytes)--;

	close (fd);
}
