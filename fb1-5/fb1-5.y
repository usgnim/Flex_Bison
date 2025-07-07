/* simplest version of calculator */
%{
#include <stdio.h>
int yylex(void);
int yyerror(char *s);
%}

%union {
	double double_val;
}

/* dclare tokens */
%token <double_val> NUMBER
%token ADD SUB MUL DIV ABS
%token EOL
%token OP CP

%type <double_val> exp factor term

%%

calclist: /* nothing */
 | calclist exp EOL { printf("= %lf\n", $2); }
 | calclist EOL {}
 ;
exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;
factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;
term: NUMBER
 | ABS term { $$ = $2 >= 0? $2 : - $2; }
 | OP exp CP { $$ = $2; }
 ;

%%

int main(int argc, char **argv)
{
	yyparse();
	return 0;
}

int yyerror(char *s)
{
	fprintf(stderr, "error: %s\n", s);
}
