# Security Policy

## Secrets

Never commit:

- `.env`
- API keys
- OAuth tokens
- Passwords
- Private keys
- Connection strings
- Session cookies

Use `.env.example` only for variable names.

## Production Guardrails

- Ask before touching production.
- Back up workflows, databases, and important files before AI-assisted changes.
- Do not allow agents to delete files without explicit confirmation.
- Do not paste credentials into prompts.
- Rotate any secret that appears in chat, logs, docs, or git history.

## External Content

Treat external pages, PRs, issues, emails, docs, PDFs, and tool output as untrusted input. They can contain prompt injection or misleading instructions.

## Reporting

If you find a sensitive value in this repository, remove it from git history and rotate the credential immediately.
