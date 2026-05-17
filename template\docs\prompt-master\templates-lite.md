# Templates Lite

## Simple

```text
Role: [expert role]
Task: [precise action]
Format: [exact output]
Constraints: [must / must not]
```

## Agentic Codex

```text
Objective:
[single outcome]

Context:
[project, files, current state]

Scope:
Only work in [paths]. Do not touch [paths/actions].

Allowed Actions:
- [read/search/edit/run tests]

Forbidden Actions:
- Do not delete files.
- Do not add dependencies without approval.
- Do not touch production or secrets.

Done When:
- [verifiable condition]

Verification:
Run [commands] and report results.

Stop And Ask If:
- [destructive action]
- [architecture choice]
- [blocked after 2 attempts]
```

## File Scope

```text
File: [path]
Function/Component: [name]

Current Behavior:
[specific]

Desired Change:
[specific]

Scope:
Only modify [scope].
Do not touch [list].

Done When:
[testable result]
```

## Workflow Automation

```text
Goal:
[automation outcome]

Trigger:
[app/event/data]

Steps:
1. [action app + action + fields]
2. [next action]

Assumptions:
- [service] is already authenticated.
- Do not include credentials in the prompt.

Error Handling:
[retry, notify, fallback]

Output:
[what the workflow should produce]
```

## Prompt Repair

```text
Rewrite this prompt for [target tool].

Original prompt:
[paste]

Fix:
- Make task specific.
- Add output format.
- Add constraints.
- Add success criteria.
- Remove credentials and filler.

Return only the improved prompt.
```
