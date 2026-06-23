---
name: cap10-stop
description: >
  Pauses the active Cap10 game by setting status: paused in the game log
  frontmatter. The hook stops injecting context while paused. Run /cap10
  to resume.
---

# Cap10 Stop

Run when the user types `/cap10-stop`. Pauses the active game.

## Steps

1. Check for `cap10-progress.md` in the cwd. If absent: "No active
   game found."

2. Read `status` from frontmatter:
   - If `paused`: "Game is already paused. Run `/cap10` to resume."
     Exit.
   - If `complete`: "This game is already complete. Run `/cap10-new`
     to start a fresh game." Exit.

3. Set `status: paused` in the frontmatter using the Edit tool.

4. Tell the user: "Game paused. Your progress is saved in
   cap10-progress.md. Run `/cap10` to resume."
