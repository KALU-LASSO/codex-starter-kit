# Codex Superpowers

Adaptacion local de las ideas de `obra/superpowers` para este entorno Codex.

El objetivo no es copiar el plugin entero, sino quedarnos con el valor:

- Pensar antes de construir cuando la tarea es ambigua.
- Investigar causa raiz antes de arreglar bugs.
- Usar TDD cuando el cambio toca comportamiento.
- Verificar con evidencia antes de afirmar que algo esta terminado.
- Delegar en subagentes solo cuando haya trabajo paralelo real.
- Mantener planes y memoria en Markdown, sin secretos.

## Archivos

- `routing.md`: decide que flujo usar.
- `skills/`: resumen operativo de cada habilidad.
- `plans/`: planes de implementacion cuando la tarea lo requiera.
- `specs/`: especificaciones ligeras si hay que acordar diseno.
- `../../scripts/codex-superpowers.ps1`: utilidad local.

## Comandos

Listar flujos:

```powershell
.\scripts\codex-superpowers.ps1 list
```

Sugerir flujo para una tarea:

```powershell
.\scripts\codex-superpowers.ps1 route "arreglar un bug de login"
```

El router puede sugerir dos tipos de salida:

- `flow`: metodologia de trabajo.
- `profile`: perfil de equipo de `docs/agents/`.

Mostrar checklist de verificacion:

```powershell
.\scripts\codex-superpowers.ps1 checklist verification
```

## Regla Practica

Usar el minimo proceso que proteja la calidad:

- Tarea simple y reversible: resolver directo, verificar.
- Feature con incertidumbre: breve diseno, luego plan.
- Bug: causa raiz, reproduccion, test o verificacion.
- Cambio grande: spec, plan, tareas, checkpoints.

## Instalacion Oficial

El repositorio original ofrece instalacion nativa para Codex mediante clon y enlace de skills. En esta sesion preferimos una adaptacion local porque:

- Es visible y editable en este workspace.
- No requiere reiniciar Codex.
- Evita cargar skills largas cuando no hacen falta.
- Encaja con nuestra memoria en Markdown.

Si mas adelante queremos el plugin completo, se puede instalar globalmente y reiniciar Codex.
