%{
    #include<stdio.h>
%}

number [0-9]

%%
"-"?{number}* {
    int num = atoi(yytext);
    if (num > 0){
        printf("Positive");
    } else if (num < 0) {
        printf("Negative");
    } else {
        printf("Zero");
    }
}

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 1;
}