bits 64

global memfrob

section .text
    memfrob:
        xor rcx, rcx
    _loop:
        cmp rcx, rsi
        je _exit
        xor BYTE [rdi + rcx], 42
        inc rcx
        jmp _loop
    _exit:
        mov rax, rdi
        ret
