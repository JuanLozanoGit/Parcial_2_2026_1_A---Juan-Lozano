# Parcial_2_2026_1_A---Juan-Lozano

## Contenido
1. **CRUD NoSQL**: Implementación de lexer y parser para un lenguaje de base de datos.
2. **Análisis LL(1)**: Demostración matemática de la gramática S -> AaAb | BbBa.
3. **CYK vs Predictivo**: Script de prueba y comparativa de complejidad algorítmica.
4. **Calculadora Booleana**: Evaluador de expresiones lógicas en YACC.

## Compilación
Para los archivos .y y .l:
```bash
flex lexer.l
bison -d parser.y
gcc lex.yy.c parser.tab.c -o mi_lenguaje
