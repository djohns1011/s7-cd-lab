%{
#include "switch.tab.h"
#include <string.h>
%}

%%

"switch"        {return SWITCH;}
"case"          {return CASE;}
"default"       {return DEFAULT;}
"break"         {return BREAK;}
"stmt"          {return STATEMENT;}
"expr"          {return EXPRESSION;}
"\:"            {return COLON;}
"\;"            {return SEMICOLON;}
[\(\)\{\}]      {return PARANTHESIS;}
[0-9]           {return CONSTANT;}
[ \t\n]+        {;}
"."             {printf("Unexpected character: %s\n", yytext);}

%%

int yywrap(){
    return 1;
}