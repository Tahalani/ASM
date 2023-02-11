global strncmp

section .text
    strncmp:
        xor rcx, rcx
    _loop:
        mov r8b, BYTE [rdi+rcx]
        mov r9b, BYTE [rsi+rcx]
        cmp rdx, 0
        je _exit_false
        cmp r8b, r9b
        jne _exit_true
        cmp r8b, 0
        je _exit_false
        inc rcx
        sub rdx, 1
        jmp _loop
    _exit_true:
        sub r8b, r9b
        movsx rax, r8b
        ret
    _exit_false:
        mov rax, 0
        ret
