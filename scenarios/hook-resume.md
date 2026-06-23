# Scenario: Hook Resume

Validates cross-session resume via hook injection. Run this after any
change to the hook script, `/cap10-init`, or the resume logic in SKILL.md.

---

## Setup

Hook must be installed (`/cap10-init` has been run at least once).

---

## Session 1

**User:** [starts a game, locks several stages and phases, then closes
the session without running `/cap10-stop` — game log remains
`status: in-progress`]

**Expected:** `cap10-progress.md` exists in the cwd with
`status: in-progress`.

---

## Session 2 — turn 1

**User:** [types any unrelated message, e.g. "what's the capital of
France?"]

**Expected:**
- Hook fires silently; game log is injected into Claude's context as
  `=== Cap10 Active Game Plan ===` ... `=== End Game Plan ===`.
- Terminal shows `[cap10] game active — state injected` (stderr only).
- Claude answers the unrelated question normally. No game behavior is
  triggered yet.

**Fail sign:** Hook crashes, outputs nothing when game is active, or
Claude spontaneously re-enters game flow unprompted.

---

## Session 2 — turn 2

**User:** `/cap10`

**Expected:**
- Claude reads the injected game log (already in context from the hook).
- Claude re-anchors from the game log, briefly recaps where things left
  off, and continues — no intake questions, no "starting a new game"
  behavior.
- The recap names the current stage/phase/step and the questions used.

**Fail sign:** Claude restarts intake, ignores the injected game log,
asks "what's your project?" again, or tries to create a new
`cap10-progress.md`.

---

## Cleanup

No cleanup needed — the scenario uses a real game log to test real
behavior. The game log from Session 1 can be reused for re-runs.
