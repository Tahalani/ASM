bits 64

global strlen

section .text
    strlen:
        xor rcx, rcx
        jmp _loop
    _loop:
        cmp BYTE [rdi+rcx], 0
        je _exit
        inc rcx
        jmp _loop
    _exit:
        mov rax, 60
        ret
