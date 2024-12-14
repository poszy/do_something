// Arch64 Assembly - Add Two integers

	.section .data // Data Section

result: .asciz "Result: %d\n" // Space to store the result

	.section .text // start code section
	.global _start // Main function

_start:

	mov x0, #5 // load 5 into x0 - register 0
	mov x1, #3 // load integer 3 into register 1

	add x2, x0, x1 // register 2 (x2) = x0 + x1; (5 + 3 = 8)


	// Prepare for write system call
	// print result
	mov x0, #1 // File descriptor: 1 (stdout)

	ldr x1, =result // load address of format string

	mov x3, x2 // mov result to x3

	mov x8, #64 // Syscall : write ( 64 on linux AArch64)
	svc #0 // make syscall




	// exit the program
	mov x8, #93 // Exist syscall number
	mov x0, #0 // Exit code 0
	svc #0 // make the syscall
