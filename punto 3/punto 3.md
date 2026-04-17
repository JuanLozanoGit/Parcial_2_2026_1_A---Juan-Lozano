3. Demostración LL(1)

Para demostrar que la gramática es LL(1), calculamos los conjuntos FIRST y FOLLOW:

Gramática:

    S→AaAb 

S→BbBa 

A→ϵ 

B→ϵ 

Análisis:

    FIRST(A) = {ϵ} 

FIRST(B) = {ϵ} 

FIRST(AaAb) = {a} (Como A es ϵ, pasamos al siguiente terminal) 

FIRST(BbBa) = {b} (Como B es ϵ, pasamos al siguiente terminal) 

Criterio LL(1):
Para las producciones de S (S→α∣β), se debe cumplir que FIRST(α)∩FIRST(β)=∅.
En este caso: {a}∩{b}=∅. Se cumple.
Al no haber ambigüedad en la elección de la regla según el lookahead, la gramática es LL(1).
