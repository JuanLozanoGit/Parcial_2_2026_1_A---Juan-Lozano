%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token CREATE READ UPDATE DELETE FROM SET WHERE INTO VALUES ID STRING

%% 
program: 
    | program statement ';' 
    ;

statement:
    create_stmt { printf("Op: Insertar registro\n"); }
    | read_stmt   { printf("Op: Consultar datos\n"); }
    | update_stmt { printf("Op: Actualizar registro\n"); }
    | delete_stmt { printf("Op: Borrar registro\n"); }
    ;

create_stmt:
    CREATE INTO ID VALUES '(' STRING ')'
    ;

read_stmt:
    READ FROM ID WHERE ID '=' STRING
    ;

update_stmt:
    UPDATE ID SET ID '=' STRING WHERE ID '=' STRING
    ;

delete_stmt:
    DELETE FROM ID WHERE ID '=' STRING
    ;

%% 
void yyerror(const char *s) { fprintf(stderr, "Error: %s\n", s); }
int main() { 
    printf("Iniciando traductor NoSQL (Escribe tu comando)\n");
    return yyparse(); 
}
