#args:         rdi, rsi, rdx, rcx, r8, r9
#return:       rax
#caller saved: rax, rdi, rsi, rdx, rcx, r8, r9, r10, and r11;
#callee saved: rbx, rsp, rbp, r12, r13, r14, and r15;
.text
.globl sum_asm


sum_asm: # %rdi = n, return via %rax
    xorq %rax, %rax
    xorq %rsi, %rsi
.cmp:
    cmpq %rsi, %rdi
    jle .end
    addq %rsi, %rax
    addq $1, %rsi
    jmp .cmp
.end:
    retq
