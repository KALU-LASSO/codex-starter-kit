# n8n-MCP

Use this when Codex needs to design, validate, create, or update n8n workflows.

## Required Variables For Real n8n Control

```text
N8N_API_URL=
N8N_API_KEY=
```

Without these variables, use n8n-MCP for documentation, node discovery, templates, and validation only.

## Token-Efficient Workflow

1. Search templates first.
2. Use minimal or standard node details before full.
3. Validate nodes before validating the workflow.
4. Prefer partial updates for existing workflows.
5. Ask before activating, deleting, or touching production workflows.

## Safety

- Never commit n8n API keys.
- Back up production workflows.
- Do not expose unauthenticated public webhooks without explicit approval.
