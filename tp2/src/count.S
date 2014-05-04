#TODO : Creo que esto se puede sacar, ver
#include <mips/regdef.h>


#void wc(int fd, int* lines, int* words , int* bytes)
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

	move	s0, a0		#Guardo en el s0 el fp
	
	#Seteo los contadores a 0
	li		s1, 0
	li		s2, 0
	li		s3, 0

read_byte:
	li		v0, 14			# Syscall para leer archivo
	move	a0, s0			# Coloco el fp en a0
	la		a1, byte_buffer	# Coloco la direccion del buffer donde se lee
	li		a2, 1			# Coloco la cantidad de bytes a leer
	syscall					# Leo 1 byte
	ble		v0, end_read	# Salto al fin de la lectura si se termino de leer


	addi	s3, s3, 1
	lw		t1,	byte_buffer # Cargo lo leido en un registro



end_read:
	bl		v0, read_error	# Hubo un error en la lectura

	#Recupero las direcciones de almacenamiento
	lw		a1, 68($fp)		# int lines
	lw		a2, 72($fp)		# int words
	lw		a3, 76($fp)		# int bytes

	#Guardo los acumuladores en los punteros
	sw		s1, a1			# Guardo el acumulador de lineas
	sw		s2, a2			# Guardo el acumulador de palabras
	sw		s3, a3			# Guardo el acumulador de bytes

	j		fin_count


read_error:

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

.data

byte_buffer:	.space	1
