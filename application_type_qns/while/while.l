%{
    #include "while.tab.h"
%}

%%

"while"             { return WHILE; }
"cond"              { return CONDITION; }
"stmt"              { return STATEMENT; }
"\;"                { return SEMICOLON; }
[\(\)\{\}]          { return PARANTHESIS; }
[ \t\n]             {;}
.                   {printf("Unexpected character: %s\n");}

%%

int yywrap(){
    return 1;
}