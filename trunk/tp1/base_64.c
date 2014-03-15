/*
 * base_64.c
 */
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>

const char* DICCIONARIO =
		"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

/**
 * Transforma el contenido del arreglo 'input' en
 * una cadena con la codificacion de este en base
 * 64. El resultado se almacena en el arreglo 'output'.
 * Devuelve true si la operacion fue exitosa.
 */
bool to_base64(char input[3], char output[4]) {
	int32_t temporal = 0;
	int32_t index = 0;

	memcpy(&temporal, input, 3);
	temporal = temporal >> 8;

	char* temporal_array = (char*) &temporal;
	char* index_array = (char*) &index;

	for (int i = 0; i < 4; i++) {
		temporal = temporal << 6;
		index_array[3] = temporal_array[0];
		output[i] = DICCIONARIO[index];
	}

	return true;
}

/**
 * Devuelve la posicion del caracter 'c' dentro
 * de la cadena 'string'. -1 en caso que el caracter
 * no pertenezca.
 */
int index_of(char c, char* string, size_t len) {
	int index = -1;

	for (size_t i = 0; i < len; i++) {
		if (c == string[i]) {
			index = i;
			break;
		}
	}

	return index;
}

int main(int argc, char* argv[]) {
	char a[] = "foe";
	char* b = malloc(4 * sizeof(char));
	if (!b)
		return -1;

	int ret = to_base64(a, b);
	free(b);
	return ret;
}
