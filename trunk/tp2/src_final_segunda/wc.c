#include <fcntl.h>

void wc (int fd, int* lines, int* words, int* bytes){
	int leido=0;
	int largopalabra=0;
	char in_word = 0;
	int ultimoCaracterEspacio=0;
	char c;
	char anterior = ' ';
	do {
		leido = read(fd,&c,1);
		if (leido)
			(*bytes)++;
		if ( c == '\n' && leido)
			(*lines)++;
		
		//Implementacion anterior que no contaba bien en archivos ejecutables
	
		//if(anterior!=' ' && (c==' '||c=='\n'||c=='\t'))
		//	if(anterior!='\n'&& anterior!='\t')
		//		(*words++)
		//anterior =c ;

		//
		//Esta implementacion fue extraida del wc de los coreutils de unix
		//Para soporte multibyte, la complejidad subia demasiado
		switch (c){
			case ' ':
			case '\n':
			case '\r':
			case '\f':
			case '\v':
			case '\t':
				if(largopalabra)
					(*words)++;

				largopalabra = 0;
				ultimoCaracterEspacio=1;
				break;
			default:
				if(isprint(c)){
					if (isspace (c)){
						if(largopalabra)
							(*words)++;

						largopalabra = 0;
					}
					largopalabra++;
					ultimoCaracterEspacio=0;
				}
				if(!leido && !ultimoCaracterEspacio){//es fin de archivo, debo sumar la ultima palabra
					(*words)++;
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
