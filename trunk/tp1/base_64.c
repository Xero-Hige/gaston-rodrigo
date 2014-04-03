/*
 * base_64.c
 */
#include <stdlib.h>
#include <stdint.h>
#include <string.h>

#include "base_64.h"

static bool little_endian = true;

/**
 * Setea la variable que indica si el sistema es
 * little o big endian
 */
void set_endianess(void) {
	int i = 1;
	char *p = (char *) &i;
	if (p[0] == 1)
		little_endian = true;
	else
		little_endian = false;
}

/**
 * Invierte las posiciones de un arreglo de 4 bytes
 */
void array_invert(char temporal_array[4]) {
	char aux = 0;
	aux = temporal_array[0];
	temporal_array[0] = temporal_array[3];
	temporal_array[3] = aux;
	aux = temporal_array[1];
	temporal_array[1] = temporal_array[2];
	temporal_array[2] = aux;
}

/**
 * Transforma el contenido del arreglo 'input' en
 * una cadena con la codificacion de este en base
 * 64. El resultado se almacena en el arreglo 'output'.
 * Devuelve true si la operacion fue exitosa.
 */
bool encode_to_base64(char input[3], char output[4]) {
	int32_t temporal = 0;
	int32_t index = 0;
	int i;

	char* temporal_array = (char*) &temporal;
	char* index_array = (char*) &index;

	memcpy(&temporal, input, 3);

	if (little_endian)
		array_invert(temporal_array);

	temporal = temporal >> 8;

	for (i = 0; i < 4; i++) {
		temporal = temporal << 6;

		if (little_endian) {	//Little endian
			index_array[0] = temporal_array[3];
			temporal_array[3] = 0;
		} else { 				//Big endian
			index_array[3] = temporal_array[0];
			temporal_array[0] = 0;
		}

		output[i] = ALFABETO[index];
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
	size_t i;

	for (i = 0; i < len; i++) {
		if (c == string[i]) {
			index = i;
			break;
		}
	}

	return index;
}

/**
 * Decodifica el contenido del arreglo 'input' en
 * codificado en base 64. El resultado se almacena
 * en el arreglo 'output'. Devuelve true si la
 * operacion fue exitosa.
 */
bool decode_from_base64(char input[4], char output[3], int* padding) {
	int32_t temporal = 0;
	int i;
	*padding = 0;
	char* temporal_array = (char*) &temporal;

	for (i = 3; i >= 0; i--) {
		int index = index_of(input[i], ALFABETO, 64); //TODO: largo de la base
		if (index < 0) {
			if (input[i] != PADDING_CHAR)
				return false;
			*padding += 1;
			if (little_endian)
				temporal_array[3] = 0;
			else
				temporal_array[0] = 0;

		} else {
			if (little_endian)
				temporal_array[3] = index;
			else
				temporal_array[0] = index;
		}
		temporal = temporal >> 6;
	}

	if (little_endian)
		array_invert(temporal_array);

	memcpy(output, (temporal_array + 1), 3);
	return true;
}

/**
 * Agrega los caracteres de padding necesarios segun la
 * cantidad de bytes leidos
 */
void add_padding(int bytes_read, char buffer[4]) {
	if (bytes_read < 3) {
		if (bytes_read < 3)
			buffer[3] = PADDING_CHAR;

		if (bytes_read < 2)
			buffer[2] = PADDING_CHAR;
	}
}

/**
 * Escribe sobre el output_stream el contenido del
 * input_stream codificado en base 64
 */
int encode(FILE* input_stream, FILE* output_stream) {
	char input_buffer[3];
	char output_buffer[4];

	set_endianess();

	int bytes_read = fread(input_buffer, sizeof(char), 3, input_stream);
	while (bytes_read > 0) {
		if (bytes_read < 3)
			input_buffer[2] = 0;
		if (bytes_read < 2)
			input_buffer[1] = 0;

		if (!encode_to_base64(input_buffer, output_buffer))
			return ENCODE_ERROR;

		add_padding(bytes_read, output_buffer);

		int bytes_wrote = fwrite(output_buffer, sizeof(char), 4, output_stream);

		if (bytes_wrote != 4)
			return WRITE_ERROR;

		bytes_read = fread(input_buffer, sizeof(char), 3, input_stream);
	}

	return 0;
}

/**
 * Escribe sobre el output_stream el contenido del
 * input_stream decodificado de base 64.
 * Pre: El input_stream contiene solo caracteres del
 * 		"ALFABETO"
 */
int decode(FILE* input_stream, FILE* output_stream) {
	char input_buffer[4];
	char output_buffer[3];

	set_endianess();

	int padding = 0;
	int bytes_read = fread(input_buffer, sizeof(char), 4, input_stream);
	while (bytes_read > 0) {
		if (bytes_read < 4) //No es la cantidad correcta de bytes
			return ENCODE_ERROR; //TODO: cambiar tipo de error

		if (!decode_from_base64(input_buffer, output_buffer, &padding))
			return DECODE_ERROR;

		int bytes_to_write = 3;

		if (padding != 0) {
			if (padding == 1) {
				bytes_to_write = 2;
			}
			if (padding == 2) {
				bytes_to_write = 1;
			}
		}

		int bytes_wrote = fwrite(output_buffer, sizeof(char), bytes_to_write,
				output_stream);

		if (bytes_wrote != bytes_to_write)
			return WRITE_ERROR;

		bytes_read = fread(input_buffer, sizeof(char), 4, input_stream);
	}

	return 0;

}
