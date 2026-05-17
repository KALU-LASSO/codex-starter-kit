# Prompt Master Lite For Codex

Adaptacion local de `nidhinjs/prompt-master` para nuestro entorno Codex.

Objetivo: ayudar a crear prompts mejores sin convertir cada solicitud en una plantilla enorme.

## Que Se Aprovecha

- Extraccion silenciosa de 9 dimensiones.
- Maximo 3 preguntas aclaratorias.
- Routing por herramienta destino.
- Plantillas ligeras segun caso.
- Stop conditions para agentes con acceso a sistema.
- Auditoria de tokens: cada palabra debe aportar.
- Decompilacion de prompts malos.

## Que Se Cambia Para Codex

- Se integra con `docs/agents/prompt-engineer.md`.
- Se conecta al router `scripts/codex-superpowers.ps1`.
- Se evita mostrar nombres de frameworks salvo que ayuden.
- Se usa memoria local en `docs/memory/` para preferencias recurrentes.
- Se priorizan prompts en espanol si el usuario habla en espanol, con campos tecnicos en ingles cuando conviene.

## Flujo Rapido

1. Detectar herramienta destino.
2. Extraer 9 dimensiones.
3. Preguntar maximo 3 cosas si falta algo critico.
4. Elegir plantilla minima.
5. Redactar prompt copiable.
6. Auditar tokens y eliminar relleno.

## Uso

```powershell
.\scripts\codex-prompt-master.ps1 route "prompt para Cursor que refactorice login"
.\scripts\codex-prompt-master.ps1 checklist
```
