bits 64

global strrchr
global rindex

section .text
    rindex:
    strrchr:
        xor rax, rax
        xor r12, r12 ; initialisation d'une variable stockant le ptr
        jmp _loop
    _loop:
        cmp sil, BYTE [rdi] ; Si le caractère est égal à celui recherché
        jne _not_equal
        mov r12, rdi ; On stocke le ptr
    _not_equal:
        cmp BYTE [rdi], 0 ; Si on est à la fin de la chaîne
        je exit
        inc rdi ; On avance dans la string
        jmp _loop
    exit:
        mov rax, r12 ; On retourne le ptr qui est stocké dans r12
        ret
