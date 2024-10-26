%{
    #include<stdio.h>
    
    #define ID 1
    #define ER 2
%}

low_case [a-z]
upp_case [A-Z]
number [0-9]


%%

({low_case}|{upp_case})({low_case}|{upp_case})*({number}) {return ID;}
.                     {return ER;}

%%

int yywrap(){
    return 1;
}

int main(){
    int token = yylex();
    if (token == ID){
        printf("Acceptable\n");
    } else if(token == ER) {
        printf("Not Acceptable\n");
    }
    return 0;
}