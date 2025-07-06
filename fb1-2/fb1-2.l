/* English -> American */
%%
"colour" { printf("color"); }
"flavour" { printf("flavor"); }
"clever" { printf("elegant"); }
"conservative" { printf("liberal"); }
. { printf("%s", yytext); }
%%
