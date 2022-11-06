	.intel_syntax noprefix  # Intel syntax
	.section .text		# Text section
	.global OR_FRAG		# Declaring our fragment
OR_FRAG:
	or rax, QWORD PTR [rbx] # Performing btiwise or on the data stored at rbx, and rax
	add rbx, 8		# Add 8 to the address of rbx
	ret			# Code breakpoint
