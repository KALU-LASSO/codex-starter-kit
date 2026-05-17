# Code Review Lite

## Uso

Despues de una feature relevante, antes de merge/PR o cuando conviene una segunda mirada.

## Proceso

1. Revisar diff y alcance.
2. Buscar bugs, regresiones, seguridad, tests faltantes y mantenibilidad.
3. Priorizar hallazgos por severidad.
4. Corregir criticos e importantes antes de continuar.

## Checklist

- Requisitos cubiertos.
- Tests proporcionales al riesgo.
- Sin secretos.
- Sin refactors no pedidos.
- Manejo de errores razonable.
- Cambios compatibles con patrones existentes.

## Salida

- Hallazgos con archivo y linea cuando aplique.
- Riesgos residuales.
- Verificacion ejecutada.
