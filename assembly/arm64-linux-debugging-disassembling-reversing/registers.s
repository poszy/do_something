	// a little more about registers

	// load the address of the first available space in memory into register 0
	adr x0, a // a is a label or alias for the address in memory, the first available space of memory, such as x1000

	// load the integer 1 into register x1 
	mov w1, #1 // w1 is the lower 32 bit part of the 64 bit register x1, the w1 is the alias for register x1
	// the upper 32 bits are usually reserved for arithmetic operations
	
	// store the value of w1 into the first memory address via pointer in x0. which was loaded by a
	str w1, [x0]

	// steps to arm64,
	// first load the memory addresses into registers,
	// do operations, store values from those operations via references or poitners stored in registers

	// Using these alias was confusing to me knowing a bit about MIPS assembly from uni. from what I recall I can load values in upper or lower register bounds, using other instructions. this can also be done in arm
	movz x1, #1 // instead of moving with W1 wich is just an alias that means use the lower 32 bits,
	// I cant write this. (move with zero) moves an immediate value into the lower half of the 64-bit register (x1) and zeros the upper 32 bits.

	// this is the same thing as
	mov x1, #1       ; Move 1 into the full 64-bit register
        and x1, x1, #0xFFFFFFFF ; Mask out the upper 32 bits
	// I think this writes all zeros except the last bit, because there is a 1, so since there is already a 1, it leaves it.
	//	x1 (before):  00000000000000010000000000000001
	//	Mask:         00000000000000001111111111111111
	// 	Result:       00000000000000000000000000000001
