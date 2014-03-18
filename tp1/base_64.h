/*
 * base_64.h
 */
#include <stdio.h>
#include <stdbool.h>

#define DICCIONARIO "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
#define ESCAPE '='

#define ENCODE_ERROR 3
#define DECODE_ERROR 4
#define WRITE_ERROR  5

/**
 * Escribe sobre el output_stream el contenido del
 * input_stream codificado en base 64
 */
int encode(FILE* input_stream, FILE* output_stream);

/**
 * Escribe sobre el output_stream el contenido del
 * input_stream decodificado de base 64.
 * Pre: El input_stream contiene solo caracteres del
 * 		"DICCIONARIO"
 */
int decode(FILE* input_stream, FILE* output_stream);
