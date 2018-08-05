%{
#include <stdio.h>
%}

%token NUMBER
%token ADD SUB MUL DIV
%token AND
%token OP CP
%token EOL

%%
calclist:
  | calclist exp EOL { printf("%d\n", $2); }
  | calclist EOL     { printf(""); }
  ;
 
exp: factor
  | exp ADD factor { $$ = $1 + $3; }
  | exp SUB factor { $$ = $1 - $3; }
  ;

factor: term
  | factor MUL term { $$ = $1 * $3 }
  | factor DIV term { $$ = $1 / $3 }
  | factor AND term { $$ = $1 & $3 }
  ;

term: NUMBER
  | OP exp CP { $$ = $2 }
  ;
%%

main(int argc, char **argv) {
  yyparse();
}

yyerror(char *s) {
  fprintf(stderr, "error: %s\n", s);
}
