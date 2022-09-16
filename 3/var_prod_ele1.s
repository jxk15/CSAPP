	.file	"var_prod_ele.c"
	.text
	.globl	var_prod_ele
	.type	var_prod_ele, @function
var_prod_ele:
.LFB0:
	.cfi_startproc
	endbr64
	movq	%rdi, %r11   ; %r11 = n
	movl	$0, %r10d    ; r10d 存储result
	movl	$0, %eax     ; %eax = j = 0
	cmpq	%rax, %rdi   ; cmp n:j
	jle	.L8              ; if n <= j return
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
.L3:                             ; loop
	movq	%rcx, %r9            ; %r9 = i
	imulq	%r11, %r9            ; %r9 = n * i
	leaq	(%rsi,%r9,4), %rbx   ; %rbx = A[i]   A + i * 4 * n
	movq	%rax, %r9            ; %r9 = %rax = j
	imulq	%r11, %r9            ; %r9 = %r11 * %r9 = n * j
	leaq	(%rdx,%r9,4), %r9    ; %r9 = B[j]
	movl	(%r9,%r8,4), %r9d    ; %r9d = B[j][k]
	imull	(%rbx,%rax,4), %r9d  ; 计算元素乘积：%r9 = (A[i] + 4 * j) * B[j][k]
	addl	%r9d, %r10d          ; %r10d += %r9d
	addq	$1, %rax             ; j++
	cmpq	%rax, %rdi           ; cmp n:j
	jg	.L3                      ; if n > j , loop continue

	movl	%r10d, %eax          ; %rax = %r10d
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore 3
	movl	%r10d, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	var_prod_ele, .-var_prod_ele
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
