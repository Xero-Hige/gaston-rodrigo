#TODO : Creo que esto se puede sacar, ver
#include <mips/regdef.h>
#include <sys/syscall.h>


#void wc(int fd, int* lines, int* words , int* bytes)
.data
fname: .asciiz ""
buffer: .asciiz ""
hello: .asciiz "hola \n"
.text
.align 2
.globl wc
.extern count

wc:
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
	move a1,t1
	move a2,t2
	move a3,t3

	
	#Seteo los acumuladores a 0
	li		s1, 0
	li		s2, 0
	li		s3, 0

	# abro el archivo 
	li v0,13 
	la a0, fname
	li a1, 0
	li a2, 0
	syscall
	blt		v0, zero, error	# Error de apertura	
	move s0,v0

read_byte:
	li		v0, 14			# Syscall para leer archivo
	move	a0, s0			# Coloco el fd en a0
	la		a1, byte_buffer	# Coloco la direccion del buffer donde se lee
	li		a2, 1			# Coloco la cantidad de bytes a leer
	syscall					# Leo 1 byte
	move t1,v0
	blt		t1, zero, error		# Salto al error durante la lectura
	beq t1,1, end_read
	#bgt t1,1, end_read # ESTO NOS DICE QUE ES MAYoR A 1
	beq		t1, zero, end_read	# Salto al fin de la lectura si se termino de leer
	addi		s3, s3, 1		# Aumento 1 al conteo de bytes leidos

	la		t1, byte_buffer 	# Cargo la direccion de lo leido
	lbu		s4, 0(t1)		# Cargo lo leido en el registro

	#void count(char c, int* lines, int* words)
	move		a0, t1			# Cargo el char leido en el parametro 0
	move		a1, s1			# Cargo el contador de lineas en el parametro 1
	move		a2, s2			# Cargo el contador de palabras en el parametro 2
	jal			count			# Llamo al count
	addi s0,1

	j			read_byte		# Vuelvo a leer

error:
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
	sw		s1, 0(a1)		# Guardo el acumulador de lineas sw		s2, 0(a2)		# Guardo el acumulador de palabras
	sw		s3, 0(a3)		# Guardo el acumulador de bytes

	# Cierro el archivo
	move		a0, s0			# Guardo el fd en el parametro
	li		v0, 16			# Syscall para cerrar el archivo
	syscall

fin: 
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

byte_buffer:	.space	4
