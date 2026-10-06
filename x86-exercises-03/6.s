#args:         rdi, rsi, rdx, rcx, r8, r9
#return:       rax
#caller saved: rax, rdi, rsi, rdx, rcx, r8, r9, r10, and r11;
#callee saved: rbx, rsp, rbp, r12, r13, r14, and r15;
.text
.globl sum_arr_asm


sum_arr_asm: # %rdi = *arr %rsi = n, return via %rax
    xorq %rax, %rax
    xorq %r8, %r8
.cmp:
    cmpq %r8, %rsi
    jle .end
    addq (%rdi,%r8, 8), %rax
    addq $1, %r8
    jmp .cmp
.end:
    retq
