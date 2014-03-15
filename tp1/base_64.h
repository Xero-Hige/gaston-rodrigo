/*
 * base_64.h
 */
#include <stdio.h>
#include <stdbool.h>

const char* DICCIONARIO =
		"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

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
