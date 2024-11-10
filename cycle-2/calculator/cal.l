%{
    #include "cal.tab.h"
%}

%%

[0-9]+ {yylval = atoi(yytext);
        return NUMBER;}
"+" {return '+';}
"-" {return '-';}
"*" {return '*';}
"" {return '/';}
"(" {return '(';}
")" {return ')';}
[ \t]+ {}
. {printf("Unecpected character %s\n",yytext);}

%%

int yywrap(){
    return 1;
}