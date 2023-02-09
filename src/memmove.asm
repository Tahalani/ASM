bits 64

global memmove

section .text
    memmove:
        xor rcx, rcx
        mov r8b, 0
        jmp _loop
    _loop:
        cmp rcx, rdx
        je _exit
        mov r8b, BYTE [rsi + rcx]
        mov [rdi + rcx], r8b
        inc rcx
        jmp _loop
    _exit:
        mov rax, rdi
        ret
