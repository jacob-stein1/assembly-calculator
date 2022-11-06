	.intel_syntax noprefix	 # Intel syntax
	.section .text		 # Text section
	.global AND_FRAG	 # Declaring our fragment
AND_FRAG:
	and rax, QWORD PTR [rbx] # Performing bitwise and on the data stored at rbx, and rax
	add rbx, 8		 # Add 8 to the address of rbx
	ret			 # Code breakpoint
