%{
    #include <stdio.h>
    #include <stdlib.h>

    void yyerror(char* s);
    int yylex(void);
%}

%token SWITCH CASE EXPRESSION PARANTHESIS COLON STATEMENT DEFAULT CONSTANT BREAK SEMICOLON

%%

start            : switch_statement { printf("Program parsed successfully\n"); }
                 ;

switch_statement : SWITCH PARANTHESIS EXPRESSION PARANTHESIS PARANTHESIS case_clauses default_case PARANTHESIS
                 ;

case_clauses     : case_clause
                 | case_clauses case_clause
                 ;

case_clause      : CASE CONSTANT COLON STATEMENT BREAK SEMICOLON
                 ;

default_case     : DEFAULT COLON STATEMENT BREAK SEMICOLON
                 ;

%%

void yyerror(char *s){
    fprintf(stderr, "\nError: %s\n", s);
}

int main(){
    printf("Enter the switch statement:\n");
    yyparse();
    return 0;
}