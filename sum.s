	.intel_syntax noprefix		  # Intel syntax
	.section .text			  # Text section
	.global SUM_FRAG		  # Declaring our fragment

SUM_FRAG:
	add rax, QWORD PTR [rbx]	  # Add the data at rbx to rax and store it in rax
	cmp QWORD PTR [rbx], 0		  # Compare the sum to 0
	jg POSITIVE			  # If it is greater than zero, jump to POSITIVE
	jmp NEGATIVE			  # Otherwise implicitly jump to NEGATIVE

NEGATIVE:
	mov rcx, QWORD PTR [rbx]	  # Temporarily storing pointer of rbx into rcx because we can't add two pointers
	add QWORD PTR [SUM_NEGATIVE], rcx # Moving rcx into SUM_NEGATIVE
	add rbx, 8			  # Adding 8 to the address of rbx
	ret				  # Code breakpoint

POSITIVE:
	mov rcx, QWORD PTR [rbx]	  # Temporarily storing pointer of rbx into rcx because we can't add two pointers
	add QWORD PTR [SUM_POSITIVE], rcx # Moving rcx into SUM_POSITIVE
	add rbx, 8			  # Adding 8 to the address of rbx
	ret				  # Code breakpoint

	.section .data			  # Data section
SUM_POSITIVE:	.quad 0			  # Declaring SUM_POSITIVE with initial value 0
SUM_NEGATIVE:	.quad 0			  # Declaring SUM_NEGATIVE with initial value 0

	.global SUM_POSITIVE
	.global SUM_NEGATIVE
