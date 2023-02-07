global strncmp

section .text
    strncmp:
        xor rcx, rcx
        mov r8b, 0
        mov r9b, 0
        jmp _loop
    _loop:
        mov r8b, BYTE [rdi+rcx]
        mov r9b, BYTE [rsi+rcx]
        cmp BYTE [rdi+rcx], 0
        je _exit_true
        cmp rcx, rdx
        je _exit_true
        cmp r8b, r9b
        jne _exit_false
        inc rcx
        jmp _loop
    _exit_true:
    	sub r8b, r9b
        movsx rax, r8b
	    ret
    _exit_false:
        sub r8b, r9b
        movsx rax, r8b
	    ret
