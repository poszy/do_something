adr x0, a // load the address "a" into x0
mov w3, #1// set the temporary register to 1
str w3, [x0] // use x0 as a pointer and store 1 at the memory address in x0
