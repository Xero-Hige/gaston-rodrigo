#include <mips/regdef.h>

#void count(char c, char c, int* lines, int* words)
.text
.align 2
.globl count

count:
	subu sp,sp, 24 # Reservo espacio para argumentos
	sw $fp, 20(sp) # Siempre se guarda el fp correspondiente a la funcion que llamo a esta funcion
	sw gp, 16(sp) # Siempre se guarda gp
	move $fp,sp # se guarda el fp para esta funcion

	# guardo registros S
	sw s2,8(sp)
	sw s1,4(sp)
	sw s0,0(sp)

	# guardo parametros que usa la funcion
	sw a0,24($fp) #char c
	sw a1,28($fp) #char c
	sw a2,32($fp) #int* lines
	sw a3,36($fp) #int* words

	lw s0, 0(a2)  #int* lines
	lw s1, 0(a3)  #int* words

	li		t1, 9			# Cargo el valor entero de '\t'
	blt		a0, t1, fin_count	# Si es menor a '\t' no puede ser un separador
	li		t1, 32			# Cargo el valor entero de ' '
	bgt		a0, t1, es_linea	# Si es mayor a ' ' no puede ser un separador

	li		t1, 32			# Cargo el valor entero de ' '
	blt		a1, t1, es_linea	# Si es menor a ' ' no habia una palabra

	addu	s1, s1, 1		# Aumento en 1 el conteo de palabras


#	TODO : Asi como esta falta contemplar los siguientes casos: 
#	- Un fin de linea tmb puede significar el fin de una palabra, por lo 
#	tnato un eof tmb tiene q sumar una palabra si lo ultimo q se leyo fue 
#	una letra y no un espacio: 
#Ej:
# "prueba\n
# "deberia_contar_2"

#	-Muchos espacios seguidos no tienen que sumar nada, para eso se necesita
#	al igual que en el caso anterior, guardar la ultima letra leida

es_linea:
	li		t1, 10			# Cargo el valor entero de '\n' (Nueva linea)
	bne		a0, t1, fin_count	# Salto si no es una nueva linea
	addu	s0, s0, 1		# Aumento 1 el contador de lineas
	j fin_count

fin_count: 
#Guardo los contadores
	sw s0, 0(a1)
	sw s1, 0(a2)
	sw s2, 0(a3)

	move sp, $fp
	lw $fp,20(sp)
	lw gp,16(sp)
	lw s2,8(sp)
	lw s1,4(sp)
	lw s0,0(sp)

	addiu sp,sp,24
	jr ra


