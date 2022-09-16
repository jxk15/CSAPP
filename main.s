	.file	"main.c"
	.text
	.globl	mult2
	.type	mult2, @function
mult2:
.LFB23:
	.cfi_startproc
	endbr64
	imulq	%rsi, %rdi
	imulq	%rdx, %rdi
	imulq	%rcx, %rdi
	imulq	%r8, %rdi
	imulq	%r9, %rdi
	movq	%rdi, %rax
	imulq	8(%rsp), %rax
	imulq	16(%rsp), %rax
	ret
	.cfi_endproc
.LFE23:
	.size	mult2, .-mult2
	.globl	add
	.type	add, @function
add:
.LFB24:
	.cfi_startproc
	endbr64
	imulq	%rsi, %rdi
	imulq	%rdx, %rdi
	imulq	%rcx, %rdi
	imulq	%r8, %rdi
	imulq	%r9, %rdi
	movq	%rdi, %rax
	imulq	8(%rsp), %rax
	ret
	.cfi_endproc
.LFE24:
	.size	add, .-add
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%ld\n"
.LC1:
	.string	"%ld %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16

	pushq	$8
	.cfi_def_cfa_offset 24
	pushq	$7
	.cfi_def_cfa_offset 32
	movl	$6, %r9d
	movl	$5, %r8d
	movl	$4, %ecx
	movl	$3, %edx
	movl	$2, %esi
	movl	$1, %edi
	call	mult2
	addq	$16, %rsp
	.cfi_def_cfa_offset 16

	movq	%rax, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	pushq	$7
	.cfi_def_cfa_offset 32
	movl	$6, %r9d
	movl	$5, %r8d
	movl	$4, %ecx
	movl	$3, %edx
	movl	$2, %esi
	movl	$1, %edi
	call	add
	addq	$16, %rsp
	.cfi_def_cfa_offset 16


	movq	%rax, %rdx
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT


	movl	$11, %ecx
	movl	$10, %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
