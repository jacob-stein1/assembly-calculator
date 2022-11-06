	.intel_syntax noprefix		# Clarifies assembly language
	.section .data			# Prepares for variable initialization
POSITIVE:	 .quad 0		# Store the value of SUM POSITIVE
NEGATIVE:	 .quad 0		# Store the value of SUM NEGATIVE
FINAL_VAL:	.quad 0			# To store the final rax value
	.section .text
	.global _start

_start:
	xor rax, rax			# Zeroing rax
	xor rbx, rbx			# Zeroing rcx
	xor rcx, rcx			# Zeroing rdx
	mov rbx, OFFSET [CALC_DATA_BEGIN] # Storing the address of the data into rcx

READ_DATA:
	mov cl, BYTE PTR [rbx] 		# Stores value of byte at rdx into cl
	cmp rcx, 0			# Compares rcx to 0
	jz OUTPUT			# If there is no more output, jump to the end

JUMP_AND:
	cmp cl, '&'			# Checks if the next command is AND
	jne JUMP_OR			# If it isn't we move to check if its OR
	add rbx, 8			# If it is, we add 8 to move to the next instruction
	call AND_FRAG			# We then call AND from and.s
	jmp READ_DATA			# Move back to the iterator

JUMP_OR:
	cmp cl, '|'			# Checks if the next command is OR
	jne JUMP_SUM			# If it isn't, we move to check if its SUM
	add rbx, 8			# If it is, we add 8 to move to the next instruction
	call OR_FRAG			# We then call OR from or.s
	jmp READ_DATA			# Move back to the iterator

JUMP_SUM:
	cmp cl, 'S'			# Check if the next command is SUM
	jne JUMP_UPPER			# If it isn't, we move to check if its UPPER
	add rbx, 8			# If it is, we add 8 to move to the next instruction
	call SUM_FRAG			# We then call SUM from sum.s
	jmp READ_DATA			# Move back to the iterator

JUMP_UPPER:
	cmp cl, 'U'			# Check if the next command is UPPER
	jne OUTPUT			# If it isn't, we have an invalid input, so we jump to the output
	add rbx, 8			# If it is, we add 8 to move to the next instruction
	call UPPER_FRAG			# We then call UPPER from upper.s
	jmp READ_DATA			# Move back to the iterator

OUTPUT:
	mov FINAL_VAL, rax		# Store the value of rax in FINAL_VAL so we can use rax
	mov rax, 1			# Syscall
	mov rdi, 1			# Indicates we want to print to standard output
	mov rsi, OFFSET FINAL_VAL	# Moves value to print to rsi
	mov rdx, 8			# Indicates we want to print 8 bytes
	syscall				# Print

	mov rax, QWORD PTR [SUM_POSITIVE] # Moves the pointer for SUM POSITIVE into rax
	mov POSITIVE, rax		  # Moves value of rax into POSITIVE
	mov rsi, OFFSET POSITIVE	  # Moves address of positive into rsi
	mov rax, 1			  # Syscall
	syscall				  # Print

	mov rax, QWORD PTR [SUM_NEGATIVE] # This segment follows same logic as with SUM POSITIVE
	mov NEGATIVE, rax
	mov rsi, OFFSET NEGATIVE
	mov rax, 1
	syscall

	xor rdi, rdi			  # Zeroing rdi to be used to print calc data

CALC_DATA:
	mov rax, rdi					# Moves rdi into rax
	mov rdx, 1					# Print 1 byte at a time
	add rax, OFFSET [CALC_DATA_BEGIN]		# Moves starting point into rax
	cmp rax, OFFSET [CALC_DATA_END]			# Compares starting and endpoint
	je FINISH					# If they are equal, move to exit

	mov rax, QWORD PTR [CALC_DATA_BEGIN + rdi]	# Gets byte to be printed
	mov FINAL_VAL, rax				# Moves it into FINAL_VAL which has already been printed
	mov rsi, OFFSET FINAL_VAL			# Moves the value into rsi
	mov rax, 1					# Syscall
	push rdi					# Saves loop counter
	mov rdi, 1					# Print to standard output
	syscall						# Print
	
	pop rdi						# Returns loop counter
	inc rdi						# Increments loop counter
	jmp CALC_DATA					# Restarts the loop
	
FINISH:
	mov rax, 60					# Exit syscall
	syscall
