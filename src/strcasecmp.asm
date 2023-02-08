bits 64

global strcasecmp

section .text
    strcasecmp:
        mov r10b, 0
        mov r11b, 0
        mov r11b, byte [rdi]
        mov r10b, byte [rsi]
        jmp _loop
    _loop:
        cmp r11b, 91 ; On compare le caractère de la première string pour check si c'est une majuscule
        jl _check_lower ; Si le caractère est inférieur à 91 -> call le label _check_lower
        jmp _check_next_character ; Sinon on check le prochain caractère
    _check_lower:
        cmp r11b, 64 ; On compare le caractère de la première string pour check si c'est une majuscule
        jl _check_next_character ; Si le caractère est inférieur à 64 -> call le label _check_next_character
        add r11b, 32 ; Sinon on ajoute 32 au caractère
        jmp _check_next_character ; On check le prochain caractère
    _check_next_character:
        cmp r10b, 91 ; On compare le caractère de la deuxième string pour check si c'est une majuscule
        jl _lower_next_character ; Si le caractère est inférieur à 91 -> call le label _lower_next_character
        jmp _check_if_same_character ; Sinon on check le prochain caractère
    _lower_next_character:
        cmp r10b, 64 ; On compare le caractère de la deuxième string pour check si c'est une majuscule
        jl _check_if_same_character ; Si le caractère est inférieur à 64 -> call le label _check_if_same_character
        add r10b, 32 ; Sinon on ajoute 32 au caractère
        jmp _check_if_same_character ; On check le prochain caractère
    _check_if_same_character:
        cmp r11b, r10b ; On compare les deux caractères
        jne _exit ; Si les caractères ne sont pas identiques -> call le label _exit
        je _function_same ; Si les caractères sont identiques -> call le label _function_same
    _function_same:
        cmp r10b, 0 ; Si le caractère est 0
        je _exit ; Si la deuxieme string arrive à sa fin -> call le label _exit
        inc rdi ; Sinon on incrémente les deux pointeurs (rdi et rsi)
        inc rsi ; Sinon on incrémente les deux pointeurs (rdi et rsi)
        jmp strcasecmp ; rappelle le label strcasecmp tant que on est pas arriver a la fin de la string
    _exit:
        sub r11b, r10b ; On soustrait les deux caractères
        movsx rax, r11b ; On met le résultat dans rax
        ret ; On retourne le résultat
