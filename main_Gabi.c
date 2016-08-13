int main(){
	int identifier = -1;
	while(isRunning()){
		identifier = yylex();
		switch(identifier){							
			case KW_INT: 		
						printf("int ");
				 		break;
			case KW_FLOAT:		
						printf("float ");
						break;
			case KW_BOOL: 		
						printf("bool ");
						break;
			case KW_CHAR: 
						printf("char ");
						break;								
			case KW_IF: 
						printf("if ");
						break;
			case KW_THEN: 
						printf("then ");
						break;
			case TK_IDENTIFIER: 
						printf("var %s", yytext);
						break;
			case KW_CHAR: 
						printf("char ");
						break;								
			case KW_IF: 
						printf("if ");
						break;
			case KW_THEN: 
						printf("else ");
						break;
			case TK_IDENTIFIER: 
						printf("var %s", yytext);
						break;							
			case KW_CHAR: 
						printf("char ");
						break;								
			case KW_IF: 
						printf("if ");
						break;
			case KW_THEN: 
						printf("else ");
						break;
			case TK_IDENTIFIER: 
						printf("var %s", yytext);
						break;
		}
	}
}