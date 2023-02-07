bits 64

global my_strchr

section .text
    my_strchr:
        xor rax, rax
        jmp _loop
    _loop:
        cmp sil, BYTE [rdi]
        je exit
        inc rdi
        cmp BYTE [rdi], 0
        je exit_null
        jmp _loop
    exit:
        mov rax, rdi
        ret
    exit_null:
        mov rax, 0
        ret
