# Systematic Debugging Lite

## Uso

Cuando haya bug, fallo de test, build roto, comportamiento inesperado o integracion que no responde.

## Proceso

1. Leer error completo.
2. Reproducir o definir como se podria reproducir.
3. Revisar cambios recientes y ejemplos que si funcionan.
4. Formular una hipotesis concreta.
5. Probar la hipotesis con el cambio minimo.
6. Arreglar la causa raiz, no solo el sintoma.
7. Verificar que el fallo original ya no ocurre.

## Reglas

- No empezar por "probar fixes" sin entender causa probable.
- Si tres fixes fallan, parar y reconsiderar arquitectura o supuesto base.
- Para bugs importantes, anadir test de regresion si el proyecto lo permite.

## Salida

- Causa raiz.
- Cambio realizado.
- Evidencia de verificacion.
- Riesgos restantes.
