#include "tokens.h"
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


"<="				{return OPERATOR_LE;}
">="				{return OPERATOR_GE;}
"=="				{return OPERATOR_EQ;}	
"!="				{return OPERATOR_NE;}
"&&"				{return operator_AND;}
"||"				{return OPERATOR_OR;}					


[A-Za-z_][A-Za-z_9-0]*	{return TK_IDENTIFIER;}
[0-9]*					{return LIT_INTEGER;}
TRUE 					{return LIT_TRUE;}
FALSE 					{return LIT_FALSE;}
[A-Za-z]				{return LIT_CHAR;} Não sei se está correto :(

	
\n 					{lines++;}
"//".*				
"/*"				{BEGIN(COMENTARIO);}


<COMENTARIO>"*/"	{BEGIN(INITIAL);}
<COMENTARIO>\n 		{lines++;} 

#define LIT_STRING    286

#define TOKEN_ERROR   290





%%

