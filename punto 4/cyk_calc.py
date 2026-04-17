# Implementación rápida de CYK para una gramática simple de calculadora
def cyk_parser(tokens, grammar):
    n = len(tokens)
    table = [[set() for _ in range(n + 1)] for _ in range(n + 1)]
    
    # Llenado de la diagonal (terminales)
    for i, tok in enumerate(tokens):
        for lhs, rhs in grammar.items():
            if tok in rhs: table[1][i+1].add(lhs)
            
    # Llenado de celdas superiores
    for l in range(2, n + 1):
        for s in range(1, n - l + 2):
            for p in range(1, l):
                # Lógica de combinación de reglas A -> BC
                pass 
    return "S" in table[n][1]

# Comparativa de rendimiento
# CYK: O(n^3 * |G|) - Es lento para expresiones largas.
# Predictivo: O(n) - Mucho más eficiente para calculadoras estándar.
