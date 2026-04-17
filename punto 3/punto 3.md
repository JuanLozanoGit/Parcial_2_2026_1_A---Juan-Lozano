# Análisis de Gramática y Verificación de Predictibilidad LL(1)

## 1. Definición de la Gramática
Se analiza la siguiente gramática formal, donde $S$ es el símbolo inicial, y $\{a, b\}$ son terminales:

$$
\begin{aligned}
1. & \quad S \rightarrow A a A b \\
2. & \quad S \rightarrow B b B a \\
3. & \quad A \rightarrow \epsilon \\
4. & \quad B \rightarrow \epsilon \\
\end{aligned}
$$

---

## 2. Cálculo de Conjuntos Directores (FIRST y FOLLOW)

Para determinar si la gramática es **LL(1)**, primero calculamos los conjuntos de primeros (**FIRST**) y siguientes (**FOLLOW**).

### Conjuntos FIRST
El conjunto FIRST nos indica qué terminales pueden aparecer al inicio de una cadena derivada por un no terminal.

* **FIRST(A):** $\{\epsilon\}$ (Por regla 3)
* **FIRST(B):** $\{\epsilon\}$ (Por regla 4)
* **FIRST(AaAb):** * Como $A \rightarrow \epsilon$, tomamos el primer terminal que le sigue: $\{a\}$.
* **FIRST(BbBa):** * Como $B \rightarrow \epsilon$, tomamos el primer terminal que le sigue: $\{b\}$.

### Conjuntos FOLLOW
El conjunto FOLLOW indica qué terminales pueden aparecer inmediatamente después de un no terminal.

* **FOLLOW(S):** $\{\$\}$ (Símbolo de fin de cadena)
* **FOLLOW(A):** $\{a, b\}$ (Aparece antes de 'a' y antes de 'b' en las producciones de S)
* **FOLLOW(B):** $\{b, a\}$ (Aparece antes de 'b' y antes de 'a' en las producciones de S)

---

## 3. Demostración de Condición LL(1)

Una gramática es LL(1) si para cualquier par de producciones $A \rightarrow \alpha \mid \beta$, se cumplen las reglas de distinción. En este caso, evaluamos las bifurcaciones de **S**:

### Regla de Intersección de FIRST
Debemos comprobar que:
$$\text{FIRST}(\alpha) \cap \text{FIRST}(\beta) = \emptyset$$

Aplicando a nuestras producciones:
* $\alpha = AaAb \implies \text{FIRST}(\alpha) = \{a\}$
* $\beta = BbBa \implies \text{FIRST}(\beta) = \{b\}$

**Verificación:**
$$\{a\} \cap \{b\} = \emptyset$$

**Resultado:** No existe conflicto de predicción. El analizador sintáctico puede decidir qué camino tomar simplemente observando el primer símbolo de la entrada (Lookahead).

---

## 4. Tabla de Análisis Sintáctico (Parsing Table)

La claridad de la gramática se refleja en que no existen múltiples entradas para una misma celda:

| No Terminal | a | b | $ |
| :--- | :--- | :--- | :--- |
| **S** | $S \rightarrow AaAb$ | $S \rightarrow BbBa$ | - |
| **A** | $A \rightarrow \epsilon$ | $A \rightarrow \epsilon$ | - |
| **B** | $B \rightarrow \epsilon$ | $B \rightarrow \epsilon$ | - |

---

## 5. Conclusión Técnica
Dado que los conjuntos **FIRST** de las producciones alternativas de $S$ son disjuntos, la gramática es **estrictamente LL(1)**. La presencia de producciones $\epsilon$ no genera conflictos ya que los terminales de activación ($a$ y $b$) actúan como delimitadores claros en la cadena de entrada.

---
