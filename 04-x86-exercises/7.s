#args:         rdi, rsi, rdx, rcx, r8, r9
#return:       rax
#caller saved: rax, rdi, rsi, rdx, rcx, r8, r9, r10, and r11;
#callee saved: rbx, rsp, rbp, r12, r13, r14, and r15;
.text
.globl	reverse_array

reverse_array:
    movq %rdi, %r8
    leaq (%rdi, %rsi, 8), %r9
    subq $8, %r9
.CMP:
    cmpq %r8, %r9
    jle .END
    movq (%r8), %rdi
    movq (%r9), %rsi
    movq %rdi, (%r9)
    movq %rsi, (%r8)
    addq $8, %r8
    subq $8, %r9
    jmp .CMP
.END:
    retq
