# Prompt Routing

| Destino | Usar | Enfoque |
|---|---|---|
| ChatGPT / GPT-5.x | Output Contract | formato, longitud, done criteria, herramientas disponibles |
| OpenAI reasoning models | Short Direct | instrucciones cortas, sin CoT, resultado esperado |
| Claude / Claude API | Structured Context | contexto, task, constraints, output_format |
| Codex | Agent Task Brief | scope, allowed actions, forbidden actions, verification |
| Cursor / Windsurf | File Scope | path, funcion, cambio, no tocar, done when |
| GitHub Copilot | Docstring Contract | firma, tipos, edge cases, return |
| n8n / Make / Zapier | Workflow Map | trigger, actions, field mapping, auth assumptions |
| Midjourney | Visual Descriptor | sujeto, estilo, mood, lighting, composition, params |
| DALL-E | Prose Visual | escena clara, foreground/midground/background, sin texto si no aplica |
| Stable Diffusion | Weighted Prompt | positive, negative, CFG/steps si se conocen |
| Sora / Runway | Shot Direction | duracion, camara, movimiento, estilo, restricciones |
| ElevenLabs | Voice Direction | voz, emocion, ritmo, enfasis, texto |
| Unknown tool | Universal Fingerprint | objetivo, input, output, limites, ejemplos |

## Universal Fingerprint

Si la herramienta destino no esta clara, preguntar como mucho:

1. Que herramienta recibira el prompt?
2. Que resultado exacto quieres obtener?
3. Que formato o limites debe respetar?

## Agentic Prompt Guard

Para cualquier herramienta que edite archivos, ejecute comandos, use navegador o toque servicios:

- Starting state.
- Target state.
- Allowed actions.
- Forbidden actions.
- Stop conditions.
- Verification.
- Human review triggers.
