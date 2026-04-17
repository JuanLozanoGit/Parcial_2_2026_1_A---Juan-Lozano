# Parcial 2 - Compiladores 2026-1


## 1. Traductor CRUD NoSQL
Para compilar el lexer y parser que procesa sentencias `INSERT`, `SELECT`, `UPDATE` y `DELETE`:

```bash
bison -d parser.y
flex lexer.l
gcc lex.yy.c parser.tab.c -o traductor
./traductor
```
**Prueba:** `INSERT INTO usuarios VALUES ("Juan");`

---

## 2. Verificación LL(1) y CYK (Python)
Scripts para validación teórica y pruebas de rendimiento. Se recomienda usar Google Colab o un entorno local con `matplotlib`.

* **Demostración LL(1):** Ejecutar `verificar_ll1.py` para validar conjuntos FIRST/FOLLOW.
* **Comparativa CYK vs Predictivo:** Ejecutar el notebook de Colab para generar las gráficas de complejidad $O(n^3)$ vs $O(n)$.

---

## 3. Calculadora Booleana
Implementación de un analizador LALR para expresiones lógicas.

**Compilación:**
```bash
bison -d bool_calc.y
flex bool_calc.l
gcc bool_calc.tab.c lex.yy.c -o bool_calc
```

**Ejecución:**
```bash
./bool_calc
```
**Comandos válidos:**
* `TRUE AND FALSE`
* `NOT (FALSE OR TRUE)`
* `TRUE OR FALSE AND TRUE` (Verifica precedencia de operadores)

---

## Estructura del Proyecto
* `lexer.l` / `parser.y`: Lógica del traductor NoSQL.
* `bool_calc.l` / `bool_calc.y`: Lógica de la calculadora booleana.
* `DEMOSTRACION_LL1.md`: Análisis formal de la gramática del punto 3.
* `graficas.py`: Generación de reportes de rendimiento.

---
**Autor:** Juan Camilo Lozano Cortes
**Fecha:** Abril 2026
