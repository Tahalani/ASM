bits 64

global my_ffs

section .text
    my_ffs:
        cmp rdi, 0
        je _exit_null
        jne exit
    exit:
        bsf r8, rdi
        add r8, 1
        mov rax, r8
        ret
    _exit_null:
        mov rax, 0
        ret
