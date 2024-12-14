.section data

result: .asciz "Result: %d\n" // Null-terminated string to store the format for output (not directly related to the calculations)

.section .text // Start of the text section (contains the program code)
.global _start // Declare the entry point (_start) as global

_start:
	adr x0, a // Load the address of 'a' into register x0
	mov w1, #1 // Load the value 1 into the lower 32 bits of register x1 (w1)
	str w1, [x0] // Store the value in w1 (1) into the memory location pointed to by x0 (address of 'a')
	
	adr x0, b // Load the address of 'b' into register x0
	mov w1, #1 // Load the value 1 into the lower 32 bits of register x1 (w1)
	str w1, [x0] // Store the value in w1 (1) into the memory location pointed to by x0 (address of 'b')

	adr x0, b // Load the address of 'b' into register x0
	ldr w1, [x0] // Load the 32-bit value stored at the address in x0 (value of 'b') into w1
	adr x0, a // Load the address of 'a' into register x0
	ldr w0, [x0] // Load the 32-bit value stored at the address in x0 (value of 'a') into w0
	add w1, w1, w0 // Add the values in w0 and w1, storing the result in w1
	adr x0, b // Load the address of 'b' into register x0
	str w1, [x0] // Store the value in w1 (the sum of 'a' and 'b') into the memory location pointed to by x0 (address of 'b')
