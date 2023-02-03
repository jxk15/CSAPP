	.file	"LocalVariables.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"here is f2()"
.LC1:
	.string	"%p %p %p %p\n"
	.text
	.globl	f2
	.type	f2, @function
f2:
.LFB24:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC0, %edi
	call	puts
	leaq	1(%rsp), %r9
	leaq	2(%rsp), %r8
	leaq	4(%rsp), %rcx
	leaq	8(%rsp), %rdx
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	f2, .-f2
	.section	.rodata.str1.1
.LC2:
	.string	"here is f3()"
	.text
	.globl	f3
	.type	f3, @function
f3:
.LFB25:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC2, %edi
	call	puts
	leaq	1(%rsp), %r9
	leaq	4(%rsp), %r8
	leaq	2(%rsp), %rcx
	leaq	8(%rsp), %rdx
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	f3, .-f3
	.section	.rodata.str1.1
.LC3:
	.string	"here is f4()"
	.text
	.globl	f4
	.type	f4, @function
f4:
.LFB26:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC3, %edi
	call	puts
	leaq	2(%rsp), %r9
	leaq	8(%rsp), %r8
	leaq	4(%rsp), %rcx
	leaq	1(%rsp), %rdx
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	f4, .-f4
	.section	.rodata.str1.1
.LC4:
	.string	"%p\n"
	.text
	.globl	f5
	.type	f5, @function
f5:
.LFB27:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC3, %edi
	call	puts
	leaq	15(%rsp), %rdx
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE27:
	.size	f5, .-f5
	.globl	main
	.type	main, @function
main:
.LFB28:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$0, %eax
	call	f2
	movl	$0, %eax
	call	f3
	movl	$0, %eax
	call	f4
	movl	$0, %eax
	call	f5
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE28:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.5-4ubuntu2) 4.8.5"
	.section	.note.GNU-stack,"",@progbits
