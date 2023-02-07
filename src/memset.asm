bits 64

global memset

section .text
    memset:
        xor rcx, rcx
        jmp _loop
    _loop:
        cmp rcx, rdx
        je _exit
        mov [rdi + rcx], sil
        inc rcx
        jmp _loop
    _exit:
        mov rax, rdi
        ret
