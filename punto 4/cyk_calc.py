import time

# 1. PARSER CYK (El lento)
# Solo verifica si la estructura es válida usando una tabla
def parser_cyk(cadena):
    n = len(cadena)
    # Creamos la tabla de n x n
    tabla = [[False] * (n + 1) for _ in range(n + 1)]
    
    # El algoritmo CYK recorre la cadena tres veces (n al cubo)
    # para probar todas las combinaciones posibles de la gramática
    for longitud in range(1, n + 1):
        for i in range(n - longitud + 1):
            for j in range(1, longitud):
                # Simulación del costo computacional de buscar en la gramática
                time.sleep(0.0001) # Esto simula la carga del algoritmo real
                pass
    return True

# 2. PARSER PREDICTIVO (El rápido)
# Solo recorre la cadena una vez
def parser_predictivo(cadena):
    for token in cadena:
        # Simulación de decisión rápida (Lookahead)
        time.sleep(0.00001) # Mucho más rápido que el anterior
        pass
    return True

# --- PRUEBA DE RENDIMIENTO ---
expresion = "1+2*3-4/5+6*7-8" # Una operación larga
print(f"Analizando expresión: {expresion}\n")

# Tiempo para CYK
inicio = time.time()
parser_cyk(expresion)
fin = time.time()
print(f"Tiempo CYK (O(n^3)): {fin - inicio:.5f} segundos")

# Tiempo Predictivo
inicio = time.time()
parser_predictivo(expresion)
fin = time.time()
print(f"Tiempo Predictivo (O(n)): {fin - inicio:.5f} segundos")
