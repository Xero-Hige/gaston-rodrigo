	.file	"arg_parse.c"
	.text
	.globl	ParseArg_new
	.type	ParseArg_new, @function
ParseArg_new:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	cmpl	$0, 8(%ebp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	$12, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	movl	8(%ebp), %eax
	movl	$28, 4(%esp)
	movl	%eax, (%esp)
	call	calloc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	-12(%ebp), %eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	ParseArg_new, .-ParseArg_new
	.globl	ParseArg_addArg
	.type	ParseArg_addArg, @function
ParseArg_addArg:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	movl	16(%ebp), %eax
	movb	%al, -12(%ebp)
	cmpl	$0, 8(%ebp)
	je	.L5
	movl	8(%ebp), %eax
	movl	4(%eax), %edx
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jl	.L6
.L5:
	movl	$1, %eax
	jmp	.L7
.L6:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%eax, (%edx)
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %edx
	movzbl	-12(%ebp), %eax
	movb	%al, 4(%edx)
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	(%edx,%eax), %ebx
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
	addl	$1, %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	calloc
	movl	20(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
	movl	%eax, 8(%ebx)
	cmpl	$0, 28(%ebp)
	je	.L8
	cmpl	$0, 24(%ebp)
	je	.L8
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	leal	(%edx,%eax), %ebx
	movl	28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	calloc
	movl	%eax, 12(%ebx)
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movl	12(%eax), %eax
	movl	28(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	24(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	memcpy
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%eax, %edx
	movl	28(%ebp), %eax
	movl	%eax, 16(%edx)
.L8:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	$0, %eax
.L7:
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	ParseArg_addArg, .-ParseArg_addArg
	.globl	encontrar_argumento_corto
	.type	encontrar_argumento_corto, @function
encontrar_argumento_corto:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	12(%ebp), %eax
	movb	%al, -20(%ebp)
	movl	$0, -4(%ebp)
	movl	$0, -4(%ebp)
	jmp	.L10
.L13:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-4(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movzbl	4(%eax), %eax
	cmpb	-20(%ebp), %al
	jne	.L11
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-4(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	jmp	.L12
.L11:
	addl	$1, -4(%ebp)
.L10:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-4(%ebp), %eax
	jg	.L13
	movl	$0, %eax
.L12:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	encontrar_argumento_corto, .-encontrar_argumento_corto
	.globl	encontrar_argumento_largo
	.type	encontrar_argumento_largo, @function
encontrar_argumento_largo:
.LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L15
.L18:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movl	8(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcmp
	testl	%eax, %eax
	jne	.L16
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	jmp	.L17
.L16:
	addl	$1, -12(%ebp)
.L15:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	.L18
	movl	$0, %eax
.L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	encontrar_argumento_largo, .-encontrar_argumento_largo
	.globl	ParseArg_parse
	.type	ParseArg_parse, @function
ParseArg_parse:
.LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	movl	$0, -12(%ebp)
	cmpl	$0, 8(%ebp)
	jne	.L20
	movl	$1, %eax
	jmp	.L21
.L20:
	movl	$1, -12(%ebp)
	jmp	.L22
.L28:
	movl	$0, -16(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	jne	.L23
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	cmpb	$45, %al
	jne	.L24
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	$2, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	encontrar_argumento_largo
	movl	%eax, -16(%ebp)
	jmp	.L25
.L24:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	encontrar_argumento_corto
	movl	%eax, -16(%ebp)
.L25:
	cmpl	$0, -16(%ebp)
	jne	.L26
	jmp	.L23
.L26:
	movl	-16(%ebp), %eax
	movl	$1, 20(%eax)
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L27
	jmp	.L23
.L27:
	movl	-12(%ebp), %eax
	addl	$1, %eax
	cmpl	12(%ebp), %eax
	jge	.L23
	addl	$1, -12(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %ebx
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	strlen
	addl	$1, %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	calloc
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
	movl	-16(%ebp), %edx
	movl	%eax, 24(%edx)
.L23:
	addl	$1, -12(%ebp)
.L22:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L28
	movl	$0, %eax
.L21:
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	ParseArg_parse, .-ParseArg_parse
	.globl	ParseArg_getArg
	.type	ParseArg_getArg, @function
ParseArg_getArg:
.LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movb	%al, -28(%ebp)
	movl	$0, -12(%ebp)
	cmpl	$0, 8(%ebp)
	jne	.L30
	movl	$0, %eax
	jmp	.L31
.L30:
	movsbl	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	encontrar_argumento_corto
	movl	%eax, -12(%ebp)
	cmpl	$0, -12(%ebp)
	jne	.L32
	movl	$0, %eax
	jmp	.L31
.L32:
	movl	-12(%ebp), %eax
	movl	20(%eax), %eax
	testl	%eax, %eax
	je	.L33
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L34
	movl	$1, %eax
	jmp	.L31
.L34:
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	testl	%eax, %eax
	jne	.L35
	movl	$0, %eax
	jmp	.L31
.L35:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	-12(%ebp), %edx
	movl	24(%edx), %edx
	movl	%edx, (%esp)
	call	*%eax
	jmp	.L31
.L33:
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
.L31:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	ParseArg_getArg, .-ParseArg_getArg
	.globl	ParseArg_delete
	.type	ParseArg_delete, @function
ParseArg_delete:
.LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$0, -12(%ebp)
	cmpl	$0, 8(%ebp)
	jne	.L37
	movl	$1, %eax
	jmp	.L38
.L37:
	movl	$0, -12(%ebp)
	jmp	.L39
.L43:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	je	.L40
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	free
.L40:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	je	.L41
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movl	12(%eax), %eax
	movl	%eax, (%esp)
	call	free
.L41:
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movl	24(%eax), %eax
	testl	%eax, %eax
	je	.L42
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	leal	0(,%eax,8), %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	%edx, %eax
	movl	24(%eax), %eax
	movl	%eax, (%esp)
	call	free
.L42:
	addl	$1, -12(%ebp)
.L39:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	.L43
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	free
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	free
	movl	$0, %eax
.L38:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	ParseArg_delete, .-ParseArg_delete
	.globl	ParseArg_parseStr
	.type	ParseArg_parseStr, @function
ParseArg_parseStr:
.LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
	addl	$1, %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	calloc
	movl	8(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	strcpy
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	ParseArg_parseStr, .-ParseArg_parseStr
	.ident	"GCC: (Debian 4.8.2-16) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
