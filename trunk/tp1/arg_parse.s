	.file	1 "arg_parse.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	ParseArg_new
	.ent	ParseArg_new
ParseArg_new:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$zero,24($fp)
	lw	$v0,48($fp)
	bne	$v0,$zero,$L18
	sw	$zero,28($fp)
	b	$L17
$L18:
	li	$a0,1			# 0x1
	li	$a1,12			# 0xc
	la	$t9,calloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v1,24($fp)
	lw	$v0,48($fp)
	sw	$v0,0($v1)
	lw	$s0,24($fp)
	lw	$a0,48($fp)
	li	$a1,28			# 0x1c
	la	$t9,calloc
	jal	$ra,$t9
	sw	$v0,8($s0)
	lw	$v0,24($fp)
	sw	$v0,28($fp)
$L17:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	ParseArg_new
	.size	ParseArg_new, .-ParseArg_new
	.align	2
	.globl	ParseArg_addArg
	.ent	ParseArg_addArg
ParseArg_addArg:
	.frame	$fp,48,$ra		# vars= 8, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	sw	$gp,36($sp)
	sw	$s0,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	move	$v0,$a2
	sw	$a3,60($fp)
	sb	$v0,24($fp)
	lw	$v0,48($fp)
	beq	$v0,$zero,$L21
	lw	$v0,48($fp)
	lw	$v1,48($fp)
	lw	$a0,4($v0)
	lw	$v0,0($v1)
	slt	$v0,$a0,$v0
	beq	$v0,$zero,$L21
	b	$L20
$L21:
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	b	$L19
$L20:
	lw	$a0,48($fp)
	lw	$v0,48($fp)
	lw	$v1,4($v0)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v1,$v1,$v0
	lw	$v0,52($fp)
	sw	$v0,0($v1)
	lw	$a0,48($fp)
	lw	$v0,48($fp)
	lw	$v1,4($v0)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v1,$v1,$v0
	lbu	$v0,24($fp)
	sb	$v0,4($v1)
	lw	$a0,48($fp)
	lw	$v0,48($fp)
	lw	$v1,4($v0)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$s0,$v1,$v0
	lw	$a0,60($fp)
	la	$t9,strlen
	jal	$ra,$t9
	addu	$v0,$v0,1
	move	$a0,$v0
	li	$a1,1			# 0x1
	la	$t9,calloc
	jal	$ra,$t9
	move	$a0,$v0
	lw	$a1,60($fp)
	la	$t9,strcpy
	jal	$ra,$t9
	sw	$v0,8($s0)
	lw	$v0,68($fp)
	beq	$v0,$zero,$L22
	lw	$v0,64($fp)
	beq	$v0,$zero,$L22
	lw	$a0,48($fp)
	lw	$v0,48($fp)
	lw	$v1,4($v0)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$s0,$v1,$v0
	li	$a0,1			# 0x1
	lw	$a1,68($fp)
	la	$t9,calloc
	jal	$ra,$t9
	sw	$v0,12($s0)
	lw	$a0,48($fp)
	lw	$v0,48($fp)
	lw	$v1,4($v0)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,12($v0)
	lw	$a1,64($fp)
	lw	$a2,68($fp)
	la	$t9,memcpy
	jal	$ra,$t9
	lw	$a0,48($fp)
	lw	$v0,48($fp)
	lw	$v1,4($v0)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v1,$v1,$v0
	lw	$v0,68($fp)
	sw	$v0,16($v1)
$L22:
	lw	$v1,48($fp)
	lw	$v0,48($fp)
	lw	$v0,4($v0)
	addu	$v0,$v0,1
	sw	$v0,4($v1)
	sw	$zero,28($fp)
$L19:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	lw	$s0,32($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	ParseArg_addArg
	.size	ParseArg_addArg, .-ParseArg_addArg
	.align	2
	.globl	encontrar_argumento_corto
	.ent	encontrar_argumento_corto
encontrar_argumento_corto:
	.frame	$fp,32,$ra		# vars= 16, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,32
	.cprestore 0
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,32($fp)
	move	$v0,$a1
	sb	$v0,8($fp)
	sw	$zero,12($fp)
	sw	$zero,12($fp)
$L24:
	lw	$v0,32($fp)
	lw	$v1,12($fp)
	lw	$v0,4($v0)
	slt	$v0,$v1,$v0
	bne	$v0,$zero,$L27
	b	$L25
$L27:
	lw	$a0,32($fp)
	lw	$v1,12($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lb	$v1,4($v0)
	lb	$v0,8($fp)
	bne	$v1,$v0,$L26
	lw	$a0,32($fp)
	lw	$v1,12($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	sw	$v0,16($fp)
	b	$L23
$L26:
	lw	$v0,12($fp)
	addu	$v0,$v0,1
	sw	$v0,12($fp)
	b	$L24
$L25:
	sw	$zero,16($fp)
$L23:
	lw	$v0,16($fp)
	move	$sp,$fp
	lw	$fp,28($sp)
	addu	$sp,$sp,32
	j	$ra
	.end	encontrar_argumento_corto
	.size	encontrar_argumento_corto, .-encontrar_argumento_corto
	.align	2
	.globl	encontrar_argumento_largo
	.ent	encontrar_argumento_largo
encontrar_argumento_largo:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	sw	$zero,24($fp)
	sw	$zero,24($fp)
$L30:
	lw	$v0,48($fp)
	lw	$v1,24($fp)
	lw	$v0,4($v0)
	slt	$v0,$v1,$v0
	bne	$v0,$zero,$L33
	b	$L31
$L33:
	lw	$a0,48($fp)
	lw	$v1,24($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,8($v0)
	lw	$a1,52($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L32
	lw	$a0,48($fp)
	lw	$v1,24($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	sw	$v0,28($fp)
	b	$L29
$L32:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L30
$L31:
	sw	$zero,28($fp)
$L29:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	encontrar_argumento_largo
	.size	encontrar_argumento_largo, .-encontrar_argumento_largo
	.align	2
	.globl	ParseArg_parse
	.ent	ParseArg_parse
ParseArg_parse:
	.frame	$fp,56,$ra		# vars= 16, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,52($sp)
	sw	$fp,48($sp)
	sw	$gp,44($sp)
	sw	$s0,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	sw	$a2,64($fp)
	sw	$zero,24($fp)
	lw	$v0,56($fp)
	bne	$v0,$zero,$L36
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	b	$L35
$L36:
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
$L37:
	lw	$v0,24($fp)
	lw	$v1,60($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L40
	b	$L38
$L40:
	sw	$zero,28($fp)
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,64($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	lb	$v1,0($v0)
	li	$v0,45			# 0x2d
	bne	$v1,$v0,$L39
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,64($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,45			# 0x2d
	bne	$v1,$v0,$L42
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,64($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	addu	$v0,$v0,2
	lw	$a0,56($fp)
	move	$a1,$v0
	la	$t9,encontrar_argumento_largo
	jal	$ra,$t9
	sw	$v0,28($fp)
	b	$L43
$L42:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,64($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	lb	$v0,0($v0)
	lw	$a0,56($fp)
	move	$a1,$v0
	la	$t9,encontrar_argumento_corto
	jal	$ra,$t9
	sw	$v0,28($fp)
$L43:
	lw	$v0,28($fp)
	bne	$v0,$zero,$L44
	b	$L39
$L44:
	lw	$v1,28($fp)
	li	$v0,1			# 0x1
	sw	$v0,20($v1)
	lw	$v0,28($fp)
	lw	$v0,0($v0)
	bne	$v0,$zero,$L45
	b	$L39
$L45:
	lw	$v0,24($fp)
	addu	$v1,$v0,1
	lw	$v0,60($fp)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L39
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	lw	$s0,28($fp)
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,64($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$t9,strlen
	jal	$ra,$t9
	addu	$v0,$v0,1
	move	$a0,$v0
	li	$a1,1			# 0x1
	la	$t9,calloc
	jal	$ra,$t9
	move	$a0,$v0
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,64($fp)
	addu	$v0,$v1,$v0
	lw	$a1,0($v0)
	la	$t9,strcpy
	jal	$ra,$t9
	sw	$v0,24($s0)
$L39:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L37
$L38:
	sw	$zero,32($fp)
$L35:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,52($sp)
	lw	$fp,48($sp)
	lw	$s0,40($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	ParseArg_parse
	.size	ParseArg_parse, .-ParseArg_parse
	.align	2
	.globl	ParseArg_getArg
	.ent	ParseArg_getArg
ParseArg_getArg:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	move	$v0,$a1
	sb	$v0,24($fp)
	sw	$zero,28($fp)
	lw	$v0,56($fp)
	bne	$v0,$zero,$L48
	sw	$zero,32($fp)
	b	$L47
$L48:
	lb	$v0,24($fp)
	lw	$a0,56($fp)
	move	$a1,$v0
	la	$t9,encontrar_argumento_corto
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L49
	sw	$zero,32($fp)
	b	$L47
$L49:
	lw	$v0,28($fp)
	lw	$v0,20($v0)
	beq	$v0,$zero,$L50
	lw	$v0,28($fp)
	lw	$v0,0($v0)
	bne	$v0,$zero,$L51
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
	b	$L47
$L51:
	lw	$v0,28($fp)
	lw	$v0,24($v0)
	bne	$v0,$zero,$L52
	sw	$zero,32($fp)
	b	$L47
$L52:
	lw	$v0,28($fp)
	lw	$v1,28($fp)
	lw	$v0,0($v0)
	lw	$a0,24($v1)
	move	$t9,$v0
	jal	$ra,$t9
	sw	$v0,32($fp)
	b	$L47
$L50:
	lw	$v0,28($fp)
	lw	$v0,12($v0)
	sw	$v0,32($fp)
$L47:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	ParseArg_getArg
	.size	ParseArg_getArg, .-ParseArg_getArg
	.align	2
	.globl	ParseArg_delete
	.ent	ParseArg_delete
ParseArg_delete:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$zero,24($fp)
	lw	$v0,48($fp)
	bne	$v0,$zero,$L54
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	b	$L53
$L54:
	sw	$zero,24($fp)
$L55:
	lw	$v0,48($fp)
	lw	$v1,24($fp)
	lw	$v0,4($v0)
	slt	$v0,$v1,$v0
	bne	$v0,$zero,$L58
	b	$L56
$L58:
	lw	$a0,48($fp)
	lw	$v1,24($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$v0,8($v0)
	beq	$v0,$zero,$L59
	lw	$a0,48($fp)
	lw	$v1,24($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,8($v0)
	la	$t9,free
	jal	$ra,$t9
$L59:
	lw	$a0,48($fp)
	lw	$v1,24($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$v0,12($v0)
	beq	$v0,$zero,$L60
	lw	$a0,48($fp)
	lw	$v1,24($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,12($v0)
	la	$t9,free
	jal	$ra,$t9
$L60:
	lw	$a0,48($fp)
	lw	$v1,24($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$v0,24($v0)
	beq	$v0,$zero,$L57
	lw	$a0,48($fp)
	lw	$v1,24($fp)
	move	$v0,$v1
	sll	$v0,$v0,3
	subu	$v0,$v0,$v1
	sll	$v1,$v0,2
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,24($v0)
	la	$t9,free
	jal	$ra,$t9
$L57:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L55
$L56:
	lw	$v0,48($fp)
	lw	$a0,8($v0)
	la	$t9,free
	jal	$ra,$t9
	lw	$a0,48($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,28($fp)
$L53:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	ParseArg_delete
	.size	ParseArg_delete, .-ParseArg_delete
	.align	2
	.globl	ParseArg_parseStr
	.ent	ParseArg_parseStr
ParseArg_parseStr:
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
	lw	$a0,40($fp)
	la	$t9,strlen
	jal	$ra,$t9
	addu	$v0,$v0,1
	move	$a0,$v0
	li	$a1,1			# 0x1
	la	$t9,calloc
	jal	$ra,$t9
	move	$a0,$v0
	lw	$a1,40($fp)
	la	$t9,strcpy
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	ParseArg_parseStr
	.size	ParseArg_parseStr, .-ParseArg_parseStr
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
