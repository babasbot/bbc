%{
#include "bbc.tab.h"
%}

%%
0[xX][a-f0-9]+ { yylval = strtol(yytext, NULL, 16); return NUMBER; }
[0-9]+         { yylval = atoi(yytext); return NUMBER; }

"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }

"&" { return AND; }
"|" { return OR; }

"(" { return OP; }
")" { return CP; }

\n { return EOL; }

[ \t] { /* ignore whitespaces */ }
"#".* { /* ignore comments */ }

. { yyerror("Mystery character: %c\n", *yytext); }
%%
