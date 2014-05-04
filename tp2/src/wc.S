#TODO : Creo que esto se puede sacar, ver
#include <mips/regdef.h>


#void wc(int fd, int* lines, int* words , int* bytes)
.data
fname: .asciiz ""
buffer: .asciiz ""
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
	sw a1,$t1
	sw a2,$t2
	sw a3,$t3

	## abro el archivo 
	#li v0,13 
	#la a0, fname
	#li a1, 0
	#li a2, 0
	#syscall
	## guardo el fd
	#move s0,v0

	## leo el archivo 
	#li v0, 14 
	#move a0,s0
	#la a1,buffer
	#li a2,4 #leo 4 bytes
	#syscall
	#//printf("%d\n",a1)






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

