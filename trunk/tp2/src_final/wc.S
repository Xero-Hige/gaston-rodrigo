#include <mips/regdef.h>
#include <sys/syscall.h>

.text
.align 2
.globl wc
.extern count
.ent wc

# void wc(int fd, int* lines, int* words, int* bytes)
wc:	
	subu sp, sp, 64
	sw $fp, 52(sp)
	sw ra, 56(sp)	
	sw gp, 48(sp)		
	move $fp, sp

	sw s7,44(sp)
	sw s6,40(sp)
	sw s5,36(sp)
	sw s4,32(sp)
	sw s3,28(sp)
	sw s2,24(sp)
	sw s1,20(sp)
	sw s0,16(sp)

	sw a0,64($fp) #int fd
	sw a1,68($fp) #int lines
	sw a2,72($fp) #int words
	sw a3,76($fp) #int bytes


//	sw s0, 12(sp)		# imprimirLineas
//	sw s1, 16(sp)		# imprimirPalabras
//	sw s2, 20(sp)		# imprimirBytes
//	sw s3, 24(sp)		# letra
//	sw s4, 28(sp)		# letraAnterior
//	sw a0, 32(sp)		# a0 = fd
//	sw a1, 36(sp)		# a1 = contadores
//	sw a2, 40(sp)
//	sw a3, 44(sp)
//  move $fp, sp		# Termino de guardar en stack

	move s0, a1		# s0 = lines
	move s1, a2		# s1 = words 
	move s2, a3		# s2 = bytes

	# pongo contadores en 0
	sw	zero,0(s0)			
	sw	zero,0(s1)
	sw	zero,0(s2)

//	sw zero, 0(a1)	
//	sw zero, 4(a1)
//	sw zero, 8(a1)		# contadores[i] = 0
//move s4, zero		# letraAnterior = 0 

read_byte:
	li v0, SYS_read
	lw a0, 64($fp)		# cargo el fd
	la a1,byte_buffer
	li a2, 1
	syscall 		 

	move s4,v0

	beq s4,zero,end_read # si es 0 es xq llegue al fin de archivo, termine

	#preparo llamada al count:

	lbu  a0,byte_buffer	# a0 = letra 
	move a1,s0		# a1 = letraAnterior
	move a2,s1		# a1 = lines
	move a3,s2		# a2 = words 

	#void count(char c, int* lines, int* words)

	jal count
	//move s4,a0		# s4 (letraAnterior) = letra
	j read_byte


end_read:
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

//count:
//	subu sp, sp, 8
//	sw $fp, 0(sp)
//	sw gp, 4(sp)		
//	move $fp, sp		# Termino de guardar en stack
//
//	lw t0, 8(a2)		# t0 = contadores[2]
//	addu t0,t0,1		# t0 += 1
//	sw t0, 8(a2)		# contadores[2] = t0

//ifPalabras:
//	
//	slti t0,a0,127		# Si letra < 127, t0 = 1
//	beq t0,zero,ifLineas	# Si t0 == 0, me voy
//	slti t0,a0,33		# Si letra < 33, t0 = 1
//	bne t0,zero,ifLineas	# Si t0 != 0, me voy
//	slti t0,a1,33		# Si letraAnterior < 33, t0 = 1
//	bne t0,zero,palabras	# Si t0 != 0 (t0 == 1), cuento
//	slti t0,a1,127
//	bne t0,zero,ifLineas	# Si t0 != 0 (a1 < 127), me voy 
//
//palabras:
//
//	lw t0, 4(a2)		# t0 = contadores[1]
//	addu t0,t0,1		# t0 += 1
//	sw t0, 4(a2)		# contadores[1] = t0
//
//ifLineas:
//
//	addu t0,zero,10
//	beq a0,t0,lineas
//	addu t0,zero,13
//	beq a0,t0,lineas
//	j endCount
//
//lineas:
//	lw t0, 0(a2)		# t0 = contadores[0]
//	addu t0,t0,1		# t0 += 1
//	sw t0, 0(a2)		# contadores[0] = t0
//
//endCount:
//	lw gp, 4($fp)		
//	move sp, $fp
//	lw $fp, 0(sp)
//	addu sp, sp, 8
//	jr ra

.end wc

.data
	byte_buffer: .space 1
