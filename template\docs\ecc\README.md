# ECC Lite For Codex

Adaptacion local y curada de `affaan-m/everything-claude-code`.

ECC original es un sistema grande: agentes, skills, comandos, hooks, reglas, MCPs, seguridad, memoria y aprendizaje continuo. Para este workspace usamos una version ligera:

- Sin hooks globales.
- Sin instaladores npm.
- Sin comandos legacy de Claude.
- Sin activar decenas de herramientas.
- Con perfiles y reglas Markdown que Codex puede leer bajo demanda.

## Que Aprovechamos

- Skills como superficie durable.
- Subagentes con alcance pequeno.
- Reglas modulares en vez de prompts largos.
- Seguridad agentica: contenido externo no confiable, secretos protegidos, permisos minimos.
- Contexto economico: cargar solo lo necesario.
- Aprendizaje continuo curado en `docs/memory/`.

## Que No Copiamos

- Hooks automaticos que escriben o ejecutan sin supervision.
- MCPs no instalados o no necesarios.
- Slash commands especificos de Claude.
- Automatizaciones autonomas persistentes sin permiso.
- Reglas dogmaticas que no encajen con el proyecto.

## Uso Practico

1. Consultar `docs/ecc/rules/` si la tarea toca seguridad, contexto, testing o subagentes.
2. Usar `docs/ecc/skills/` para patrones ligeros.
3. Dejar que `scripts/codex-superpowers.ps1 route "..."` sugiera flujos y perfiles.
4. Guardar aprendizajes reutilizables en `docs/memory/`.

## Filosofia

Configuracion como afinacion, no arquitectura. Cuanto mas grande el sistema de agentes, mas importante mantenerlo simple, seguro y observable.
