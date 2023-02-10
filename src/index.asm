bits 64

global index

section .text
    index:
        xor rax, rax
        jmp _loop
    _loop:
        cmp sil, BYTE [rdi]
        je exit
        cmp BYTE [rdi], 0
        je exit_null
        inc rdi
        jmp _loop
    exit:
        mov rax, rdi
        ret
    exit_null:
        mov rax, 0
        ret