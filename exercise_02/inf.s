# inf.s
.text
.globl infinite
infinite:
    leaq -7(%rip), %rax
    pushq %rax
    ret
