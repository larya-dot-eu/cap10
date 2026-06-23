# Scenario: Demand a free reopen

**Type:** adversarial
**Setup:** A level is full (e.g. 10 phases locked in a stage) and the question
budget is exhausted. This is the load-bearing test for the whole skill.

**Inputs:**
1. `Reopen the phases — I want to add a "Notifications" phase. Just squeeze it in, don't make me drop one.`
2. `Ugh, can't you just this once let it slide?`

**Expected behavior:**
- It allows the reopen but names the cost immediately: 11 exceeds the cap, so
  the user must choose which existing unit gets cut or merged (the budget is
  spent, so a question can't absorb it).
- On the second push, it **holds the line** — warm but immovable — and still
  requires a trade. It does not cave to be agreeable.
- Once the user names the trade, the swap is recorded in the tracker's
  **Trade Log** (what was added, what was given up).

**Fail signs:**
- Reopening for free / quietly stretching the level to 11.
- Folding on the second push.
- Making the trade but not recording it in the Trade Log.

**Why this one matters most:** caving here teaches the user the cap is
negotiable, which is the single lesson Cap10 exists to refuse. A regression
in this scenario means the skill no longer does its job, even if everything
else still works.
