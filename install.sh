#!/usr/bin/env bash
set -euo pipefail

TARGET_PATH="$(pwd)"
DRY_RUN="false"
FORCE="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      TARGET_PATH="$2"
      shift 2
      ;;
    --dry-run)
      DRY_RUN="true"
      shift
      ;;
    --force)
      FORCE="true"
      shift
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_ROOT="$REPO_ROOT/template"

if [[ ! -d "$TEMPLATE_ROOT" ]]; then
  echo "Template folder not found: $TEMPLATE_ROOT" >&2
  exit 1
fi

mkdir -p "$TARGET_PATH"
TARGET_PATH="$(cd "$TARGET_PATH" && pwd)"

echo "Codex Starter Kit installer"
echo "Template: $TEMPLATE_ROOT"
echo "Target:   $TARGET_PATH"
if [[ "$DRY_RUN" == "true" ]]; then echo "Mode:     dry-run"; fi

timestamp="$(date +%Y%m%d-%H%M%S)"
installed=0
backed_up=0

while IFS= read -r -d '' file; do
  relative="${file#$TEMPLATE_ROOT/}"
  destination="$TARGET_PATH/$relative"
  destination_dir="$(dirname "$destination")"

  if [[ -f "$destination" ]]; then
    if [[ "$FORCE" != "true" ]]; then
      backup="$destination.bak-$timestamp"
      if [[ "$DRY_RUN" == "true" ]]; then
        echo "Would backup: $destination -> $backup"
        echo "Would copy:   $relative"
      else
        mkdir -p "$destination_dir"
        cp "$destination" "$backup"
        cp "$file" "$destination"
      fi
      backed_up=$((backed_up + 1))
      installed=$((installed + 1))
    else
      if [[ "$DRY_RUN" == "true" ]]; then
        echo "Would overwrite: $relative"
      else
        mkdir -p "$destination_dir"
        cp "$file" "$destination"
      fi
      installed=$((installed + 1))
    fi
  else
    if [[ "$DRY_RUN" == "true" ]]; then
      echo "Would copy:   $relative"
    else
      mkdir -p "$destination_dir"
      cp "$file" "$destination"
    fi
    installed=$((installed + 1))
  fi
done < <(find "$TEMPLATE_ROOT" -type f -print0)

echo ""
echo "Installed files: $installed"
if [[ "$backed_up" -gt 0 ]]; then echo "Backups created: $backed_up"; fi

echo ""
echo "Next steps:"
echo "1. Review AGENTS.md in your target project."
echo "2. Store secrets outside git; never commit .env."
echo "3. Run ./scripts/codex-superpowers.ps1 route \"your task\" in PowerShell, or read docs directly on macOS/Linux."
