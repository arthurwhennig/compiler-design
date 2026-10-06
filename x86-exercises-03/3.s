#args:         rdi, rsi, rdx, rcx, r8, r9
#return:       rax
#caller saved: rax, rdi, rsi, rdx, rcx, r8, r9, r10, and r11;
#callee saved: rbx, rsp, rbp, r12, r13, r14, and r15;
.text
.globl sign_asm


sign_asm: # %rdi = a, return via %rax
    xorq %rax, %rax     # set rax to 0
    cmpq %rax, %rdi
    jg .G
    jl .L
    retq
.G:
    movq $1, %rax
    retq
.L:
    movq $-1, %rax
    retq
