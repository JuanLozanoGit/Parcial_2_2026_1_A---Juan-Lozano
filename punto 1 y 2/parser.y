%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex();
%}

%union {
    char *sval;
}

%token <sval> CREATE READ UPDATE DELETE FROM SET WHERE INTO VALUES ID STRING

%% 

program: 
    | program statement ';' 
    | program error ';' { yyerrok; printf("--> Error corregido. Intenta de nuevo con la sintaxis correcta.\n"); }
    ;

statement:
    create_stmt
    | read_stmt
    | update_stmt
    | delete_stmt
    ;

create_stmt:
    CREATE INTO ID VALUES '(' STRING ')' { 
        printf("EJECUCIÓN: Insertando el registro %s en la coleccion '%s'.\n", $6, $3); 
    }
    ;

read_stmt:
    READ FROM ID WHERE ID '=' STRING { 
        printf("EJECUCIÓN: Consultando en '%s' donde el campo '%s' es igual a %s.\n", $3, $5, $7); 
    }
    ;

update_stmt:
    UPDATE ID SET ID '=' STRING WHERE ID '=' STRING { 
        printf("EJECUCIÓN: Actualizando '%s'. Cambiando '%s' a %s donde '%s' es %s.\n", $2, $4, $6, $8, $10); 
    }
    ;

delete_stmt:
    DELETE FROM ID WHERE ID '=' STRING { 
        printf("EJECUCIÓN: Borrando de '%s' los registros donde '%s' es %s.\n", $3, $5, $7); 
    }
    ;

%% 

void yyerror(const char *s) { 
    fprintf(stderr, "SINTAXIS INCORRECTA: %s\n", s); 
}

int main() { 
    printf("--- Intérprete CRUD NoSQL Cargado ---\n");
    printf("Escribe tus comandos (termina con ';'):\n");
    return yyparse(); 
}
