	.file	"main.c"
	.section	.rodata
	.align 4
.LC0:
	.string	"No se especifico ningun comando\n"
.LC1:
	.string	"help"
.LC2:
	.string	"version"
.LC3:
	.string	"encode"
.LC4:
	.string	"decode"
.LC5:
	.string	"output"
.LC6:
	.string	"input"
.LC7:
	.string	"r"
.LC8:
	.string	"wb"
	.align 4
.LC9:
	.string	"No se especifico un comando valido"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	cmpl	$1, 8(%ebp)
	jg	.L2
	movl	stderr, %eax
	movl	%eax, 12(%esp)
	movl	$32, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC0, (%esp)
	call	fwrite
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	$0, 52(%esp)
	movl	$0, 48(%esp)
	movl	$0, 44(%esp)
	movl	$6, (%esp)
	call	ParseArg_new
	movl	%eax, 40(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$.LC1, 12(%esp)
	movl	$104, 8(%esp)
	movl	$0, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_addArg
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$.LC2, 12(%esp)
	movl	$118, 8(%esp)
	movl	$0, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_addArg
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$.LC3, 12(%esp)
	movl	$101, 8(%esp)
	movl	$0, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_addArg
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$.LC4, 12(%esp)
	movl	$100, 8(%esp)
	movl	$0, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_addArg
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$.LC5, 12(%esp)
	movl	$111, 8(%esp)
	movl	$ParseArg_parseStr, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_addArg
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$.LC6, 12(%esp)
	movl	$105, 8(%esp)
	movl	$ParseArg_parseStr, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_addArg
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_parse
	movl	$104, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	testl	%eax, %eax
	je	.L4
	call	usage
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_delete
	movl	$0, %eax
	jmp	.L3
.L4:
	movl	$118, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	testl	%eax, %eax
	je	.L5
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	version
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_delete
	movl	$0, %eax
	jmp	.L3
.L5:
	movl	$105, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	movl	%eax, 48(%esp)
	movl	$111, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	movl	%eax, 52(%esp)
	cmpl	$0, 48(%esp)
	jne	.L6
	movl	stdin, %eax
	movl	%eax, 60(%esp)
	jmp	.L7
.L6:
	movl	$.LC7, 4(%esp)
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 60(%esp)
	cmpl	$0, 60(%esp)
	jne	.L7
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_delete
	movl	$1, %eax
	jmp	.L3
.L7:
	cmpl	$0, 52(%esp)
	jne	.L8
	movl	stdout, %eax
	movl	%eax, 56(%esp)
	jmp	.L9
.L8:
	movl	$.LC8, 4(%esp)
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	fopen
	movl	%eax, 56(%esp)
	cmpl	$0, 56(%esp)
	jne	.L9
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_delete
	movl	$1, %eax
	jmp	.L3
.L9:
	movl	$101, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	testl	%eax, %eax
	je	.L10
	movl	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	encode
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_delete
	movl	$0, %eax
	jmp	.L3
.L10:
	movl	$100, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	testl	%eax, %eax
	je	.L11
	movl	56(%esp), %eax
	movl	%eax, 4(%esp)
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	decode
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_delete
	movl	$0, %eax
	jmp	.L3
.L11:
	movl	$101, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	testl	%eax, %eax
	je	.L12
	movl	$100, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	testl	%eax, %eax
	je	.L12
	movl	$104, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	testl	%eax, %eax
	je	.L12
	movl	$118, 4(%esp)
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_getArg
	testl	%eax, %eax
	jne	.L13
.L12:
	movl	$.LC9, (%esp)
	call	perror
	movl	$1, %eax
	jmp	.L3
.L13:
	movl	stdout, %eax
	cmpl	%eax, 56(%esp)
	je	.L14
	movl	56(%esp), %eax
	movl	%eax, (%esp)
	call	fclose
.L14:
	movl	stdin, %eax
	cmpl	%eax, 60(%esp)
	je	.L15
	movl	60(%esp), %eax
	movl	%eax, (%esp)
	call	fclose
.L15:
	movl	44(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	48(%esp), %eax
	movl	%eax, (%esp)
	call	free
	movl	40(%esp), %eax
	movl	%eax, (%esp)
	call	ParseArg_delete
	movl	$0, %eax
.L3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.section	.rodata
.LC10:
	.string	"%s 1.0.0\n"
	.text
	.globl	version
	.type	version, @function
version:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC10, (%esp)
	call	printf
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	version, .-version
	.section	.rodata
.LC11:
	.string	"OPTIONS:"
	.align 4
.LC12:
	.string	"-d --decode Decodes from Base64"
	.align 4
.LC13:
	.string	"-i --input file Reads from file or stdin"
	.align 4
.LC14:
	.string	"-o --output file Writes to file or stdout"
	.align 4
.LC15:
	.string	"-v --version Show version string"
	.align 4
.LC16:
	.string	"-h --help Print this message and quit"
	.text
	.globl	usage
	.type	usage, @function
usage:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$.LC11, (%esp)
	call	puts
	movl	$.LC12, (%esp)
	call	puts
	movl	$.LC13, (%esp)
	call	puts
	movl	$.LC14, (%esp)
	call	puts
	movl	$.LC15, (%esp)
	call	puts
	movl	$.LC16, (%esp)
	call	puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	usage, .-usage
	.ident	"GCC: (Debian 4.8.2-16) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
