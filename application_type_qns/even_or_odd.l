/*Auxilary Declaration*/

%{
    #include<stdio.h>
    #include<stdlib.h>
%}

/*Regular Definition*/

number [0-9]+

%%

{number} {
    int num1 = atoi(yytext);
    if (num1 % 2 == 0){
        printf("%d is even\n", num1);
    }   else {
        printf("%d is odd\n", num1);
    }
}

.|\n {}

%%

/*Auxilary Function*/

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 1;
}