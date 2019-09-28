	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	movl	%edi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	leaq	L_.str(%rip), %rdi
	xorl	%ecx, %ecx
	movb	%cl, %dl
	leaq	-28(%rbp), %rsi
	movb	%dl, %al
	callq	_scanf
	movl	-28(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rsp, %rdi
	movq	%rdi, -40(%rbp)
	leaq	15(,%rsi,4), %rdi
	andq	$-16, %rdi
	movq	%rsp, %r8
	subq	%rdi, %r8
	movq	%r8, %rsp
	movq	%rsi, -48(%rbp)
	movl	$0, -52(%rbp)
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	movq	%r8, -72(%rbp)          ## 8-byte Spill
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	movl	-52(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movslq	-52(%rbp), %rax
	shlq	$2, %rax
	movq	-72(%rbp), %rcx         ## 8-byte Reload
	addq	%rax, %rcx
	leaq	L_.str(%rip), %rdi
	movq	%rcx, %rsi
	movb	$0, %al
	callq	_scanf
	movl	%eax, -76(%rbp)         ## 4-byte Spill
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	-52(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -52(%rbp)
	jmp	LBB0_1
LBB0_4:
	movl	-28(%rbp), %esi
	movq	-72(%rbp), %rdi         ## 8-byte Reload
	callq	_bubblesort
	movl	%eax, -56(%rbp)
	movl	-56(%rbp), %esi
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -12(%rbp)
	movq	-40(%rbp), %rdi
	movq	%rdi, %rsp
	movl	-12(%rbp), %esi
	movq	___stack_chk_guard@GOTPCREL(%rip), %rdi
	movq	(%rdi), %rdi
	movq	-8(%rbp), %rcx
	cmpq	%rcx, %rdi
	movl	%eax, -80(%rbp)         ## 4-byte Spill
	movl	%esi, -84(%rbp)         ## 4-byte Spill
	jne	LBB0_6
## %bb.5:
	movl	-84(%rbp), %eax         ## 4-byte Reload
	movq	%rbp, %rsp
	popq	%rbp
	retq
LBB0_6:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.globl	_bubblesort             ## -- Begin function bubblesort
	.p2align	4, 0x90
_bubblesort:                            ## @bubblesort
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$0, -20(%rbp)
LBB1_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
	movl	-20(%rbp), %eax
	cmpl	-12(%rbp), %eax
	jge	LBB1_10
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	movl	$0, -24(%rbp)
LBB1_3:                                 ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-24(%rbp), %eax
	movl	-12(%rbp), %ecx
	subl	-20(%rbp), %ecx
	subl	$1, %ecx
	cmpl	%ecx, %eax
	jge	LBB1_8
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %esi
	addl	$1, %esi
	movslq	%esi, %rcx
	cmpl	(%rax,%rcx,4), %edx
	jle	LBB1_6
## %bb.5:                               ##   in Loop: Header=BB1_3 Depth=2
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movl	%edx, -28(%rbp)
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %edx
	addl	$1, %edx
	movslq	%edx, %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	-24(%rbp), %esi
	addl	$1, %esi
	movslq	%esi, %rcx
	movl	%edx, (%rax,%rcx,4)
	movl	-16(%rbp), %edx
	addl	$1, %edx
	movl	%edx, -16(%rbp)
LBB1_6:                                 ##   in Loop: Header=BB1_3 Depth=2
	jmp	LBB1_7
LBB1_7:                                 ##   in Loop: Header=BB1_3 Depth=2
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	LBB1_3
LBB1_8:                                 ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_9
LBB1_9:                                 ##   in Loop: Header=BB1_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	LBB1_1
LBB1_10:
	movl	-16(%rbp), %eax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d"

L_.str.1:                               ## @.str.1
	.asciz	"%d\n"


.subsections_via_symbols
