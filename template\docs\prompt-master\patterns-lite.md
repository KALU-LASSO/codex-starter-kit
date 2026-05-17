# Token-Waste Patterns

## Common Problems

- Vague verb: "help", "improve", "fix everything".
- No target tool.
- No output format.
- No scope boundary.
- No success criteria.
- Multiple unrelated tasks in one prompt.
- Assumed memory from another session.
- Full codebase pasted instead of relevant files.
- Agent can edit/run/delete without stop conditions.
- CoT added to reasoning-native models.
- Missing negative prompt for image generation.
- Secrets embedded in prompt.

## Fix Rules

- Convert vague verbs into exact actions.
- Add target tool and output contract.
- Add "Done when".
- Add do-not-touch list.
- Split unrelated tasks.
- Add memory block only with stable facts.
- Strip secrets and replace with env var names.
- For agents: add stop conditions and verification.
