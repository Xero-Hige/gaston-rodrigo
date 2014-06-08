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
	li		t1, 13			# Cargo el valor entero de '\r'
	ble		a0, t1, checkear_palabra # Si es menor o igual a '\r' puede ser una palabra

	li		t1, 32			# Cargo el valor entero de " "
	bne	a0, t1, fin_count # No es un separador


checkear_palabra:
	li		t1, 32			# Cargo el valor entero de ' '
	beq		a1, t1, es_linea	# Si es " " la anterior no habia una palabra

	li		t1, 9			# Cargo el valor entero de '\t'
	blt		a1, t1, es_palabra	# Si es menor a '\t' era una palabra

	li		t1, 13			# Cargo el valor entero de '\r'
	ble		a1, t1, es_linea	# Si es menor o igual a '\r' no puede ser una palabra


es_palabra:
	addiu	s1, s1, 1		# Aumento en 1 el conteo de palabras


es_linea:
	li		t1, 10			# Cargo el valor entero de '\n' (Nueva linea)
	bne		a0, t1, fin_count	# Salto si no es una nueva linea
	addiu	s0, s0, 1		# Aumento 1 el contador de lineas

fin_count:
#Guardo los contadores

	sw s0, 0(a2)
	sw s1, 0(a3)

	move sp, $fp
	lw $fp,20(sp)
	lw gp,16(sp)
	lw s2,8(sp)
	lw s1,4(sp)
	lw s0,0(sp)

	addiu sp,sp,24
	jr ra


