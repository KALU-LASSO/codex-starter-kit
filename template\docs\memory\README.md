# Codex Memory

Esta carpeta es una memoria persistente, local y curada para Codex.

La idea viene de patrones tipo Claude-Mem, pero adaptada a este entorno:

- Sin captura automatica de todo lo que ocurre.
- Sin guardar transcripciones completas.
- Sin almacenar secretos.
- Sin worker, base de datos o servicio en segundo plano.
- Con busqueda y divulgacion progresiva para ahorrar contexto.

## Estructura

- `index.md`: vista compacta de recuerdos utiles.
- `protocol.md`: reglas de captura, busqueda, privacidad y limpieza.
- `observations/`: notas completas, una por aprendizaje, decision o procedimiento.
- `templates/observation.md`: plantilla para nuevas observaciones.
- `../../scripts/codex-memory.ps1`: utilidad local para crear y buscar notas.

## Flujo Recomendado

1. Buscar primero en `index.md`.
2. Si hace falta, usar:

```powershell
.\scripts\codex-memory.ps1 search "wordpress"
```

3. Abrir solo las observaciones relevantes.
4. Al terminar una tarea, registrar memoria solo si hay algo reutilizable.

## Que Guardar

- Decisiones de arquitectura.
- Preferencias de trabajo del usuario.
- Convenciones de proyecto.
- Procedimientos que se repetiran.
- Integraciones configuradas, solo por nombre de variable o servicio.
- Hallazgos de auditoria que afecten decisiones futuras.

## Que No Guardar

- API keys, tokens, passwords o secretos.
- Datos personales innecesarios.
- Transcripciones completas.
- Logs extensos.
- Resultados temporales que no se reutilizaran.
