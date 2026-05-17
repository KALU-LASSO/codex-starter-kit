# Memory Protocol

## Objetivo

Mantener continuidad entre sesiones sin aumentar coste ni riesgo. La memoria debe ayudar a recordar decisiones y contexto estable, no sustituir al codigo ni guardar todo.

## Captura

Crear una observacion cuando:

- Se toma una decision que afectara tareas futuras.
- Se descubre una convencion del proyecto.
- Se configura una integracion o variable de entorno.
- Se define un flujo de trabajo reusable.
- Se resuelve un problema que probablemente reaparecera.

No crear observacion cuando:

- La informacion solo sirve para el turno actual.
- Hay datos sensibles que no pueden resumirse de forma segura.
- La nota seria una transcripcion o log sin sintesis.

## Privacidad

- No guardar secretos.
- No guardar valores de variables de entorno.
- Usar nombres como `DROPBOX_SIGN_API_KEY`, no valores.
- Si el usuario marca contenido con `<private>...</private>`, no registrarlo.
- Si una clave se expone, registrar solo que debe rotarse, no la clave.

## Tipos

- `decision`: decision de arquitectura, producto o proceso.
- `preference`: preferencia estable del usuario.
- `procedure`: pasos repetibles.
- `integration`: servicio, variable o conexion disponible.
- `agent`: regla sobre perfiles o subagentes.
- `finding`: hallazgo de auditoria o investigacion.

## Divulgacion Progresiva

1. Index: leer `index.md` o buscar titulos y tags.
2. Timeline: revisar notas cercanas por fecha si hay varias candidatas.
3. Detalle: abrir solo las observaciones que parecen relevantes.

## Limpieza

Revisar periodicamente:

- Eliminar notas obsoletas.
- Fusionar duplicados.
- Marcar decisiones reemplazadas.
- Mantener el indice corto.

## Formato De Observacion

Cada observacion debe tener:

- ID estable basado en fecha y slug.
- Tipo.
- Tags.
- Resumen corto.
- Detalles utiles.
- Archivos relacionados si existen.
- Riesgos o limites.
- Fecha de revision opcional.
