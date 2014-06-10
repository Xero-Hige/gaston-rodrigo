	.file	"base_64.c"
	.data
	.type	little_endian, @object
	.size	little_endian, 1
little_endian:
	.byte	1
	.text
	.globl	set_endianess
	.type	set_endianess, @function
set_endianess:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$1, -8(%ebp)
	leal	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$1, %al
	jne	.L2
	movb	$1, little_endian
	jmp	.L1
.L2:
	movb	$0, little_endian
.L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	set_endianess, .-set_endianess
	.globl	array_invert
	.type	array_invert, @function
array_invert:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movb	$0, -1(%ebp)
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movb	%al, -1(%ebp)
	movl	8(%ebp), %eax
	movzbl	3(%eax), %edx
	movl	8(%ebp), %eax
	movb	%dl, (%eax)
	movl	8(%ebp), %eax
	leal	3(%eax), %edx
	movzbl	-1(%ebp), %eax
	movb	%al, (%edx)
	movl	8(%ebp), %eax
	movzbl	1(%eax), %eax
	movb	%al, -1(%ebp)
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movzbl	2(%eax), %eax
	movb	%al, (%edx)
	movl	8(%ebp), %eax
	leal	2(%eax), %edx
	movzbl	-1(%ebp), %eax
	movb	%al, (%edx)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	array_invert, .-array_invert
	.section	.rodata
	.align 4
.LC0:
	.string	"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	.text
	.globl	encode_to_base64
	.type	encode_to_base64, @function
encode_to_base64:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$0, -24(%ebp)
	movl	$0, -28(%ebp)
	leal	-24(%ebp), %eax
	movl	%eax, -16(%ebp)
	leal	-28(%ebp), %eax
	movl	%eax, -20(%ebp)
	movl	$3, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	memcpy
	movzbl	little_endian, %eax
	testb	%al, %al
	je	.L6
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	array_invert
.L6:
	movl	-24(%ebp), %eax
	sarl	$8, %eax
	movl	%eax, -24(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L7
.L10:
	movl	-24(%ebp), %eax
	sall	$6, %eax
	movl	%eax, -24(%ebp)
	movzbl	little_endian, %eax
	testb	%al, %al
	je	.L8
	movl	-16(%ebp), %eax
	movzbl	3(%eax), %edx
	movl	-20(%ebp), %eax
	movb	%dl, (%eax)
	movl	-16(%ebp), %eax
	addl	$3, %eax
	movb	$0, (%eax)
	jmp	.L9
.L8:
	movl	-20(%ebp), %eax
	leal	3(%eax), %edx
	movl	-16(%ebp), %eax
	movzbl	(%eax), %eax
	movb	%al, (%edx)
	movl	-16(%ebp), %eax
	movb	$0, (%eax)
.L9:
	movl	-12(%ebp), %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	-28(%ebp), %eax
	movzbl	.LC0(%eax), %eax
	movb	%al, (%edx)
	addl	$1, -12(%ebp)
.L7:
	cmpl	$3, -12(%ebp)
	jle	.L10
	movl	$1, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	encode_to_base64, .-encode_to_base64
	.globl	index_of
	.type	index_of, @function
index_of:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	$-1, -4(%ebp)
	movl	$0, -8(%ebp)
	jmp	.L13
.L16:
	movl	-8(%ebp), %eax
	movl	12(%ebp), %edx
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	-20(%ebp), %al
	jne	.L14
	movl	-8(%ebp), %eax
	movl	%eax, -4(%ebp)
	jmp	.L15
.L14:
	addl	$1, -8(%ebp)
.L13:
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	.L16
.L15:
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	index_of, .-index_of
	.globl	decode_from_base64
	.type	decode_from_base64, @function
decode_from_base64:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -24(%ebp)
	movl	16(%ebp), %eax
	movl	$0, (%eax)
	leal	-24(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	$3, -12(%ebp)
	jmp	.L19
.L27:
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	$64, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	%eax, (%esp)
	call	index_of
	movl	%eax, -20(%ebp)
	cmpl	$0, -20(%ebp)
	jns	.L20
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	cmpb	$61, %al
	je	.L21
	movl	$0, %eax
	jmp	.L29
.L21:
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	leal	1(%eax), %edx
	movl	16(%ebp), %eax
	movl	%edx, (%eax)
	movzbl	little_endian, %eax
	testb	%al, %al
	je	.L23
	movl	-16(%ebp), %eax
	addl	$3, %eax
	movb	$0, (%eax)
	jmp	.L25
.L23:
	movl	-16(%ebp), %eax
	movb	$0, (%eax)
	jmp	.L25
.L20:
	movzbl	little_endian, %eax
	testb	%al, %al
	je	.L26
	movl	-16(%ebp), %eax
	leal	3(%eax), %edx
	movl	-20(%ebp), %eax
	movb	%al, (%edx)
	jmp	.L25
.L26:
	movl	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movb	%dl, (%eax)
.L25:
	movl	-24(%ebp), %eax
	sarl	$6, %eax
	movl	%eax, -24(%ebp)
	subl	$1, -12(%ebp)
.L19:
	cmpl	$0, -12(%ebp)
	jns	.L27
	movzbl	little_endian, %eax
	testb	%al, %al
	je	.L28
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	array_invert
.L28:
	movl	-16(%ebp), %eax
	addl	$1, %eax
	movl	$3, 8(%esp)
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	memcpy
	movl	$1, %eax
.L29:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	decode_from_base64, .-decode_from_base64
	.globl	add_padding
	.type	add_padding, @function
add_padding:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	cmpl	$2, 8(%ebp)
	jg	.L30
	cmpl	$2, 8(%ebp)
	jg	.L32
	movl	12(%ebp), %eax
	addl	$3, %eax
	movb	$61, (%eax)
.L32:
	cmpl	$1, 8(%ebp)
	jg	.L30
	movl	12(%ebp), %eax
	addl	$2, %eax
	movb	$61, (%eax)
.L30:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	add_padding, .-add_padding
	.globl	encode
	.type	encode, @function
encode:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	call	set_endianess
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$3, 8(%esp)
	movl	$1, 4(%esp)
	leal	-19(%ebp), %eax
	movl	%eax, (%esp)
	call	fread
	movl	%eax, -12(%ebp)
	jmp	.L34
.L40:
	cmpl	$2, -12(%ebp)
	jg	.L35
	movb	$0, -17(%ebp)
.L35:
	cmpl	$1, -12(%ebp)
	jg	.L36
	movb	$0, -18(%ebp)
.L36:
	leal	-23(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-19(%ebp), %eax
	movl	%eax, (%esp)
	call	encode_to_base64
	xorl	$1, %eax
	testb	%al, %al
	je	.L37
	movl	$3, %eax
	jmp	.L41
.L37:
	leal	-23(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	add_padding
	movl	12(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	leal	-23(%ebp), %eax
	movl	%eax, (%esp)
	call	fwrite
	movl	%eax, -16(%ebp)
	cmpl	$4, -16(%ebp)
	je	.L39
	movl	$5, %eax
	jmp	.L41
.L39:
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$3, 8(%esp)
	movl	$1, 4(%esp)
	leal	-19(%ebp), %eax
	movl	%eax, (%esp)
	call	fread
	movl	%eax, -12(%ebp)
.L34:
	cmpl	$0, -12(%ebp)
	jg	.L40
	movl	$0, %eax
.L41:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	encode, .-encode
	.globl	decode
	.type	decode, @function
decode:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	call	set_endianess
	movl	$0, -32(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	fread
	movl	%eax, -12(%ebp)
	jmp	.L43
.L50:
	cmpl	$3, -12(%ebp)
	jg	.L44
	movl	$3, %eax
	jmp	.L51
.L44:
	leal	-32(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-27(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	decode_from_base64
	xorl	$1, %eax
	testb	%al, %al
	je	.L46
	movl	$4, %eax
	jmp	.L51
.L46:
	movl	$3, -16(%ebp)
	movl	-32(%ebp), %eax
	testl	%eax, %eax
	je	.L47
	movl	-32(%ebp), %eax
	cmpl	$1, %eax
	jne	.L48
	movl	$2, -16(%ebp)
.L48:
	movl	-32(%ebp), %eax
	cmpl	$2, %eax
	jne	.L47
	movl	$1, -16(%ebp)
.L47:
	movl	-16(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	leal	-27(%ebp), %eax
	movl	%eax, (%esp)
	call	fwrite
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	cmpl	-16(%ebp), %eax
	je	.L49
	movl	$5, %eax
	jmp	.L51
.L49:
	movl	8(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	$4, 8(%esp)
	movl	$1, 4(%esp)
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	fread
	movl	%eax, -12(%ebp)
.L43:
	cmpl	$0, -12(%ebp)
	jg	.L50
	movl	$0, %eax
.L51:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	decode, .-decode
	.ident	"GCC: (Debian 4.8.2-16) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
