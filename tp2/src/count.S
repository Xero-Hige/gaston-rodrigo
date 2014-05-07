#TODO : Creo que esto se puede sacar, ver
#include <mips/regdef.h>


#void count(char c, int* lines, int* words)
.text
.align 2
.globl wc
.extern count

count:
	subu sp,sp, 64 # Reservo espacio para argumentos que a lo mejor no uso TODO: Borrar en caso de que sobre 
	sw ra, 56(sp) # Por ser funcion non leaf
	sw $fp, 52(sp) # Siempre se guarda fp (correspondiente a la funcion que llamo a esta funcion
	sw gp, 48(sp) # Siempre se guarda gp
	move $fp,sp # se guarda el fp para esta funcion

	# guardo registros S, por las dudas, todos
	sw s7,44(sp)
	sw s6,40(sp)
	sw s5,36(sp)
	sw s4,32(sp)
	sw s3,28(sp)
	sw s2,24(sp)
	sw s1,20(sp)
	sw s0,16(sp)

	# guardo parametros que usa la funcion
	sw a0,64($fp) #int fd
	sw a1,68($fp) #int lines
	sw a2,72($fp) #int words
	sw a3,76($fp) #int bytes

read_byte:

	li		t1, 9			# Cargo el valor entero de '\t'
	blt		a0, t1, fin_count	# Si es menor a '\t' no puede ser un separador
	li		t1, 13			# Cargo el valor entero de \"v"
	bgt		a0, t1, fin_count	# Si es mayor a '\v' no puede ser un separador
	addi		a2, a2, 1		# Aumento en 1 el conteo de palabras

	li		t1, 10			# Cargo el valor entero de '\n' (Nueva linea)
	bne		s4, t1, fin_count	# Salto si no es una nueva linea
	addi		a1, a1, 1		# Aumento 1 el contador de lineas

fin_count: 
	move sp, $fp
	lw ra,56(sp)
	lw $fp,52(sp)
	lw gp,48(sp)
	lw s7,44(sp)
	lw s6,44(sp)
	lw s5,44(sp)
	lw s4,44(sp)
	lw s3,28(sp)
	lw s2,24(sp)
	lw s1,20(sp)
	lw s0,16(sp)

	addiu sp,sp,64
	jr ra

