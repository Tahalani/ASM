bits 64

global strrchr

section .text
    strrchr:
        xor rax, rax
        xor r12, r12
        jmp _loop
    _loop:
        cmp sil, BYTE [rdi]
        jne _not_equal
        mov r12, rdi
    _not_equal:
        inc rdi
        cmp BYTE [rdi], 0
        je exit
        jmp _loop
    exit:
        mov rax, r12
        ret
