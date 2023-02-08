bits 64

global strcspn

section .text
    strcspn:
        xor rcx, rcx ; index pour parcourir la deuxième string
        mov rdx, 0 ; compteur qu'on returnera à la fin
    _loop:
        mov r8b, BYTE [rdi] ; On met rdi dans un registre afin de l'utiliser dans la comparaison en dessous
        cmp BYTE [rdi], 0 ; Si la première string arrive a sa fin
        je _exit ; Cette ligne sert à rappeller le label _exit_empty
        cmp BYTE [rsi + rcx], 0 ; Si la deuxième string arrive a sa fin
        je _reset_rdi_and_rsi ; Cette ligne sert à rappeller le label _reset_rdi_and_rsi
        cmp r8b, BYTE [rsi + rcx] ; Compare les characteres des 2 strings données
        je _exit ; Si les 2 caracteres sont identiques, alors le label _exit est appelé qui permet d'arreter la function en retournant la valeur demandée
        inc rcx ; incrementation du compteur qui permet de parcourir la deuxième string
        jmp _loop ; Cette ligne sert à rappeller le label _loop
    _reset_rdi_and_rsi:
        inc rdx ; incremente le compteur à chaque fois qu'on bouge dans la première string
        mov rcx, 0 ; Remet le compteur de la deuxième string à 0
        inc rdi ; Incrementation de la premiere string ce qui permet d'aller au caractère d'après
        jmp _loop ; Cette ligne sert à rappeller le label _loop
    _exit:
        mov rax, rdx ; Return 0 car pas de meme caractère trouvé entre les 2 différentes strings
        ret ; return pour quitter la fonction
