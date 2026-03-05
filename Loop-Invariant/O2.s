	.file	"code.c"
	.text
	.p2align 4
	.globl	loop_invariant
	.type	loop_invariant, @function
loop_invariant:
.LFB23:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L4
	leal	-1(%rsi), %eax
	xorl	%r8d, %r8d
	leaq	4(%rdi,%rax,4), %rdx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	(%rdi), %eax
	addq	$4, %rdi
	leal	(%rax,%rax,4), %eax
	leal	(%r8,%rax,2), %r8d
	cmpq	%rdx, %rdi
	jne	.L3
	movl	%r8d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%r8d, %r8d
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	loop_invariant, .-loop_invariant
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Result: %d\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	$1, %edx
	xorl	%r8d, %r8d
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	movabsq	$8589934593, %rax
	leaq	20(%rsp), %rcx
	movl	$5, 16(%rsp)
	movq	%rax, (%rsp)
	movabsq	$17179869187, %rax
	movq	%rax, 8(%rsp)
	movq	%rsp, %rax
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L12:
	movl	(%rax), %edx
.L9:
	leal	(%rdx,%rdx,4), %edx
	addq	$4, %rax
	leal	(%r8,%rdx,2), %r8d
	cmpq	%rax, %rcx
	jne	.L12
	xorl	%eax, %eax
	movl	%r8d, %edx
	movl	$1, %edi
	leaq	.LC0(%rip), %rsi
	call	__printf_chk@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L13
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
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
