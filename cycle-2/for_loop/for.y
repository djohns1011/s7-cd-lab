%{
    #include <stdio.h>
    int valid = 1;

    int yyerror();
    int yylex(void);
%}

%token FOR PARANTHESIS OPERAND OPERATOR COMMA SEMICOLON NEWLINE

%%

start : FOR PARANTHESIS A A B PARANTHESIS NEWLINE
A : OPERAND OPERATOR OPERAND SEMICOLON | OPERAND OPERATOR OPERAND COMMA A | SEMICOLON;
B : OPERAND OPERATOR | OPERAND OPERATOR COMMA B| ;

%%

int yyerror(){
    valid = 0;
    printf("Invalid\n");
    return 1;
}

void main(){
    printf("Enter the string:\n");
    yyparse();
    if (valid){
        printf("Valid\n");
    }
}