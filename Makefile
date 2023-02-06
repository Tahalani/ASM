##
## EPITECH PROJECT, 2023
## minilibc
## File description:
## Makefile
##

SRC			=	src/my_strlen.asm	\
				src/my_strchr.asm	\
				src/my_strrchr.asm	\
				src/my_memset.asm	\

EXTENSION	=	.asm

OBJ			=	$(SRC:$(EXTENSION)=.o)

CC			=	ld

AS			=	nasm

ASFLAGS		=	-f elf64

NAME		=	libasm.so

all:	$(NAME)

$(NAME):	$(OBJ)
	$(CC) -shared -o $(NAME) $(OBJ)

%.o: %.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re:	fclean all

.PHONY: all clean fclean re
