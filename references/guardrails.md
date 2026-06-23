# Guardrails

## Ambiguous activation
If it's unclear whether the user wants to play Cap10 (a loose mention of
"10" without clear intent), ask one clarifying question before activating.
This question does not count against the 10-question intake budget — that
budget governs scoping a confirmed game, not confirming whether to start one.

## Resuming and starting fresh
If `cap10-progress.md` already exists, read its `status` frontmatter field:

| Value         | Set by                  | Hook behavior   |
|---------------|-------------------------|-----------------|
| `in-progress` | game log creation       | injects context |
| `paused`      | `/cap10-stop`           | silent          |
| `complete`    | Completion flow         | silent          |

- **`status: paused` on `/cap10`** — set back to `in-progress`, re-anchor
  from the game log, briefly recap where things left off, and continue.
  Do not re-run intake.
- **`status: complete` on `/cap10`** — do not resume. Offer `/cap10-new`
  instead.
- **No `status` field** (legacy game log without frontmatter) — treat as
  `in-progress` and resume normally.

If the user explicitly asks to start fresh, direct them to `/cap10-new`,
which archives the old game log before starting rather than overwriting
silently.

## Adversarial or rule-testing behavior
- If the user demands more units than the cap allows: state the count
  plainly as fact and require a merge or a push-down, per the Hierarchy
  Rules. Do not debate whether the cap is fair.
- If the user wants to skip checkpoints entirely: allowed, but reopen costs
  still apply retroactively to anything locked this way. Skipping
  checkpoints does not mean skipping consequences.
- If the user argues the cap shouldn't apply to their case: it applies
  regardless. This is the one place stubbornness is correct — a cap that
  bends under pressure isn't a real constraint.
- Reopen stalemate (budget exhausted, user won't name a cut and won't drop
  the reopen): do not resolve it by caving or by stretching the level past
  10. State the two honest options plainly — name a unit to cut/merge, or
  leave the level as locked and move on — and hold there until the user
  picks. The unmade choice stays the user's to make; an indefinite stall is
  preferable to a silently broken cap.

## Degenerate project sizes
- If the project is too trivial for real subdivision (e.g. a single email),
  say so plainly rather than forcing a fake structure onto it.
- If the project is too vast to honestly fit even after consolidation (e.g.
  an entire operating system), say so, and reframe the game as scoping a
  first slice rather than pretending 10,000 units can capture the whole
  thing.

## Ambiguous or contradictory answers
- A one-word or non-answer during intake does not spend a question if it
  conveyed no real information. Ask a sharper follow-up instead of guessing.
- If two answers contradict each other, flag the contradiction directly and
  ask which one stands. Do not pick a side silently.

## Game log integrity
- If the game log is missing mid-game but conversation context makes the
  state clear (including hook-injected context from a prior session),
  recreate the file from that context rather than restarting or panicking.
- If the game log exists but conflicts with what you recall from the
  conversation, trust the file — it is the documented source of truth —
  but flag the discrepancy once rather than silently picking a side.
- **Hook active, game log deleted** — hook outputs nothing (file check
  fails silently). If `/cap10` is then invoked with no game log but
  in-context evidence of a game (e.g. hook-injected content from an
  earlier turn in the same session), apply the "recreate from context"
  rule above.

