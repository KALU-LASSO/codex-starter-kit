# Parallel Agents Lite

## Uso

Cuando hay dos o mas dominios independientes que pueden avanzar en paralelo.

## Proceso

1. Agrupar trabajo por dominio independiente.
2. Dar a cada subagente un briefing corto.
3. Evitar que dos subagentes editen los mismos archivos.
4. Revisar resultados antes de integrarlos.
5. Ejecutar verificacion conjunta.

## Briefing

```text
Objetivo:
Contexto:
Alcance:
Limites:
Entregable:
```

## Reglas

- No delegar el bloqueo inmediato del hilo principal.
- No duplicar trabajo entre agentes.
- No confiar ciegamente en el resultado: revisar y verificar.

## Salida

- Resumen por subagente.
- Conflictos o riesgos.
- Resultado integrado.
