.section data

result: .asciz "Result: %d\n" // Null-terminated string to store the format for output (not directly related to the calculations)

.section .text // Start of the text section (contains the program code)
.global _start // Declare the entry point (_start) as global

_start:
	adr x0, b
	ldr w1, [x0]
	adr x0, a
	ldr w0, [x0]
	mul w1, w1, w0
	adr x0, b
	str w1, [x0]
