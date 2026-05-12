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
	.section	.text.unlikely,"ax",@progbits
.LCOLDB8:
	.section	.text.startup,"ax",@progbits
.LHOTB8:
	.p2align 4
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
	movq	%rsi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edi
	je	.L2
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	leaq	.LC0(%rip), %rdx
	movl	$2, %esi
	call	__fprintf_chk@PLT
.L3:
	movl	$1, %ebx
.L1:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L24
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
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
	leaq	32(%rsp), %rbp
	leaq	.LC4(%rip), %r13
	leaq	.LC3(%rip), %r14
	call	fopen@PLT
	xorl	%edx, %edx
	movq	%rax, 24(%rsp)
	movq	%rdx, 16(%rsp)
	testq	%rax, %rax
	je	.L19
	.p2align 4,,10
	.p2align 3
.L4:
	movq	24(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%rbp, %rdi
	call	fread@PLT
	movq	%rax, 8(%rsp)
	movl	%eax, %ebx
	testl	%eax, %eax
	jle	.L25
	movq	16(%rsp), %rdx
	movl	$2, %edi
	xorl	%eax, %eax
	xorl	%r12d, %r12d
	leaq	.LC2(%rip), %rsi
	call	__printf_chk@PLT
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L27:
	movzbl	0(%rbp,%r12), %edx
	movq	%r14, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r12
	call	__printf_chk@PLT
	cmpq	$16, %r12
	je	.L26
.L8:
	cmpl	%r12d, %ebx
	jg	.L27
	movq	%r13, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r12
	call	__printf_chk@PLT
	cmpq	$16, %r12
	jne	.L8
.L26:
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	movq	%rbp, %r15
	call	__printf_chk@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %r12
	movq	8(%rsp), %rax
	subl	$1, %eax
	leaq	33(%rsp,%rax), %rbx
	.p2align 4,,10
	.p2align 3
.L12:
	movzbl	(%r15), %ecx
	movq	(%r12), %rax
	movq	stdout(%rip), %rsi
	movq	%rcx, %rdi
	testb	$64, 1(%rax,%rcx,2)
	jne	.L22
	movl	$46, %edi
.L22:
	call	putc@PLT
	addq	$1, %r15
	cmpq	%r15, %rbx
	jne	.L12
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movslq	8(%rsp), %r12
	addq	%r12, 16(%rsp)
	jmp	.L4
.L25:
	movq	24(%rsp), %rdi
	call	ferror@PLT
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	.L20
	movq	24(%rsp), %rdi
	call	fclose@PLT
	jmp	.L1
.L24:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB42:
.L20:
	.cfi_def_cfa_offset 128
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	leaq	.LC7(%rip), %rdi
	call	perror@PLT
	movq	24(%rsp), %rdi
	call	fclose@PLT
	jmp	.L3
.L19:
	movq	8(%rbx), %rdi
	call	perror@PLT
	jmp	.L3
	.cfi_endproc
.LFE42:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE8:
	.section	.text.startup
.LHOTE8:
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
