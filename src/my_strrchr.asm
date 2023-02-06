bits 64

global strrchr

section .text
    strrchr:
        xor rax, rax
    _loop:
        cmp sil, BYTE [rdi]
        je exit
        inc rdi
        cmp BYTE [rdi], 0
        je exit
        jmp _loop
    exit:
        mov rax, rdi
        ret
