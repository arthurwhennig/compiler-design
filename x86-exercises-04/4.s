#args:         rdi, rsi, rdx, rcx, r8, r9
#return:       rax
#caller saved: rax, rdi, rsi, rdx, rcx, r8, r9, r10, and r11;
#callee saved: rbx, rsp, rbp, r12, r13, r14, and r15;
.text
.globl ackermann_asm

ackermann_asm:
    cmpq $0, %rdi
    je .BC
    cmpq $0, %rsi
    je .R
    subq $1, %rsi
    pushq %rdi
    call ackermann_asm
    popq %rdi
    subq $1, %rdi
    movq %rax, %rsi
    jmp ackermann_asm
.BC:
    movq %rsi, %rax
    incq %rax
    retq
.R:
    decq %rdi
    movq $1, %rsi
    jmp ackermann_asm
