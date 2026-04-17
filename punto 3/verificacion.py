import pandas as pd

def verificar_ll1():
    # Definición de la gramática
    # S -> AaAb (produccion 1)
    # S -> BbBa (produccion 2)
    # A -> epsilon
    # B -> epsilon
    
    print("--- Analizador de Consistencia LL(1) ---")
    
    # 1. Conjuntos FIRST
    # Basado en la gramática:
    # FIRST(A) = {ε}
    # FIRST(B) = {ε}
    # Para S -> AaAb: Como A deriva en ε, FIRST(AaAb) incluye 'a'
    # Para S -> BbBa: Como B deriva en ε, FIRST(BbBa) incluye 'b'
    
    first_s1 = {'a'}
    first_s2 = {'b'}
    
    print(f"FIRST(AaAb) = {first_s1}")
    print(f"FIRST(BbBa) = {first_s2}")
    
    # 2. Verificación de la Primera Condición LL(1)
    # Para S -> alpha | beta, la intersección de FIRST(alpha) y FIRST(beta) debe ser vacía.
    
    interseccion = first_s1.intersection(first_s2)
    
    print(f"\nVerificando interseccion: FIRST(AaAb) ∩ FIRST(BbBa)")
    print(f"Resultado: {interseccion if interseccion else '∅ (Conjunto Vacío)'}")
    
    # 3. Conclusión Técnica
    if len(interseccion) == 0:
        print("\n[CONFIRMACIÓN]: La gramática cumple el criterio de desarticulación de FIRST.")
        print("No hay ambigüedad en la elección de la producción mediante el primer símbolo (Lookahead).")
        print("RESULTADO FINAL: La gramática es LL(1).")
        return True
    else:
        print("\n[ERROR]: La gramática presenta conflictos y no es LL(1).")
        return False

if __name__ == "__main__":
    verificar_ll1()
