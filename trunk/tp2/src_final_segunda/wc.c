#include <fcntl.h>

void wc (int fd, int* lines, int* words, int* bytes){
	int leido=0;
	int linepos;
	int linelength;
	char in_word = 0;
	char c;
	char anterior = ' ';
	do {
		leido = read(fd,&c,1);
		if (leido)
			(*bytes)++;
		if ( c == '\n' && leido)
			(*lines)++;
		
		//if(anterior!=' ' && (c==' '||c=='\n'||c=='\t'))
		//	if(anterior!='\n'&& anterior!='\t')
		//		(*words++)
		//anterior =c ;

		switch (c){
			case '\n':
			case '\r':
			case '\f':
				if (linepos > linelength)
					linelength = linepos;
				linepos=0;
				(*words)+=in_word;
				in_word = 0;
				break;
			case '\t':
				linepos+= 8 - (linepos%8);
				(*words)+=in_word;
				in_word = 0;
				break;
			case ' ': 
				linepos++;
			case '\v':
				(*words)+=in_word;
				in_word = 0;
				break;
			default:
				if (iswprint (c)){
					int width = wcwidth(c);
					if (width > 0)
						linepos+=width;
					if (iswspace(c)){
						(*words)+=in_word;
						in_word = 0;
						break;
					}
					in_word=1;
				}
				break;
		}
	}while (leido);
	if (leido){
		(*lines)--;
		(*bytes)--;
		(*words)++;
	}

	close (fd);
}
