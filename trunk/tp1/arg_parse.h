#ifndef __ARG_PARSE_H__
#define __ARG_PARSE_H__
#include <stdlib.h>

typedef struct TParseArg TParseArg;

/** Funcion para parsear un argumento.
 * @param char*: cadena de caracteres de argumento a parsear.
 * @return void*: valor ya parseado.
 */
typedef void* (*TParseArgFunc)(char*);

/** Crea un nuevo parseador de argumentos.
 * @param int: cantidad maxima de argumentos que se pueden llegar a ingresar.
 * @return TParseArg*: TDA de parseador de argumentos.
 */
TParseArg* ParseArg_new(int c);

/** Agrega un nuevo argumento a parsear.
 * Se copian el nombre largo y el valor por defecto y se los guarda internamente.
 * @param TParseArg*: this, instancia de TDA.
 * @param TParseArgFunc: func, funcion para parsear el str de argv y devolver un valor. NULL si es flag (no tiene valor, solo importa si esta el parametro).
 * @param char: corto, nombre corto del argumento
 * @param char*: largo, nombre largo del argumento
 * @param void*: defecto, valor por defecto
 * @param size_t: tam, tama~no (memoria) del valor por defecto.
 * @return int: 0 ok, resto error
 */
int ParseArg_addArg(TParseArg* this, TParseArgFunc func, char corto, char* largo, void* defecto, size_t tam);

/** Parsea argumentos.
 * @param TParseArg*: this, instancia de TDA.
 * @param int: argc, cantidad de argumentos.
 * @param char*[]: argv, lista de cadenas de caracteres de argumentos.
 * @return int: 0 ok, resto error
 */
int ParseArg_parse(TParseArg* this, int argc, char* argv[]);

/** Devuelve el valor de un argumento.
 * Si es un flag, se devolvera un 1, se debe setear el valor por defecto al agregar los flags a 0,
 * para el resto de los valores (cuando no es flag), se debe liberar el puntero devuelto!
 * @param TParseArg*: this, instancia de TDA.
 * @param char: corto, nombre corto del parametro.
 * @return void*: puntero al valor, NULL para error o qe no este.
 */
void* ParseArg_getArg(TParseArg* this, char corto);

/** Destruye el tda.
 * @param TParseArg*: this, instancia de TDA.
 * @return int: 0 ok, resto error
 */
int ParseArg_delete(TParseArg*);

/** Funcion usada como TParseArgFunc para cunado el arguemnto es una cadena de caracteres */
void *ParseArg_parseStr(char*);

#endif
