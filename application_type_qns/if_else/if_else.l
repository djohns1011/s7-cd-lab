%{
    #include "if_else.tab.h"
%}

%%

"if"            {return IF;}
"cond"          {return CONDITION;}
"stmt"          {return STATEMENT;}
"else"          {return ELSE;}
"\;"            {return SEMICOLON;}
[\(\)\{\}]      {return PARENTHESIS;}
[ \t\n]         {;}
.               {printf("Unexpected character: %s\n",yytext);}

%%

int yywrap(){
    return 1;
}