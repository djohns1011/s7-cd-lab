%{
    #include<stdio.h>
    #include<string.h>

    int i;
    int flag = 0;
    char name[50];

%}

%%

[a-zA-Z]* {
    for(i = 0; i < yyleng; i++){
        if (yytext[i] == 'd' && yytext[i+1] == 'e' && yytext[i+2] == 'n' && yytext[i+3] == 'n'){
            flag = 1;
            break;
        }
    }
    strcpy(name, yytext);
}

[\n] {
    if(flag == 1){
        printf("%s contains 4 letters of name as substring\n",name);
    } else {
        printf("%s doesn't contain 4 letters of name as substring\n",name);
    }
    flag = 0;
    strcpy(name,"");
}

%%

int yywrap(){
    return 1;
}

int main(){
    printf("Enter a String:\n");
    yylex();
    return 1;
}
