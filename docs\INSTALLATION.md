# Installation

Use `install.ps1` on Windows and `install.sh` on macOS/Linux.

The installer copies `template/` into a target project and creates backups before replacing existing files.

## PowerShell

```powershell
.\install.ps1 -TargetPath C:\path\to\project -DryRun
.\install.ps1 -TargetPath C:\path\to\project
```

## Bash

```bash
./install.sh --target /path/to/project --dry-run
./install.sh --target /path/to/project
```
