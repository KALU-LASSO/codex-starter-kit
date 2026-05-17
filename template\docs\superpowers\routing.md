# Superpowers Routing

Usa esta tabla para elegir flujo sin escribir prompts largos.

| Solicitud | Flujo principal | Apoyos | Salida esperada |
|---|---|---|---|
| Idea nueva o feature ambigua | `brainstorming-lite` | `writing-plans-lite` | Diseno breve o spec |
| Feature clara con comportamiento nuevo | `test-driven-development-lite` | `verification` | Test rojo, implementacion, test verde |
| Bug, fallo de test o comportamiento raro | `systematic-debugging-lite` | `test-driven-development-lite`, `verification` | Causa raiz, fix, prueba |
| Tarea grande con varios pasos | `writing-plans-lite` | `executing-plans-lite` | Plan por tareas verificables |
| Varias areas independientes | `parallel-agents-lite` | perfiles de `docs/agents/` | Subagentes por dominio |
| Antes de cerrar trabajo | `verification` | `code-review-lite` | Evidencia fresca |
| Antes de merge o PR | `code-review-lite` | `verification` | Riesgos y hallazgos |

## Routing Con Perfiles De Equipo

- CMS/WordPress: combinar con `docs/agents/cms-developer.md`.
- Frontend: combinar con `docs/agents/frontend-developer.md`.
- UI/UX: combinar con `docs/agents/ui-designer.md` y `docs/agents/ux-architect.md`.
- Ads/tracking: combinar con `docs/agents/ppc-campaign-strategist.md`, `paid-media-auditor.md` y `tracking-measurement-specialist.md`.
- Validacion: combinar con `docs/agents/evidence-collector.md`.

## Briefing Corto Para Subagentes

```text
Objetivo: [resultado concreto]
Contexto: [archivos, error, datos o decision relevante]
Alcance: [que puede tocar]
Limites: [que no debe tocar]
Entregable: [patch, auditoria, causa raiz, checklist, etc.]
```

## Cuando No Usar Proceso Pesado

- Cambios de texto pequenos.
- Lectura o explicacion de codigo.
- Comandos directos y reversibles.
- Exploracion inicial sin compromiso de implementacion.

Incluso en esos casos, verificar antes de afirmar cierre.
