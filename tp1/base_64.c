/*
 * base_64.c
 */
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "base_64.h"

/**
 * Transforma el contenido del arreglo 'input' en
 * una cadena con la codificacion de este en base
 * 64. El resultado se almacena en el arreglo 'output'.
 * Devuelve true si la operacion fue exitosa.
 */
bool encode_to_base64(char input[3], char output[4]) {
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

bool decode_from_base64(char input[4], char output[3], int* padding) {
	int32_t temporal = 0;
	*padding = 0;
	char* temporal_array = (char*) &temporal;

	for (int i = 0; i < 4; i++) {
		int index = index_of(input[i], DICCIONARIO);
		if (index < 0) {
			if (input[i] != ESCAPE)
				return false;
			*padding += 1;
			temporal_array[i] = 0;
		} else {
			temporal_array[i] = DICCIONARIO[index];
		}
		temporal = temporal >> 6;
	}

	return true;
}

/**
 * Escribe sobre el output_stream el contenido del
 * input_stream codificado en base 64
 */
int encode(FILE* input_stream, FILE* output_stream) {
	char input_buffer[3];
	char output_buffer[4];

	int bytes_read = fread(input_buffer, sizeof(char), 3, input_stream);
	while (bytes_read > 0) {
		if (bytes_read < 3)
			input_buffer[2] = 0;
		if (bytes_read < 2)
			input_buffer[1] = 0;

		if (!encode_to_base64(input_buffer, output_buffer))
			return ENCODE_ERROR;

		//TODO: AGREGAR EL PADDING SEGUN LOS BYTES LEIDOS

		int bytes_wrote = fwrite(output_buffer, sizeof(char), 4, output_stream);

		if (bytes_wrote != 4)
			return WRITE_ERROR;
	}

	return 0;
}

/**
 * Escribe sobre el output_stream el contenido del
 * input_stream decodificado de base 64.
 * Pre: El input_stream contiene solo caracteres del
 * 		"DICCIONARIO"
 */
int decode(FILE* input_stream, FILE* output_stream) {
	char input_buffer[4];
	char output_buffer[3];
	int padding = 0;
	int bytes_read = fread(input_buffer, sizeof(char), 4, input_stream);
	while (bytes_read > 0) {
		if (bytes_read < 4) //No es la cantidad correcta de bytes
			return ENCODE_ERROR; //TODO: cambiar tipo de error

		if (!bool decode_from_base64(input_buffer, output_buffer,padding))
			return DECODE_ERROR;

		int bytes_wrote = fwrite(output_buffer, sizeof(char), 4, output_stream);

		if (bytes_wrote != 4)
			return WRITE_ERROR;
	}

	return 0;

}

/*
 int main(int argc, char* argv[]) {
 char a[] = "foe";
 char* b = malloc(4 * sizeof(char));
 if (!b)
 return -1;

 int ret = encode_to_base64(a, b);
 free(b);
 return ret;
 }*/
