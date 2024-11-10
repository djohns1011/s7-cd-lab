%{
    #include <stdio.h>
    int valid = 1;
    int yyerror();
    int yylex(void);
%}

%token letter digit

%%

start : letter s
s     : letter s
      | digit s
      |
      ;

%%

int yyerror(){
    printf("\nIts not a valid identifier\n");
    valid = 0;
    return 0;
}

int main(){
    printf("Enter a valid identifier to be tested:\n");
    yyparse();
    if(valid){
        printf("It is a valid identifier");
    }
    return 0;
}

