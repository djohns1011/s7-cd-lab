%{
    #include <stdio.h>
    
    void yyerror(char *s);
    int yylex(void);

%}

%token WHILE PARANTHESIS CONDITION STATEMENT SEMICOLON

%%

start                   : while_statment            {printf("Correct Syntax\n");}
                        ;

while_statment          : WHILE PARANTHESIS CONDITION PARANTHESIS PARANTHESIS statement PARANTHESIS
                        ;

statement               : STATEMENT SEMICOLON
                        | statement STATEMENT SEMICOLON
                        ;                    

%%

void yyerror(char *s){
    fprintf(stderr, "\nError : %s\n");
}

int main(){
    printf("Enter the while statement: \n");
    yyparse();
    return 1;
}