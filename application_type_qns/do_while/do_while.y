%{
    #include <stdio.h>

    void yyerror(char* s);
    int yylex(void);
%}

%token DO STATEMENT WHILE CONDITION LPAREN RPAREN LBRACE RBRACE SEMICOLON

%%

start               : do_while_statement          {printf("Correct Syntax\n");}
                    ;

do_while_statement  : DO LBRACE statement RBRACE WHILE LPAREN CONDITION RPAREN SEMICOLON
                    ;

statement           : STATEMENT SEMICOLON
                    | statement STATEMENT SEMICOLON
                    ;

%%

void yyerror(char* s){
    fprintf(stderr, "Error: %s\n", s);
}

int main(){
    printf("Enter the do while statement: \n");
    yyparse();
    return 1;
}

