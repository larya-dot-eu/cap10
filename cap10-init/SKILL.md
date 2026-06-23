---
name: cap10-init
description: >
  One-time global setup that installs a UserPromptSubmit hook to inject
  the active Cap10 game log into Claude's context automatically at the
  start of each session. Run once; works across all projects.
---

# Cap10 Init

Run when the user types `/cap10-init`. Installs the Cap10 session hook.

**Platform note:** Requires macOS or Linux (bash + standard POSIX tools).
Windows is not supported without WSL.

## Steps

1. Check for `jq`:
   ```bash
   command -v jq
   ```
   If absent: "jq is required to update settings.json safely. Install it
   (`brew install jq` or `apt install jq`) and re-run `/cap10-init`."
   Exit without changes.

2. Check if already installed:
   ```bash
   grep -q "cap10-context.sh" ~/.claude/settings.json 2>/dev/null
   ```
   If found: "Already installed." Exit without changes.

3. Create scripts dir:
   ```bash
   mkdir -p ~/.claude/scripts
   ```

4. Write the hook script to `~/.claude/scripts/cap10-context.sh` using
   the Write tool with this exact content:

   ```
   #!/bin/bash
   # Cap10 session context — injects the active game log into Claude's
   # context on every user message. Outputs nothing when no game is active.

   PROGRESS="cap10-progress.md"
   if [ ! -f "$PROGRESS" ]; then exit 0; fi

   STATUS=$(awk '
     /^---/ { if (p) exit; p=1; next }
     p && /^status:/ { gsub(/^status:[[:space:]]*/, ""); print; exit }
   ' "$PROGRESS" 2>/dev/null)

   if [ "$STATUS" = "in-progress" ]; then
     cp "$PROGRESS" ".cap10-backup.md" 2>/dev/null || true
     echo "[cap10] game active — state injected" >&2
     printf '\n=== Cap10 Active Game Plan ===\n'
     cat "$PROGRESS"
     printf '\n=== End Game Plan ===\n'
   fi
   exit 0
   ```

   Then make it executable:
   ```bash
   chmod +x ~/.claude/scripts/cap10-context.sh
   ```

5. Ensure `~/.claude/settings.json` exists:
   ```bash
   [ -f ~/.claude/settings.json ] || echo '{}' > ~/.claude/settings.json
   ```

6. Merge hook entry with jq:
   ```bash
   jq '
     .hooks.UserPromptSubmit //= [] |
     .hooks.UserPromptSubmit += [{
       "matcher": "",
       "hooks": [{
         "type": "command",
         "command": "bash ~/.claude/scripts/cap10-context.sh"
       }]
     }]
   ' ~/.claude/settings.json > /tmp/cap10-settings.json \
   && mv /tmp/cap10-settings.json ~/.claude/settings.json
   ```

7. Confirm: "Cap10 ready. Game state will persist automatically across
   sessions. Run `/cap10` to start."
