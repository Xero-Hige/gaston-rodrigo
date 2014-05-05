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
	blz		v0, read_error	# Salto al error durante la lectura
	beqz	v0,	end_read	# Salto al fin de la lectura si se termino de leer
	addi	s3, s3, 1		# Aumento 1 al conteo de bytes leidos

	la		t1, byte_buffer # Cargo la direccion de lo leido
	lbu		s4, 0(t1)		# Cargo lo leido en el registro

	li		t1, 9			# Cargo el valor entero de '\t'
	bl		s4, t1, read_byte# Si es menor a '\t' no puede ser un separador
	li		t1, 13			# Cargo el valor entero de \"v"
	bg		s4, t1, read_byte# Si es mayor a '\v' no puede ser un separador
	addi	s2, s2, 1		# Aumento en 1 el conteo de palabras

	li		t1, 10			# Cargo el valor entero de '\n' (Nueva linea)
	bne		s4, t1, read_byte# Vuelvo a leer si no es newline
	addi	s1, s1, 1		# Aumento 1 el contador de lineas
	j		read_byte		# Vuelvo a leer

read_error:
	# Guardo un valor de error en los acumuladores
	li		s1, -1			# Guardo -1 en el acumulador de lineas (error)
	li		s2, -1			# Guardo -1 en el acumulador de palabras (error)
	li		s3, -1			# Guardo -1 en el acumulador de bytes (error)

end_read:
	# Recupero las direcciones de almacenamiento
	lw		a1, 68($fp)		# int lines
	lw		a2, 72($fp)		# int words
	lw		a3, 76($fp)		# int bytes

	# Guardo los acumuladores en los punteros
	sw		s1, a1			# Guardo el acumulador de lineas
	sw		s2, a2			# Guardo el acumulador de palabras
	sw		s3, a3			# Guardo el acumulador de bytes

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
