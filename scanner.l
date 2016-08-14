%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tokens.h"
#include "hash.c"

int running = 1;
int lines = 0;
char *yylval;

int isRunning(void);
int getLineNumber(void);
%}


%x COMENTARIO
%x STRING
%%
int					{return KW_INT;}
float 			    {return KW_FLOAT;}
bool 				{return KW_BOOL;}
char     			{return KW_CHAR;}
if					{return KW_IF;}
then 				{return KW_THEN;}
else				{return KW_ELSE;}
for 				{return KW_FOR;}
read 				{return KW_READ;}
return 				{return KW_RETURN;}
print 				{return KW_PRINT;}
TRUE 				{return LIT_TRUE;}
FALSE 				{return LIT_FALSE;}
"<="				{return OPERATOR_LE;}
">="				{return OPERATOR_GE;}
"=="				{return OPERATOR_EQ;}	
"!="				{return OPERATOR_NE;}
"&&"				{return OPERATOR_AND;}
"||"				{return OPERATOR_OR;}					



[A-Za-z_][A-Za-z_0-9]*		{addHash(yytext, TK_IDENTIFIER);return TK_IDENTIFIER;}
[0-9]*				{addHash(yytext, LIT_INTEGER);return LIT_INTEGER;}
\'\'				{addHash(yytext, LIT_CHAR);return LIT_CHAR;} 
[,;:\(\)\[\]\{\}+\-*/<>=!&$]   	{return yytext[0];}	
[ \t\f\v]				
\n 				{lines++;}
"//".*				
"/*"				{BEGIN(COMENTARIO);}

\"[^"\n]*["\n] {
               yylval = strdup(yytext+1);
               if (yylval[yyleng-2] != '"')
                   return TOKEN_ERROR;
               else
                   yylval[yyleng-2] = 0;
               addHash(yylval, LIT_STRING);
               return LIT_STRING;
}
.				{return TOKEN_ERROR;}

<COMENTARIO>"*/"	{BEGIN(INITIAL);}
<COMENTARIO>\n 		{lines++;} 




%%
#include "main.c"

int yywrap(){
	running = 0;
	return 1;
}

int isRunning(void){
	return running;
}

int getLineNumber(void){
	return lines;
}


