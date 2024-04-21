%{
#include "calc.tab.h"
%}

%option nounput
%option noinput

white [ \t]+
digit [0-9]
integer {digit}+
exponent [eE][+-]?{integer}
real {integer}("."{integer})?{exponent}?

%%

{white} { /* Vamos ignorar os espaços em branco */ }
{real} { yylval.valor = atof(yytext); return NUMBER; }

"+" return PLUS;
"*" return TIMES;
"(" return LEFT;
")" return RIGHT;
"\n" return END;
<<EOF>> return END_OF_FILE;

%%
