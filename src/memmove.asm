bits 64

global memmove

section .text
    memmove:
        xor rcx, rcx ; initialiser le compteur à 0
        cmp rsi, rdi ; comparer la taille de la première string avec rdx
        jle _if_start_end ; si rdx est plus grand ou égal à r9, aller à _start_end
        jg _memcpy ; si rdx est plus petit que r9, aller à _memcpy
    _if_start_end:
        dec rdx
        jmp _start_end
    _start_end:
        cmp rdx, -1 ; comparer la taille de la deuxième string avec rdx
        je exit
        mov r9b, [rsi + rdx] ; mettre le caractère de la deuxième string à la position rdx dans r9b
        mov [rdi + rdx], r9b ; mettre le caractère de la deuxième string à la position rdx dans la première string
        dec rdx ; décrémenter la taille de s2
        jmp _start_end
    _memcpy:
        cmp rdx, rcx ; comparer la taille de la deuxième string avec rdx
        je exit ; si rdx est plus petit ou égal à rcx, aller à exit
        mov r9b, [rsi + rcx] ; mettre le caractère de la deuxième string à la position rcx dans r9b
        mov [rdi + rcx], r9b ; mettre le caractère de la deuxième string à la position rcx dans la première string
        inc rcx ; incrémenter le compteur
        jmp _memcpy ; retourner au début de la boucle
    exit:
        mov rax, rdi ; mettre rdi dans rax
        ret
