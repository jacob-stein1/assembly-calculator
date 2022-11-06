	.intel_syntax noprefix
	.section .text
	.global UPPER_FRAG

UPPER_FRAG:
	mov r8, QWORD PTR [rbx]			# Moves string rbx is pointing to into r8

ITERATE:					# Function to iterate across characters	
	cmp BYTE PTR [r8], 0			# If the leading character is 0, move to the end
	je FINISH				# Jump to the end
	cmp BYTE PTR [r8], 97			# If character is outside ASCII lower bound its already capital so we can jump to the next
	jl INCREMENT				# Jump to increment
	cmp BYTE PTR [r8], 122			# If character is outside the upper bound, we can also jump to increment
	jg INCREMENT				# Jump to increment
	jmp UPPIFY				# If we get here, the character is within the ASCII lowercase range and we must uppify it

UPPIFY:
	sub BYTE PTR [r8], 32			# Subtracting 32 converts to uppercase ASCII value
	jmp INCREMENT				# Move to the next byte

INCREMENT:
	add r8, 1				# Move to the next byte in rsp
	add rax, 1				# Increment string length in rax
	jmp ITERATE				# Jump to the loop

FINISH:
	add rbx, 8				# Move to next command in rbx
	ret					# Return
