---
name: cap10-new
description: >
  Archives the current Cap10 game log and starts a fresh game. Keeps
  history rather than overwriting silently.
---

# Cap10 New

Run when the user types `/cap10-new`. Archives the existing game log
and hands off to normal `/cap10` intake.

## Steps

1. If `cap10-progress.md` does not exist: skip to step 5.

2. Read `project` name and `status` from frontmatter.

3. If `status` is `in-progress` or `paused`: confirm once before
   archiving: "This will archive your in-progress game for [project] —
   proceed?" If the user declines: exit without changes.

4. Archive and remove:
   ```bash
   cp cap10-progress.md "cap10-archive-$(date +%Y%m%d-%H%M%S).md"
   rm cap10-progress.md
   ```
   (`status: complete` games are archived without extra confirmation —
   the game is already done.)

5. Hand off to normal `/cap10` new-game intake.
