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
