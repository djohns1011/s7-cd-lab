%{
    #include "sql.tab.h"
%}

%%

"select"                {return SELECT;}
"column"                {return COLUMN;}
"from"                  {return FROM;}
"table"                 {return TABLE;}
"where"                 {return WHERE;}
"cond"                  {return CONDITION;}
"\,"                    {return COMMA;}
"\;"                    {return SEMICOLON;}
[ \t\n]                 {;}
.                       {printf("Unexpected character: %s\n", yytext);}

%%

int yywrap(){
    return 1;
}