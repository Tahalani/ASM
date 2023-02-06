bits 64

global strchr

section .text
    strchr:
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
