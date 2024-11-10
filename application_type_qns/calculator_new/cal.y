%{
    #include <stdio.h>
    int yyerror(char *s);
    int sym[26];
    int yylex(void);
%}

%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%%

program     : program statement '\n'
            |
            ;

statement   : expr                  {printf("%d\n",$1);}
            | VARIABLE '=' expr     {sym[$1] = $3;}
            ;
            
expr        : INTEGER
            | VARIABLE              {$$ = sym[$1];}
            | expr '+' expr         {$$ = $1 + $3;}
            | expr '-' expr         {$$ = $1 - $3;}
            | expr '*' expr         {$$ = $1 * $3;}
            | expr '/' expr         {$$ = $1 / $3;}
            | '(' expr ')'          {$$ = $2;}
            ;

%%

int yyerror(char *s){
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}

int main(){
    printf("Enter the arithmetic expression: \n");
    yyparse();
    return 0;
}