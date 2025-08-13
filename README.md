# Gramáticas Daniel Ayala Guzmán

```markdown
## Descripción de las gramáticas

1. G1: `S -> 00 | 11 | 0 | 1`
2. G2: `S -> b | a S b | ε` (balance de `a` y `b`, aceptando vacío y `b`)
3. G3: `S -> b | a S b | ab` (balance de `a` y `b`, con mínimo 1 `a` y 1 `b`)
4. G4: `S -> b | ab | a` (solo cadenas cortas definidas explícitamente)
5. G5: `S -> b | ab | a S b` (secuencias con más flexibilidad que G4)

## Enfoque de solución

### Python
- Se utilizaron **expresiones regulares (`re`)** para cada gramática.
- Lectura línea por línea de los `.txt` de prueba.
- Impresión de `"acepta"` o `"NO acepta"` según el patrón.
- Limitación: las regex no pueden contar coincidencias exactas de `a` y `b` para todas las longitudes, por lo que en G2 y G5 es una aproximación.

### C con Flex/Bison
- Flex lee cada línea completa como un token.
- Bison compara la cadena con las reglas de la gramática.
- Se imprime el resultado por cada línea del archivo.
- Esto asegura validación exacta según la gramática.

## Desafíos y cómo se resolvieron

1. `yytext` no reconocido en Bison  
   - Solución: Declarar `extern char *yytext;` en el `.y` para enlazarlo con la variable generada por Flex.

2. El parser solo procesaba la primera línea  
   - Solución: Cambiar el símbolo inicial a `input` y permitir `input : input S | /* vacío */` para procesar múltiples líneas.

3. Salida repetida por token en vez de por línea  
   - Solución: Configurar Flex para reconocer toda la línea como un solo token `CADENA` y evaluar la validez completa en Bison.

4. Coordinación de nombres entre `.l` y `.y`  
   - Asegurarse de que el `.l` incluya el encabezado generado por Bison (`#include "g_X.tab.h"`) con el nombre correcto.
```
## Instrucciones de ejecución

### 1. Python

```bash
python3 g1.py
python3 g2.py
python3 g3.py
python3 g4.py
python3 g5.py
```

Cada script lee su archivo de prueba `txt` y muestra los resultados.

### 2. C con Flex/Bison

Ejemplo para G1:

```bash 
bison -d g_1.y
flex g_1.l
gcc g_1.tab.c lex.yy.c -o g_1
./g_1 ../tests/g-1.txt
```

Repetir cambiando `g_1` y `g-1.txt` por el número de la gramática a probar.

## Cosas extra

* Python: más rápido de implementar pero menos estricto en algunas reglas.
* C (Flex/Bison): más fiel a las definiciones formales.
* Los archivos `.txt` incluyen cadenas válidas e inválidas para pruebas rápidas.
