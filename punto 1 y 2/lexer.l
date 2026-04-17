%{
#include "parser.tab.h"
%}
%%
"INSERT"    { return CREATE; }
"SELECT"    { return READ; }
"UPDATE"    { return UPDATE; }
"DELETE"    { return DELETE; }
"INTO"      { return INTO; }
"FROM"      { return FROM; }
"SET"       { return SET; }
"WHERE"     { return WHERE; }
"VALUES"    { return VALUES; }
[a-zA-Z_]+  { return ID; }
\"[^\"]*\"  { return STRING; }
[ \t\n]     ;
";"         { return ';'; }
.           { return yytext[0]; }
%%
int yywrap() { return 1; }
