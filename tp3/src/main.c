#include "md5.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>

char* combinar1(char *caracteres);

void get_sum(char *input, char *output);

main()
{
	FILE *archivo;
 	char caracteres[100];
 	archivo = fopen("passwd_1","r");
 	char* salida;

 	if (archivo == NULL)
 		exit(1);

 	while (feof(archivo) == 0)
 	{
 		fgets(caracteres,100,archivo);
 		/*if(contraseñas de un caracter)*/
            salida = combinar1();
        /*if(contraseñas de 2 caracteres)
            combinar2();*/
 		printf("%s",salida);
 	}

    fclose(archivo);
	return 0;
}

char* combinar1(char *caracteres){
    char clave[1];
    char abec[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    char *output;
	int q=0; //variables para manejar los bucles
	do{
		/****Bucle que maneja el primer caracter de clave****/
		//get_sum(clave, output);
		//if(caracteres == output) return clave;

	}while (abec[q]);
}

char* combinar2(char *caracteres){
    char clave[2];
    char abec[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    char *output;
	int p,q=0; //variables para manejar los bucles
	do{
		/****Bucle que maneja el primer caracter de clave****/
		p=0;
		clave[0]=abec[q++];
		do{
			/****Bucle que maneja el segundo caracter de clave****/
			clave[1]=abec[p++];
            //get_sum(clave, output);
            //if(caracteres == output) return clave;
		}while (abec[p]);
	}while (abec[q]);
}

char* combinar3(char *caracteres){
    char clave[3];
    char abec[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    char *output;
	int n,p,q=0; //variables para manejar los bucles
	do{
		/****Bucle que maneja el primer caracter de clave****/
		p=0;
		clave[0]=abec[q++];
		do{
			/****Bucle que maneja el segundo caracter de clave****/
			n=0;
			clave[1]=abec[p++];
			do{
				/****Bucle que maneja el tercer caracter de clave****/
				clave[2]=abec[n++];
                //get_sum(clave, output);
                //if(caracteres == output) return clave;
			}while (abec[n]);
		}while (abec[p]);
	}while (abec[q]);
}

char* combinar4(char *caracteres){
    char clave[4];
    char abec[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    char *output;
	int m,n,o,p,q=0; //variables para manejar los bucles
	do{
		/****Bucle que maneja el primer caracter de clave****/
		p=0;
		clave[0]=abec[q++];
		do{
			/****Bucle que maneja el segundo caracter de clave****/
			n=0;
			clave[1]=abec[p++];
			do{
				/****Bucle que maneja el tercer caracter de clave****/
				m=0;
				clave[2]=abec[n++];
				do{
					/****Bucle que maneja el cuarto caracter de clave****/
					clave[3]=abec[m++];
                    //get_sum(clave, output);
                    //if(caracteres == output) return clave;
				}while (abec[m]);
			}while (abec[n]);
		}while (abec[p]);
	}while (abec[q]);
}

/*void get_sum(char *input, char *output)
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
}*/
