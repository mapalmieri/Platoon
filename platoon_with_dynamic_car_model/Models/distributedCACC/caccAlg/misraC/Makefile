
NAME = main.exe
CC = gcc
CFLAGS = -Wall -O2 -Werror -Wmissing-noreturn -Wpacked -Wunreachable-code
LDFLAGS= -lm
DEBUG = -Wall -O2 -Werror -Wmissing-noreturn -Wpacked -Wunreachable-code -D DEBUG
HEAD = DomenicoV_caccAlg.h
SOURCES = DomenicoV_caccAlg.c main.c
OBJ = $(SOURCES:.c=.o)
DEBUGFILES = main.dSYM

.PHONY : clean help

%.o: %.c $(HEAD)
	@$(CC) $(CFLAGS) -c $< -o $@

build: $(NAME)

debug:$(OBJ)
	@$(CC) $(DEBUG) -g $(SOURCES) -o $(NAME) $(LDFLAGS)
	-@rm -r main.o
	@echo " "
	@echo "\033[1m$(OBJ)\033[0m compiled successfully in debug mode"
	@echo "You can execute ./main.exe for testing the generated code."

$(NAME): $(OBJ)
	@$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	-@rm -r main.o
	@echo " "
	@echo "\033[1m$(OBJ)\033[0m compiled successfully!"
	@echo "You can execute ./main.exe for testing the generated code."

clean:
	-@rm -f -r ./*.o $(NAME) $(DEBUGFILES)
	@echo $(OBJ) "removed successfully!"

help:
	@echo
	@echo "Makefile"
	@echo
	@echo "make/make build  : build all"
	@echo "debug            : enable and compile in debug mode"
	@echo "clean            : remove all .o files and executable file"
	@echo "NAME=yourname    : change program name, default is: 'main' "
	@echo
	@echo  "-------------------------------------------------------------"
	@echo  "  Makefile generated using PVSio-web MisraCPrinter ver 2.0"
	@echo  "  Tool freely available at http:##www.pvsioweb.org"
	@echo  "-------------------------------------------------------------"
	@echo


