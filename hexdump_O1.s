# Name: Reyansh Attavar
	.file	"hexdump.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Usage: %s <filename>\n"
.LC1:
	.string	"rb"
.LC2:
	.string	"%08lx"
.LC3:
	.string	" %02x"
.LC4:
	.string	"   "
.LC5:
	.string	" |"
.LC6:
	.string	"|"
.LC7:
	.string	"fread"
	.text
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rsi, %rbx
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	je	.L2
	movq	(%rsi), %rcx
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	call	__fprintf_chk@PLT
	movl	$1, %ebx
.L1:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L18
	movl	%ebx, %eax
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	leaq	.LC1(%rip), %rsi
	call	fopen@PLT
	movq	%rax, 24(%rsp)
	movq	$0, 16(%rsp)
	leaq	.LC4(%rip), %r15
	leaq	.LC3(%rip), %r14
	testq	%rax, %rax
	jne	.L4
	movq	8(%rbx), %rdi
	call	perror@PLT
	movl	$1, %ebx
	jmp	.L1
.L5:
	movq	%r15, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.L6:
	addq	$1, %rbx
	cmpq	$16, %rbx
	je	.L19
.L7:
	cmpl	%ebx, %ebp
	jle	.L5
	movzbl	(%rbx,%r12), %edx
	movq	%r14, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L6
.L19:
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %rbp
	leaq	32(%rsp), %rbx
	movq	8(%rsp), %rax
	leal	-1(%rax), %eax
	leaq	33(%rsp,%rax), %r13
	movl	$46, %r12d
.L9:
	movzbl	(%rbx), %edi
	movzbl	%dil, %edx
	movq	0(%rbp), %rax
	testb	$64, 1(%rax,%rdx,2)
	cmove	%r12d, %edi
	movzbl	%dil, %edi
	movq	stdout(%rip), %rsi
	call	putc@PLT
	addq	$1, %rbx
	cmpq	%r13, %rbx
	jne	.L9
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movslq	8(%rsp), %rax
	addq	%rax, 16(%rsp)
.L4:
	leaq	32(%rsp), %rdi
	movq	24(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	%rax, 8(%rsp)
	movl	%eax, %ebp
	testl	%eax, %eax
	jle	.L20
	movq	16(%rsp), %rdx
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %ebx
	leaq	32(%rsp), %r12
	jmp	.L7
.L20:
	movq	24(%rsp), %rdi
	call	ferror@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L21
	movq	24(%rsp), %rdi
	call	fclose@PLT
	jmp	.L1
.L21:
	leaq	.LC7(%rip), %rdi
	call	perror@PLT
	movq	24(%rsp), %rdi
	call	fclose@PLT
	movl	$1, %ebx
	jmp	.L1
.L18:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
