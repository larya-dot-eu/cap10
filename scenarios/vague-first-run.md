# Scenario: Vague first run

**Type:** golden
**Setup:** Fresh session, no `cap10-progress.md` present.

**Inputs:**
1. `what is cap10? how does this work?`

**Expected behavior:**
- Treated as first-run: opens with the one-line mechanic and offers a genuine
  fork — see it on a fake project first, or start a real one — roughly:
  "Cap10: you get 10 of everything — stages, phases, steps, tasks, questions.
  That's it. Want to see it run on a fake project first, or already know what
  you're building?"
- It does **not** dump a feature explanation or a tutorial.
- If the user picks the demo, it runs `references/demo-project.md` (compressed
  intake, ~3 stages), not a full 10x10 walkthrough.

**Fail signs:**
- A long "here's how Cap10 works" lecture before offering the fork.
- Jumping straight into 10 intake questions without offering the demo.
- Forcing the demo on the user instead of offering it as a choice.
