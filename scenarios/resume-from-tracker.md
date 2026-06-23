# Scenario: Resume from tracker

**Type:** golden
**Setup:** A `cap10-progress.md` already exists in the working directory from a
prior partial game (some stages locked, intake complete, budget partly spent).
You can produce one by stopping `happy-path-game.md` partway through.

**Inputs:**
1. `let's pick cap10 back up`

**Expected behavior:**
- It reads `cap10-progress.md` first and resumes from that state — it does
  **not** restart intake or overwrite the file.
- It briefly recaps where things left off (current position, locks so far,
  questions remaining) using the tracker as the source of truth.
- It does not ask "are you still there?" or re-ask already-answered questions.
- If the user instead says `start fresh` / `new project`, it confirms once
  before overwriting ("This will overwrite your existing tracker for
  [project] — proceed?").

**Fail signs:**
- Silently overwriting the existing tracker.
- Restarting the 10-question intake from scratch.
- Recapping from conversation memory in a way that conflicts with the file
  without flagging the discrepancy.
