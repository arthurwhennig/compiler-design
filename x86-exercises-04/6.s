#args:         rdi, rsi, rdx, rcx, r8, r9
#return:       rax
#caller saved: rax, rdi, rsi, rdx, rcx, r8, r9, r10, and r11;
#callee saved: rbx, rsp, rbp, r12, r13, r14, and r15;
.text
.globl return_S1_asm

return_S1_asm:
    movq $1, %rax
    movq $2, %rdx
    retq

.globl return_S2_asm

return_S2_asm:
    movq $3, (%rdi)
    movq $4, 8(%rdi)
    movq $5, 16(%rdi)
    movq %rdi, %rax
    retq

.globl return_S2_c_via_call_asm

return_S2_c_via_call_asm:
    subq $24, %rsp
    movq %rsp, %rdi
    call return_S2_asm
    movq 16(%rax), %rax
    addq $24, %rsp
    retq
