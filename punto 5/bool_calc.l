%{
#include "bool_calc.tab.h"
%}

%%
"TRUE"  { return TRUE; }
"FALSE" { return FALSE; }
"AND"   { return AND; }
"OR"    { return OR; }
"NOT"   { return NOT; }
"\n"    { return '\n'; }
[ \t]   ; /* Ignorar espacios */
"("     { return '('; }
")"     { return ')'; }
.       { return yytext[0]; }
%%

int yywrap() { return 1; }
