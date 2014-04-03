	.file	1 "base_64.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.data
	.type	little_endian, @object
	.size	little_endian, 1
little_endian:
	.byte	1
	.text
	.align	2
	.globl	set_endianess
	.ent	set_endianess
set_endianess:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	li	$v0,1			# 0x1
	sw	$v0,8($fp)
	addu	$v0,$fp,8
	sw	$v0,12($fp)
	lw	$v0,12($fp)
	lb	$v1,0($v0)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L18
	li	$v0,1			# 0x1
	sb	$v0,little_endian
	b	$L17
$L18:
	sb	$zero,little_endian
$L17:
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	set_endianess
	.size	set_endianess, .-set_endianess
	.align	2
	.globl	array_invert
	.ent	array_invert
array_invert:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sb	$zero,8($fp)
	lw	$v0,24($fp)
	lbu	$v0,0($v0)
	sb	$v0,8($fp)
	lw	$v1,24($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,3
	lbu	$v0,0($v0)
	sb	$v0,0($v1)
	lw	$v0,24($fp)
	addu	$v1,$v0,3
	lbu	$v0,8($fp)
	sb	$v0,0($v1)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	lbu	$v0,0($v0)
	sb	$v0,8($fp)
	lw	$v0,24($fp)
	addu	$v1,$v0,1
	lw	$v0,24($fp)
	addu	$v0,$v0,2
	lbu	$v0,0($v0)
	sb	$v0,0($v1)
	lw	$v0,24($fp)
	addu	$v1,$v0,2
	lbu	$v0,8($fp)
	sb	$v0,0($v1)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	array_invert
	.size	array_invert, .-array_invert
	.rdata
	.align	2
$LC0:
	.ascii	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123"
	.ascii	"456789+/\000"
	.text
	.align	2
	.globl	encode_to_base64
	.ent	encode_to_base64
encode_to_base64:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	addu	$v0,$fp,24
	sw	$v0,36($fp)
	addu	$v0,$fp,28
	sw	$v0,40($fp)
	addu	$a0,$fp,24
	lw	$a1,64($fp)
	li	$a2,3			# 0x3
	la	$t9,memcpy
	jal	$ra,$t9
	lbu	$v0,little_endian
	beq	$v0,$zero,$L22
	lw	$a0,36($fp)
	la	$t9,array_invert
	jal	$ra,$t9
$L22:
	lw	$v0,24($fp)
	sra	$v0,$v0,8
	sw	$v0,24($fp)
	sw	$zero,32($fp)
$L23:
	lw	$v0,32($fp)
	slt	$v0,$v0,4
	bne	$v0,$zero,$L26
	b	$L24
$L26:
	lw	$v0,24($fp)
	sll	$v0,$v0,6
	sw	$v0,24($fp)
	lbu	$v0,little_endian
	beq	$v0,$zero,$L27
	lw	$v1,40($fp)
	lw	$v0,36($fp)
	addu	$v0,$v0,3
	lbu	$v0,0($v0)
	sb	$v0,0($v1)
	lw	$v0,36($fp)
	addu	$v0,$v0,3
	sb	$zero,0($v0)
	b	$L28
$L27:
	lw	$v0,40($fp)
	addu	$v1,$v0,3
	lw	$v0,36($fp)
	lbu	$v0,0($v0)
	sb	$v0,0($v1)
	lw	$v0,36($fp)
	sb	$zero,0($v0)
$L28:
	lw	$v1,68($fp)
	lw	$v0,32($fp)
	addu	$a0,$v1,$v0
	lw	$v1,28($fp)
	la	$v0,$LC0
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L23
$L24:
	li	$v0,1			# 0x1
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	encode_to_base64
	.size	encode_to_base64, .-encode_to_base64
	.align	2
	.globl	index_of
	.ent	index_of
index_of:
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
	move	$v0,$a0
	sw	$a1,36($fp)
	sw	$a2,40($fp)
	sb	$v0,8($fp)
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,12($fp)
	sw	$zero,16($fp)
$L30:
	lw	$v0,16($fp)
	lw	$v1,40($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L33
	b	$L31
$L33:
	lw	$v1,36($fp)
	lw	$v0,16($fp)
	addu	$v0,$v1,$v0
	lb	$v1,8($fp)
	lb	$v0,0($v0)
	bne	$v1,$v0,$L32
	lw	$v0,16($fp)
	sw	$v0,12($fp)
	b	$L31
$L32:
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	b	$L30
$L31:
	lw	$v0,12($fp)
	move	$sp,$fp
	lw	$fp,28($sp)
	addu	$sp,$sp,32
	j	$ra
	.end	index_of
	.size	index_of, .-index_of
	.align	2
	.globl	decode_from_base64
	.ent	decode_from_base64
decode_from_base64:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	sw	$a2,72($fp)
	sw	$zero,24($fp)
	lw	$v0,72($fp)
	sw	$zero,0($v0)
	addu	$v0,$fp,24
	sw	$v0,32($fp)
	li	$v0,3			# 0x3
	sw	$v0,28($fp)
$L36:
	lw	$v0,28($fp)
	bgez	$v0,$L39
	b	$L37
$L39:
	lw	$v1,64($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	lb	$v0,0($v0)
	move	$a0,$v0
	la	$a1,$LC0
	li	$a2,64			# 0x40
	la	$t9,index_of
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v0,36($fp)
	bgez	$v0,$L40
	lw	$v1,64($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	lb	$v1,0($v0)
	li	$v0,61			# 0x3d
	beq	$v1,$v0,$L41
	sw	$zero,40($fp)
	b	$L35
$L41:
	lw	$v1,72($fp)
	lw	$v0,72($fp)
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	sw	$v0,0($v1)
	lbu	$v0,little_endian
	beq	$v0,$zero,$L42
	lw	$v0,32($fp)
	addu	$v0,$v0,3
	sb	$zero,0($v0)
	b	$L44
$L42:
	lw	$v0,32($fp)
	sb	$zero,0($v0)
	b	$L44
$L40:
	lbu	$v0,little_endian
	beq	$v0,$zero,$L45
	lw	$v0,32($fp)
	addu	$v1,$v0,3
	lbu	$v0,36($fp)
	sb	$v0,0($v1)
	b	$L44
$L45:
	lw	$v1,32($fp)
	lbu	$v0,36($fp)
	sb	$v0,0($v1)
$L44:
	lw	$v0,24($fp)
	sra	$v0,$v0,6
	sw	$v0,24($fp)
	lw	$v0,28($fp)
	addu	$v0,$v0,-1
	sw	$v0,28($fp)
	b	$L36
$L37:
	lbu	$v0,little_endian
	beq	$v0,$zero,$L47
	lw	$a0,32($fp)
	la	$t9,array_invert
	jal	$ra,$t9
$L47:
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	lw	$a0,68($fp)
	move	$a1,$v0
	li	$a2,3			# 0x3
	la	$t9,memcpy
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,40($fp)
$L35:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	decode_from_base64
	.size	decode_from_base64, .-decode_from_base64
	.align	2
	.globl	add_padding
	.ent	add_padding
add_padding:
	.frame	$fp,16,$ra		# vars= 0, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,16
	.cprestore 0
	sw	$fp,12($sp)
	sw	$gp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	sw	$a1,20($fp)
	lw	$v0,16($fp)
	slt	$v0,$v0,3
	beq	$v0,$zero,$L48
	lw	$v0,16($fp)
	slt	$v0,$v0,3
	beq	$v0,$zero,$L50
	lw	$v0,20($fp)
	addu	$v1,$v0,3
	li	$v0,61			# 0x3d
	sb	$v0,0($v1)
$L50:
	lw	$v0,16($fp)
	slt	$v0,$v0,2
	beq	$v0,$zero,$L48
	lw	$v0,20($fp)
	addu	$v1,$v0,2
	li	$v0,61			# 0x3d
	sb	$v0,0($v1)
$L48:
	move	$sp,$fp
	lw	$fp,12($sp)
	addu	$sp,$sp,16
	j	$ra
	.end	add_padding
	.size	add_padding, .-add_padding
	.align	2
	.globl	encode
	.ent	encode
encode:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	la	$t9,set_endianess
	jal	$ra,$t9
	addu	$a0,$fp,24
	li	$a1,1			# 0x1
	li	$a2,3			# 0x3
	lw	$a3,72($fp)
	la	$t9,fread
	jal	$ra,$t9
	sw	$v0,40($fp)
$L53:
	lw	$v0,40($fp)
	bgtz	$v0,$L55
	b	$L54
$L55:
	lw	$v0,40($fp)
	slt	$v0,$v0,3
	beq	$v0,$zero,$L56
	sb	$zero,26($fp)
$L56:
	lw	$v0,40($fp)
	slt	$v0,$v0,2
	beq	$v0,$zero,$L57
	sb	$zero,25($fp)
$L57:
	addu	$v0,$fp,32
	addu	$a0,$fp,24
	move	$a1,$v0
	la	$t9,encode_to_base64
	jal	$ra,$t9
	bne	$v0,$zero,$L58
	li	$v0,3			# 0x3
	sw	$v0,48($fp)
	b	$L52
$L58:
	addu	$v0,$fp,32
	lw	$a0,40($fp)
	move	$a1,$v0
	la	$t9,add_padding
	jal	$ra,$t9
	addu	$v0,$fp,32
	move	$a0,$v0
	li	$a1,1			# 0x1
	li	$a2,4			# 0x4
	lw	$a3,76($fp)
	la	$t9,fwrite
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v1,44($fp)
	li	$v0,4			# 0x4
	beq	$v1,$v0,$L59
	li	$v0,5			# 0x5
	sw	$v0,48($fp)
	b	$L52
$L59:
	addu	$a0,$fp,24
	li	$a1,1			# 0x1
	li	$a2,3			# 0x3
	lw	$a3,72($fp)
	la	$t9,fread
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L53
$L54:
	sw	$zero,48($fp)
$L52:
	lw	$v0,48($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	encode
	.size	encode, .-encode
	.align	2
	.globl	decode
	.ent	decode
decode:
	.frame	$fp,80,$ra		# vars= 40, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,80
	.cprestore 16
	sw	$ra,72($sp)
	sw	$fp,68($sp)
	sw	$gp,64($sp)
	move	$fp,$sp
	sw	$a0,80($fp)
	sw	$a1,84($fp)
	la	$t9,set_endianess
	jal	$ra,$t9
	sw	$zero,40($fp)
	addu	$a0,$fp,24
	li	$a1,1			# 0x1
	li	$a2,4			# 0x4
	lw	$a3,80($fp)
	la	$t9,fread
	jal	$ra,$t9
	sw	$v0,44($fp)
$L61:
	lw	$v0,44($fp)
	bgtz	$v0,$L63
	b	$L62
$L63:
	lw	$v0,44($fp)
	slt	$v0,$v0,4
	beq	$v0,$zero,$L64
	li	$v0,3			# 0x3
	sw	$v0,56($fp)
	b	$L60
$L64:
	addu	$v0,$fp,32
	addu	$v1,$fp,40
	addu	$a0,$fp,24
	move	$a1,$v0
	move	$a2,$v1
	la	$t9,decode_from_base64
	jal	$ra,$t9
	bne	$v0,$zero,$L65
	li	$v0,4			# 0x4
	sw	$v0,56($fp)
	b	$L60
$L65:
	li	$v0,3			# 0x3
	sw	$v0,48($fp)
	lw	$v0,40($fp)
	beq	$v0,$zero,$L66
	lw	$v1,40($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L67
	li	$v0,2			# 0x2
	sw	$v0,48($fp)
$L67:
	lw	$v1,40($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L66
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
$L66:
	addu	$v0,$fp,32
	move	$a0,$v0
	li	$a1,1			# 0x1
	lw	$a2,48($fp)
	lw	$a3,84($fp)
	la	$t9,fwrite
	jal	$ra,$t9
	sw	$v0,52($fp)
	lw	$v1,52($fp)
	lw	$v0,48($fp)
	beq	$v1,$v0,$L69
	li	$v0,5			# 0x5
	sw	$v0,56($fp)
	b	$L60
$L69:
	addu	$a0,$fp,24
	li	$a1,1			# 0x1
	li	$a2,4			# 0x4
	lw	$a3,80($fp)
	la	$t9,fread
	jal	$ra,$t9
	sw	$v0,44($fp)
	b	$L61
$L62:
	sw	$zero,56($fp)
$L60:
	lw	$v0,56($fp)
	move	$sp,$fp
	lw	$ra,72($sp)
	lw	$fp,68($sp)
	addu	$sp,$sp,80
	j	$ra
	.end	decode
	.size	decode, .-decode
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
