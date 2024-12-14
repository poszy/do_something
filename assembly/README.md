# Notes For GDB
### Compile cpp code 

#### $ gcc ArithmeticProjectC.cpp -o ArithmeticProjectC 

### Debugging with gdb - gnu debugger
- gdb ./ArithmeticProjectC 

- (gdb) break main
- (gdb) disass main # will dump the contents of the program in assembly
Dump of assembler code for function main:
   0x0000000000001119 <+0>:     push   %rbp
   0x000000000000111a <+1>:     mov    %rsp,%rbp
   0x000000000000111d <+4>:     mov    %edi,-0x4(%rbp)
   0x0000000000001120 <+7>:     mov    %rsi,-0x10(%rbp)
   0x0000000000001124 <+11>:    movl   $0x1,0x2ee6(%rip)        # 0x4014 <a>
   0x000000000000112e <+21>:    movl   $0x1,0x2ee0(%rip)        # 0x4018 <b>
   0x0000000000001138 <+31>:    mov    0x2eda(%rip),%edx        # 0x4018 <b>
   0x000000000000113e <+37>:    mov    0x2ed0(%rip),%eax        # 0x4014 <a>
   0x0000000000001144 <+43>:    add    %edx,%eax
   0x0000000000001146 <+45>:    mov    %eax,0x2ecc(%rip)        # 0x4018 <b>
   0x000000000000114c <+51>:    mov    0x2ec2(%rip),%eax        # 0x4014 <a>
   0x0000000000001152 <+57>:    add    $0x1,%eax
   0x0000000000001155 <+60>:    mov    %eax,0x2eb9(%rip)        # 0x4014 <a>
   0x000000000000115b <+66>:    mov    0x2eb7(%rip),%edx        # 0x4018 <b>
   0x0000000000001161 <+72>:    mov    0x2ead(%rip),%eax        # 0x4014 <a>
   0x0000000000001167 <+78>:    imul   %edx,%eax
   0x000000000000116a <+81>:    mov    %eax,0x2ea8(%rip)        # 0x4018 <b>
   0x0000000000001170 <+87>:    mov    $0x0,%eax
   0x0000000000001175 <+92>:    pop    %rbp
   0x0000000000001176 <+93>:    ret
End of assembler dump.

