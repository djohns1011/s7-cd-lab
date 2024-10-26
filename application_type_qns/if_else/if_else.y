%{
    #include <stdio.h>

    void yyerror(char *s);
    int yylex(void);
%}

%token IF CONDITION ELSE SEMICOLON PARENTHESIS STATEMENT

%%

start             : if_else_statement       {printf("Correct Syntax\n");}
                  ;

if_else_statement : IF PARENTHESIS CONDITION PARENTHESIS PARENTHESIS STATEMENT SEMICOLON PARENTHESIS ELSE PARENTHESIS STATEMENT SEMICOLON PARENTHESIS
                  ;

%%

void yyerror(char *s){
    fprintf(stderr, "\nError : %s\n", s);
}

int main(){
    printf("Enter the if-else statement: \n");
    yyparse();
    return 1;
}