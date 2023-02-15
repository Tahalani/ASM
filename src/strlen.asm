bits 64

global strlen

section .text
    strlen:
        xor rcx, rcx ; initialise un compteur à 0
        jmp _loop
    _loop:
        cmp BYTE [rdi+rcx], 0 ; La condition d'arret de la boucle
        je _exit
        inc rcx ; Incrementation du compteur a chaque tour de boucle
        jmp _loop
    _exit:
        mov rax, rcx
        ret
