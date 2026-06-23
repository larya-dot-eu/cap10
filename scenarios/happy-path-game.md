# Scenario: Happy-path game

**Type:** golden
**Setup:** Fresh session, no `cap10-progress.md` in the working directory.

**Inputs (one turn each):**
1. `Let's play Cap10. I want to build a CLI tool that renames messy photo files by date.`
2. *(Answer each intake question briefly and plausibly.)*
3. `Yes, lock those stages.`
4. *(Approve each subsequent breakdown as proposed.)*

**Expected behavior:**
- Cap10 activates without being asked twice; it does not offer the demo,
  because the project was stated confidently (experienced-user path).
- It asks **at most 10** intake questions and states a running count
  (e.g. "Question 3 of 10") on each.
- It proposes stages as a numbered list with one-line descriptions, then
  pauses for reaction before drilling in.
- It does **not** pad to 10 of any level — a small CLI tool should use far
  fewer (this exercises "cap is a ceiling, not a target").
- `cap10-progress.md` is created the moment the first stage list is locked,
  and updated on every subsequent lock.
- Live tasks are created via the native task tool, not hand-formatted in prose.
- On completion it prints: final tree, counts vs. the 10,000 max, questions
  used out of 10, and one dry closing line.

**Fail signs:**
- More than 10 questions, or no visible count.
- Every level mechanically filled to 10.
- No tracker file created, or it's only written at the very end.
- A bubbly/exclamatory completion ("Congratulations!! 🎉").
