%{
    #include <stdio.h>
    
    void yyerror(char* s);
    int yylex(void);
%}

%token SELECT COLUMN FROM TABLE WHERE CONDITION COMMA SEMICOLON

%%

start            : SELECT coulmn_statement FROM table_statement SEMICOLON                       {printf("Correct Syntax \n");}
                 | SELECT coulmn_statement FROM table_statement WHERE CONDITION SEMICOLON       {printf("Correct Syntax \n");}
                 ;

coulmn_statement : COLUMN
                 | coulmn_statement COMMA COLUMN
                 | '*'
                 ;

table_statement  : TABLE
                 | table_statement COMMA TABLE
                 ;

%%

void yyerror(char* s){
    fprintf(stderr, "Error: %s\n", s);
}

int main(){
    printf("Enter the sql statement: \n");
    yyparse();
    return 1;
}