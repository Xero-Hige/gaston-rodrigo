	.file	1 "main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"help\000"
	.align	2
$LC1:
	.ascii	"version\000"
	.align	2
$LC2:
	.ascii	"encode\000"
	.align	2
$LC3:
	.ascii	"decode\000"
	.align	2
$LC4:
	.ascii	"output\000"
	.align	2
$LC5:
	.ascii	"input\000"
	.align	2
$LC6:
	.ascii	"r\000"
	.align	2
$LC7:
	.ascii	"wb\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,80,$ra		# vars= 32, regs= 3/0, args= 24, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 24
	sw	$ra,72($sp)
	sw	$fp,68($sp)
	sw	$gp,64($sp)
	move	$fp,$sp
	sw	$a0,80($fp)
	sw	$a1,84($fp)
	sw	$zero,36($fp)
	sw	$zero,40($fp)
	sw	$zero,44($fp)
	li	$a0,6			# 0x6
	la	$t9,ParseArg_new
	jal	$ra,$t9
	sw	$v0,32($fp)
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	move	$a1,$zero
	li	$a2,104			# 0x68
	la	$a3,$LC0
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	move	$a1,$zero
	li	$a2,118			# 0x76
	la	$a3,$LC1
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	move	$a1,$zero
	li	$a2,101			# 0x65
	la	$a3,$LC2
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	move	$a1,$zero
	li	$a2,100			# 0x64
	la	$a3,$LC3
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	la	$a1,ParseArg_parseStr
	li	$a2,111			# 0x6f
	la	$a3,$LC4
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	sw	$zero,16($sp)
	sw	$zero,20($sp)
	lw	$a0,32($fp)
	la	$a1,ParseArg_parseStr
	li	$a2,105			# 0x69
	la	$a3,$LC5
	la	$t9,ParseArg_addArg
	jal	$ra,$t9
	lw	$a0,32($fp)
	lw	$a1,80($fp)
	lw	$a2,84($fp)
	la	$t9,ParseArg_parse
	jal	$ra,$t9
	lw	$a0,32($fp)
	li	$a1,104			# 0x68
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	beq	$v0,$zero,$L18
	la	$t9,usage
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	sw	$zero,56($fp)
	b	$L17
$L18:
	lw	$a0,32($fp)
	li	$a1,118			# 0x76
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	beq	$v0,$zero,$L19
	lw	$v0,84($fp)
	lw	$a0,0($v0)
	la	$t9,version
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	sw	$zero,56($fp)
	b	$L17
$L19:
	lw	$a0,32($fp)
	li	$a1,105			# 0x69
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$a0,32($fp)
	li	$a1,111			# 0x6f
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v0,40($fp)
	bne	$v0,$zero,$L20
	la	$v0,__sF
	sw	$v0,48($fp)
	b	$L21
$L20:
	lw	$a0,40($fp)
	la	$a1,$LC6
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,48($fp)
	lw	$v0,48($fp)
	bne	$v0,$zero,$L21
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,56($fp)
	b	$L17
$L21:
	lw	$v0,36($fp)
	bne	$v0,$zero,$L23
	la	$v0,__sF+88
	sw	$v0,52($fp)
	b	$L24
$L23:
	lw	$a0,36($fp)
	la	$a1,$LC7
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$v0,52($fp)
	bne	$v0,$zero,$L24
	lw	$a0,36($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,56($fp)
	b	$L17
$L24:
	lw	$a0,32($fp)
	li	$a1,101			# 0x65
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	beq	$v0,$zero,$L26
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,encode
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	sw	$zero,56($fp)
	b	$L17
$L26:
	lw	$a0,32($fp)
	li	$a1,100			# 0x64
	la	$t9,ParseArg_getArg
	jal	$ra,$t9
	beq	$v0,$zero,$L27
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,decode
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	sw	$zero,56($fp)
	b	$L17
$L27:
	lw	$v1,52($fp)
	la	$v0,__sF+88
	beq	$v1,$v0,$L28
	lw	$a0,52($fp)
	la	$t9,fclose
	jal	$ra,$t9
$L28:
	lw	$v1,48($fp)
	la	$v0,__sF
	beq	$v1,$v0,$L29
	lw	$a0,48($fp)
	la	$t9,fclose
	jal	$ra,$t9
$L29:
	lw	$a0,44($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,36($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,32($fp)
	la	$t9,ParseArg_delete
	jal	$ra,$t9
	sw	$zero,56($fp)
$L17:
	lw	$v0,56($fp)
	move	$sp,$fp
	lw	$ra,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$ra
	.end	main
	.size	main, .-main
	.rdata
	.align	2
$LC8:
	.ascii	"%s 1.0.0\n\000"
	.text
	.align	2
	.globl	version
	.ent	version
version:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	la	$a0,$LC8
	lw	$a1,40($fp)
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	version
	.size	version, .-version
	.rdata
	.align	2
$LC9:
	.ascii	"OPTIONS:\n\000"
	.align	2
$LC10:
	.ascii	"-d --decode Decodes from Base64\n\000"
	.align	2
$LC11:
	.ascii	"-i --input file Reads from file or stdin\n\000"
	.align	2
$LC12:
	.ascii	"-o --output file Writes to file or stdout\n\000"
	.align	2
$LC13:
	.ascii	"-v --version Show version string\n\000"
	.align	2
$LC14:
	.ascii	"-h --help Print this message and quit\n\000"
	.text
	.align	2
	.globl	usage
	.ent	usage
usage:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,$LC9
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC10
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC11
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC12
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC13
	la	$t9,printf
	jal	$ra,$t9
	la	$a0,$LC14
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	usage
	.size	usage, .-usage
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
