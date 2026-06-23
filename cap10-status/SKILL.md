---
name: cap10-status
description: >
  Shows current Cap10 game state at a glance — position, question budget,
  locked vs. pending counts — without entering game flow or asking
  questions.
---

# Cap10 Status

Run when the user types `/cap10-status`. Quick read-only state check.

## Steps

1. Check for `cap10-progress.md` in the cwd. If absent: "No active
   game found."

2. Read frontmatter (`status`, `project`, `started_at`) and game log
   body.

3. Summarize concisely. Do not re-enter game flow or ask questions:
   - **Project:** [name from frontmatter or body]
   - **Started:** [started_at from frontmatter]
   - **Status:** [in-progress / paused / complete]
   - **Questions used:** N of 10
   - **Current position:** deepest in-progress unit
     (e.g. Stage 2 → Phase 3 → Step 1)
   - **Locked vs. pending** at each level
     (e.g. "3 stages locked, 1 in progress, 2 pending")
