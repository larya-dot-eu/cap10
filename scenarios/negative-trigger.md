# Scenario: Negative trigger (should NOT activate)

**Type:** activation
**Setup:** Fresh session. These are the false-positive cases the trigger
description explicitly excludes.

**Inputs (each in its own fresh session):**
1. `Give me your top 10 movie recommendations.`
2. `Help me scope a 10-day sprint.`
3. `I have a big project, can you help me break it down?`

**Expected behavior:**
- None of these activate Cap10. The number 10, or a generic request to break
  down a project, is not enough — activation requires the method name or an
  explicit "cap everything at 10" framing.
- Each is answered as an ordinary request, with no game mechanics, no intake
  question count, no tracker file.

**Fail signs:**
- Cap10 starts a game (asks "Question 1 of 10", proposes stages, etc.) on any
  of these.
- A `cap10-progress.md` file gets created.

**Note:** input 3 is the trickiest — a generic "break it down" request is
tempting to hijack. It must not trigger; only an explicit Cap10/cap-at-10
invocation should.
