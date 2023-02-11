bits 64

global my_strstr

section .text
    my_strstr:
        xor rcx, rcx ; compteur pour la deuxieme string
        mov r8, rdi ; compteur pour la premiere string
        mov r9, rdi ; Met le pointeur sur la première lettre de la string recherchée
        mov r10b, 0 ; Met 0 dans un registre pour pouvoir le comparer avec les characteres
        mov r11b, 0 ; Met 0 dans un registre pour pouvoir le comparer avec les characteres
    _loop:
        cmp BYTE [rdi], 0 ; Si la premiere string arrive a sa fin
        je _exit_not_exist ; quitte la fonction
        cmp BYTE [r8], 0 ; Si la premiere string arrive a sa fin
        je exit ; quitte la fonction
        cmp BYTE [rsi + rcx], 0 ; Si la premiere string arrive a sa fin
        je exit ; quitte la fonction
        mov r11b, BYTE [r8] ; On les met dans des registres afin de les utiliser dans la comparaison en dessous
        mov r10b, BYTE [rsi + rcx] ; On les met dans des registres afin de les utiliser dans la comparaison en dessous
        cmp r10b, r11b ; Compare les characteres des 2 strings données
        je _equal ; Si la comparaison est bonne -> call le label _equal
        jne _not_equal ; Si la comparaison est mauvaise -> call le label not_equal
    _equal:
        inc rcx ; incremente rcx qui est le compteur permettant de se deplacer dans la première string
        inc r8 ; incremente r9 qui est le compteur permettant de se deplacer dans la deuxième string
        cmp BYTE [rsi + rcx], 0 ; Si la premiere string arrive a sa fin
        je exit ; quitte la fonction
        mov r11b, BYTE [r8] ; On les met dans des registres afin de les utiliser dans la comparaison en dessous
        mov r10b, BYTE [rsi + rcx] ; On les met dans des registres afin de les utiliser dans la comparaison en dessous
        cmp r10b, r11b ; Comparer les characteres
        je _check_next_char ; Check les prochains characteres
    _not_equal:
        mov r9, r8 ; Met le pointeur sur la première lettre de la string recherchée
        inc r8 ; incremente r9 qui est le compteur permettant de se deplacer dans la deuxième string
        cmp BYTE [r8], 0 ; Si la premiere string arrive a sa fin
        je _exit_not_exist ; quitte la fonction
        inc r9 ; incremente r9 qui est le compteur permettant de se deplacer dans la deuxième string
        mov rcx, 0 ; remet l'index de la deuxieme string à 0
        jmp _loop ; rappelle le label _loop tant que on est pas arriver a la fin de la string
    _check_next_char:
        cmp BYTE [r8], 0 ; Si la premiere string arrive a sa fin
        je exit ; quitte la fonction
        mov r11b, BYTE [r8] ; On les met dans des registres afin de les utiliser dans la comparaison en dessous
        mov r10b, BYTE [rsi + rcx] ; On les met dans des registres afin de les utiliser dans la comparaison en dessous
        cmp r10b, r11b ; Compare les characteres des 2 strings données
        je _equal ; Si la comparaison est bonne -> call le label _equal
        jne _not_equal ; Si la comparaison est mauvaise -> call le label not_equal
    exit:
        mov rax, r9 ; Met r9 dans rax afin de la return
        ret ; return pour finir la fonction
    _exit_not_exist:
        mov rax, 0 ; Met r8 dans rax afin de la return
        ret ; return pour finir la fonction
