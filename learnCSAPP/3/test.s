	.file	"test.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%.2x"
.LC1:
	.string	""
	.text
	.globl	show_long
	.type	show_long, @function
show_long:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbp
	movl	$0, %ebx
	jmp	.L2
.L3:
	movslq	%ebx, %rax
	movzbl	0(%rbp,%rax), %edx
	movl	$.LC0, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	addl	$1, %ebx
.L2:
	cmpl	$7, %ebx
	jle	.L3
	movl	$.LC1, %edi
	call	puts
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	show_long, .-show_long
	.globl	add1
	.type	add1, @function
add1:
.LFB25:
	.cfi_startproc
	movabsq	$1234605616436508552, %rax
	addq	%rax, (%rdi)
	ret
	.cfi_endproc
.LFE25:
	.size	add1, .-add1
	.globl	test1
	.type	test1, @function
test1:
.LFB26:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$1, 12(%rsp)
	leaq	12(%rsp), %rdi
	call	show_long
	leaq	12(%rsp), %rdi
	call	add1
	leaq	12(%rsp), %rdi
	call	show_long
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	test1, .-test1
	.globl	test2
	.type	test2, @function
test2:
.LFB27:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$1, 12(%rsp)
	leaq	12(%rsp), %rdi
	call	show_long
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	test2, .-test2
	.globl	test3
	.type	test3, @function
test3:
.LFB28:
	.cfi_startproc
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	movl	$1, 12(%rsp)
	leaq	12(%rsp), %rdi
	call	add1
	addq	$16, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE28:
	.size	test3, .-test3
	.globl	main
	.type	main, @function
main:
.LFB29:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %eax
	call	test1
	movl	$0, %eax
	call	test2
	movl	$0, %eax
	call	test3
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE29:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.5-4ubuntu2) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
