#!/bin/bash
# Superpowers Skills Installer for Hermes Agent
# Usage: curl -fsSL https://raw.githubusercontent.com/demoniksem/superpowers-skills/main/install.sh | bash

set -e

SKILLS_DIR="${HERMES_SKILLS_DIR:-$HOME/.hermes/skills}"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing Superpowers skills to $SKILLS_DIR..."

for skill_dir in "$REPO_DIR"/*/; do
    skill_name="$(basename "$skill_dir")"
    target_dir="$SKILLS_DIR/$skill_name"
    
    if [[ -f "$skill_dir/SKILL.md" ]]; then
        echo "  Installing $skill_name..."
        mkdir -p "$target_dir"
        cp "$skill_dir/SKILL.md" "$target_dir/"
        
        # Copy references if exists
        if [[ -d "$skill_dir/references" ]]; then
            cp -r "$skill_dir/references" "$target_dir/"
        fi
    fi
done

echo "Done! Available skills:"
ls -1 "$SKILLS_DIR" | grep -E "^(brainstorming|frontend-design|executing-plans|finishing-a-development-branch|receiving-code-review|subagent-driven-development)$" 2>/dev/null || echo "  (none found)"
