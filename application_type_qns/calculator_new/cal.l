%{
    #include "cal.tab.h"
%}

%%

[a-z]       {
                yylval = *yytext - 'a';
                return VARIABLE;
            }
[0-9]+      {
                yylval = atoi(yytext);
                return INTEGER;
            }
[-+*/()=\n] {return *yytext;}
[ \t]+       {}
.           {printf("Unexpected character\n");}

%%

int yywrap(){
    return 1;
}