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

	move s0, a1		# s0 = lines
	move s1, a2		# s1 = words 
	move s2, a3		# s2 = bytes

	# pongo contadores en 0
	sw	zero,0(s0)			
	sw	zero,0(s1)
	sw	zero,0(s2)
	move s4, zero	# s4 = letra anterior


read_byte:
	li v0, SYS_read
	lw a0, 64($fp)		# cargo el fd
	la a1,byte_buffer
	li a2, 1
	syscall 		 

	beq v0,zero,end_read # si es 0 es xq llegue al fin de archivo, termine

	lw	t1,0(s2)
	addi t1,t1,1
	sw	t1,0(s2)

	#preparo llamada al count:

	lbu  a0,byte_buffer	# a0 = letra 
	move a1,s4		# a1 = letraAnterior
	move a2,s1		# a1 = lines
	move a3,s2		# a2 = words 

	#void count(char c, int* lines, int* words)

	jal count
	move s4,a0		# s4 (letraAnterior) = letra
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


.end wc

.data
	byte_buffer: .space 1
