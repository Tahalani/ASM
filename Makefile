##
## EPITECH PROJECT, 2023
## minilibc
## File description:
## Makefile
##

SRC			=	src/strlen.asm		\
				src/strchr.asm		\
				src/strrchr.asm		\
				src/memset.asm		\
				src/memcpy.asm		\
				src/strcmp.asm		\
				src/memmove.asm		\
				src/strncmp.asm		\
				src/strstr.asm		\
				src/strpbrk.asm		\
				src/strcspn.asm		\
				src/strcasecmp.asm	\

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
