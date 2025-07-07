%{
#include "fb1-5.tab.h"
%}

%%
"+"	{ return ADD; }
"-"	{ return SUB; }
"*"	{ return MUL; }
"/"	{ return DIV; }
"|"	{ return ABS; }
[0-9]+\.[0-9]+	{ yylval.double_val = atof(yytext); return NUMBER; }
[0-9]+	{ yylval.double_val = atoi(yytext); return NUMBER; }
\n	{ return EOL; }
"("	{ return OP; }
")"	{ return CP; }
"//."	{ /* ignore comments */ }
[ \t]	{ /* ignore whitespace */}
.	{ printf("Mystery character %c\n", *yytext); }
%%
