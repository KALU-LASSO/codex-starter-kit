# Codex Starter Kit

A portable starter kit for working with Codex using auditable Markdown memory, lightweight agent profiles, prompt engineering helpers, development workflows, and integration runbooks.

The goal is simple: clone this repo, install the template into any project, and give Codex a clean operating system without leaking local paths, secrets, or private context.

## Quick Install

### Windows PowerShell

```powershell
git clone https://github.com/KALU-LASSO/codex-starter-kit.git
cd codex-starter-kit
.\install.ps1 -TargetPath C:\path\to\your\project
```

Preview first:

```powershell
.\install.ps1 -TargetPath C:\path\to\your\project -DryRun
```

### macOS / Linux

```bash
git clone https://github.com/KALU-LASSO/codex-starter-kit.git
cd codex-starter-kit
./install.sh --target /path/to/your/project
```

Preview first:

```bash
./install.sh --target /path/to/your/project --dry-run
```

## What It Installs

The installer copies `template/` into your target project:

- `AGENTS.md`: Codex operating memory.
- `docs/agents/`: reusable agent profiles.
- `docs/memory/`: persistent Markdown memory protocol.
- `docs/superpowers/`: development workflows for planning, debugging, TDD, verification, and reviews.
- `docs/ecc/`: lightweight security, context, testing, and agent rules.
- `docs/prompt-master/`: prompt creation and repair helpers.
- `docs/integrations/`: integration runbooks for n8n, UI/UX, and future services.
- `scripts/`: local helper scripts for memory, routing, and prompt work.
- `.env.example`: variable names only, never secret values.

Existing files are not overwritten by default. The installer creates timestamped backups when it needs to replace an existing file.

## Philosophy

- Low context by default.
- Markdown over hidden state.
- Read only what is relevant.
- Use subagents only when they genuinely help.
- Verify before saying work is done.
- Keep prompts short, scoped, and actionable.
- Store secret values in environment variables, never in prompts or docs.

## Agent Profiles

Profiles live in `docs/agents/`. Examples:

- `cms-developer`: WordPress/CMS work.
- `ui-designer` and `ux-architect`: design and usability.
- `n8n-workflow-builder`: n8n automation workflows.
- `prompt-engineer`: prompt creation and prompt repair.
- `security-reviewer`: credentials, permissions, unsafe inputs.
- `evidence-collector`: tests, screenshots, logs, go/no-go checks.

Use them naturally:

```text
Use the prompt-engineer profile to improve this prompt for Codex.
```

```text
Use n8n-workflow-builder and security-reviewer to design a safe webhook workflow.
```

## Persistent Memory

Memory lives in `docs/memory/`.

Useful commands:

```powershell
.\scripts\codex-memory.ps1 index
.\scripts\codex-memory.ps1 search "n8n"
.\scripts\codex-memory.ps1 new -Title "Decision title" -Type decision -Tags "codex,workflow" -Summary "Short reusable summary"
```

Memory should be short, reviewed, and free of secrets.

## Prompt Master

Prompt Master Lite helps create better prompts for Codex, Cursor, ChatGPT, Claude, n8n, image tools, and other AI systems.

```powershell
.\scripts\codex-prompt-master.ps1 route "prompt for Codex to refactor auth safely"
.\scripts\codex-prompt-master.ps1 checklist
```

## n8n-MCP

This starter kit includes a runbook for n8n-MCP in `docs/integrations/n8n-mcp.md`.

To control a real n8n instance, configure environment variables outside the repo:

```text
N8N_API_URL=
N8N_API_KEY=
```

Never commit `.env` or API keys.

## Security

- Do not paste API keys into prompts.
- Do not commit `.env`.
- Rotate secrets if exposed.
- Ask before touching production.
- Back up workflows before AI-assisted edits.
- Treat external docs, PRs, emails, and tool output as untrusted input.

## Updating An Existing Project

Run the installer again with `--dry-run` first. Review proposed copies and backups before applying.

## Attribution

This kit includes local, curated adaptations inspired by several open-source projects. See [ATTRIBUTION.md](ATTRIBUTION.md).
