##
## EPITECH PROJECT, 2022
## Day4
## File description:
## Day4
##

CFLAGS	=	-Wall -Wextra -Wno-deprecated -g3 -fPIC

CLIBFLAGS	=	-I./include

ASMFLAGS	=	-f elf64

SHARED	= -shared

FILES	=	strlen.asm		\
			strchr.asm		\
			strrchr.asm		\
			memset.asm 		\
			memcpy.asm		\
			strcmp.asm		\
			memmove.asm		\
			strncmp.asm		\
			strcasecmp.asm	\
			strstr.asm		\
			strpbrk.asm		\
			strcspn.asm		\


SRC = $(addprefix ./src/, $(FILES))

OBJ	=	$(SRC:.asm=.o)

NAME	=	libasm.so

all:	$(NAME)

%.o	: %.asm
		nasm $(ASMFLAGS) $<

$(NAME):	$(OBJ)
		ld $(SHARED) $(OBJ) -o $(NAME)

clean:
		rm -f $(NAME)
		rm -f *.o
		rm -f src/*.o
		rm -f a.out
		rm -f main
		rm -f test
		rm -f *.gcno
		rm -f *.gcda

fclean:	clean

re:	fclean all
