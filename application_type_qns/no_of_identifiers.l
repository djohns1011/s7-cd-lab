%{
    #include <stdio.h>

    int count;
%}

digit [0-9]
letter [a-zA-Z]

%%

{letter}({letter}|{digit})*     count++;

%%

int yywrap(){
    return 1;
}

int main(void){
    yylex();
    printf("Number of identifiers = %d\n",count);
    return 0;
}