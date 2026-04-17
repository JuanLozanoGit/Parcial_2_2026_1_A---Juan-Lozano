%{
#include <stdio.h>
#include <string.h>
int yylex();
void yyerror(char *s);
%}

%token TRUE FALSE AND OR NOT
%left OR
%left AND
%right NOT

%%
input: 
    | input line
    ;

line:
    exp '\n' { printf("Resultado: %s\n", $1 ? "TRUE" : "FALSE"); }
    ;

exp:
    TRUE      { $$ = 1; }
    | FALSE   { $$ = 0; }
    | exp AND exp { $$ = $1 && $3; }
    | exp OR exp  { $$ = $1 || $3; }
    | NOT exp     { $$ = !$2; }
    | '(' exp ')' { $$ = $2; }
    ;
%%
void yyerror(char *s) { printf("Error: %s\n", s); }
int main() { return yyparse(); }
