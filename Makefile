
#
# UFRGS - Compiladores B - Marcelo Johann - 2009/2 - Etapa 1
#
# Makefile for single compiler call
# All source files must be included from code embedded in scanner.l
# In our case, you probably need #include "hash.c" at the beginning
# and #include "main.c" in the last part of the scanner.l
#

etapa1: lex.yy.c
	gcc --std=c99 -o etapa1 lex.yy.c

lex.yy.c: scanner.l hash.c hash.h
	lex scanner.l 

clean:
	rm *.yy.c etapa1
