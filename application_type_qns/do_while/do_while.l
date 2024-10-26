%{
    #include "do_while.tab.h"
%}

%%

"do"            {return DO;}
"stmt"          {return STATEMENT;}
"while"         {return WHILE;}
"cond"          {return CONDITION;}
"\;"            {return SEMICOLON;}
"\("            {return LPAREN;}
"\)"            {return RPAREN;}
"\{"            {return LBRACE;}
"\}"            {return RBRACE;}
[ \t\n]         {;}
.               {printf("Unexpected character: %s\n");}

%%

int yywrap(){
    return 1;
}