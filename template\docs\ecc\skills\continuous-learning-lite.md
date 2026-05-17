# Continuous Learning Lite

## Uso

Cuando una sesion produce una preferencia, decision, procedimiento o patron reutilizable.

## Proceso

1. Preguntar si el dato es estable o inferirlo solo si es claramente reutilizable.
2. Reducir a una observacion corta.
3. Evitar secretos y transcripciones.
4. Guardar en `docs/memory/observations/`.
5. Actualizar `docs/memory/index.md`.

## No Guardar

- Valores de credenciales.
- Datos privados innecesarios.
- Logs extensos.
- Opiniones temporales.

## Comando

```powershell
.\scripts\codex-memory.ps1 new -Title "Titulo" -Type preference -Tags "codex,workflow" -Summary "Resumen"
```
