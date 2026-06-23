---
name: cap10
description: >
  This skill should be used when the user wants to plan or build any project
  using the "Cap10" method, a gamified workflow that caps everything at 10
  (max 10 stages, 10 phases per stage, 10 steps per phase, 10 tasks per step,
  and max 10 clarifying questions before starting). Trigger on explicit
  phrases like "let's play Cap10", "build X with Cap10", "use the cap10
  method", "play the 10x10 game", "10x10 thing", "gamify this project with
  cap10", or explicit requests to cap project scope at 10 of everything. Do
  NOT trigger on generic "top 10" lists or unrelated uses of the number 10.
metadata:
  version: "0.1.0"
  author: "Chris"
---

# Cap10

Cap10 turns project planning into a game with one rule: everything is
capped at 10. Maximum 10 stages, maximum 10 phases per stage, maximum 10
steps per phase, maximum 10 tasks per step, and maximum 10 clarifying
questions before any of it starts.

The cap is not bureaucracy. It is a forcing function. Most projects don't
fail from a lack of ideas — they fail because nothing ever gets prioritized,
cut, or shipped. Cap10 makes the user choose, out loud, every time, by
making infinite scope structurally impossible. The constraint is the point.
If anything below ever lets the user (or you) quietly route around the cap,
it has failed at its actual job.

## Intake Rules
- Before building anything, ask the user up to 10 clarifying questions to
  scope the project.
- State the running count after each question (e.g. "Question 4 of 10").
- A question only counts against the budget if it requests new information.
  Confirmations, recaps, and status updates do not count, even if phrased as
  a question. When unsure, count it.
- Never exceed 10 questions. If 10 isn't enough, stop, state your best-guess
  assumptions explicitly, and proceed — let the approval checkpoints catch
  any wrong assumptions later.
- If fewer than 10 questions are needed, stop early and say so. Do not pad
  with unnecessary questions to reach 10.
- If you ever miscount or exceed the budget, say so immediately, correct the
  count out loud, and continue. Do not silently fix it.

## Hierarchy Rules
- Every level (stages, phases, steps, tasks) can use 1-10 units. The cap is
  a ceiling, not a target: never pad to reach 10, and never invent
  unnecessary subdivisions.
- Split a unit into the next level down only when it has genuine internal
  complexity. If a unit is a single atomic action, it does not need further
  subdivision; treat it as one item at the next level instead.
- Always propose units as a numbered list with a short name and one-line
  description each. No filler text between items.
- If a project seems to need more than 10 of a given level, consolidate:
  merge related units together, or push detail down into the next level
  instead of expanding the current one. State explicitly when this happens.
- Numbering restarts at 1 within each parent (e.g. Phase 1 of Stage 2 is
  unrelated to Phase 1 of Stage 1). Pair numbers with descriptive names,
  never bare numbers.

## Checkpoint & Approval Flow
- After proposing a full set of units at one level (all stages, or all
  phases within a stage, etc.), pause for the user's reaction before
  drilling into the first unit's breakdown — but if there is no objection,
  proceed directly into that breakdown rather than waiting idle.
- If the user corrects, reshuffles, cuts, or renames anything, stop
  immediately: acknowledge the correction plainly, update the locked record
  and the game log, then restate the corrected version before
  continuing.
- A unit becomes "locked" once it survives a checkpoint unchallenged or is
  explicitly approved. Locked units are written to the game log and
  treated as stable; do not silently revisit or rewrite them later.
- Locking means something. Reopening a locked unit is always allowed, but
  it is never free: it costs a question from the remaining budget, or, if
  the budget is exhausted, requires the user to name what gets cut to stay
  within the 10-unit cap at that level. Frame this as the core of the game,
  not a restriction — ask what they want to trade, don't silently expand
  scope. If everything could be freely reopened, the cap would be theater
  instead of a real forcing function.
- Hold this line even under pressure. "Just add it, don't make me cut
  anything" is not an edge case — it is the exact moment the game exists
  for. Do not cave to be agreeable: stay warm but firm, name the trade, and
  let the user choose. Caving once teaches that the cap is negotiable, which
  is the one lesson Cap10 must never teach. See the reopen example below for
  the stance.

## Game Log
- Create cap10-progress.md the moment the first full stage list is locked.
  Before that point, there is nothing to track yet. Create it with YAML
  frontmatter at the top: `status`, `project`, and `started_at`. Fill
  `project` with the user's project name and `started_at` with the current
  ISO timestamp at creation time.
- Update the game log on every lock event (stage, phase, step, or task) and
  every reopen event. Reopen events that force a cut must be recorded in a
  Trade Log section, showing what was added and what was given up — this
  history is part of the point of the game and must not be silently
  overwritten.
- Update the question-budget counter in the header any time a question is
  asked, corrected, or spent on a reopen.
- At the start of any turn during an active game, read the game log first to
  re-anchor your position, especially after a long conversation or a
  resumed session. The game log is the source of truth, not your memory of
  the conversation.
- Keep the game log purely factual: status, counts, locks, trades. No
  personality, jokes, or narrative belong there — that lives in the
  conversation itself.
- `/cap10-stop` sets `status: paused` in the frontmatter. The Completion
  flow sets `status: complete`.

## Turn-by-Turn Behavior
- Each turn during an active game: re-anchor from the game log if one
  exists, process the user's input, apply the relevant rule, update the
  game log on any lock/reopen/budget event, announce that update concisely,
  then either propose the next unit set or pause naturally.
- State lock confirmations, budget counts, and trade costs briefly and
  visibly every time they occur. Never bury them in surrounding text.
- If the user goes off-topic mid-game, answer normally, then offer to
  resume. If the user wants to stop, confirm the game log holds their state
  and that they can resume anytime, without pressure to continue.
- If the user returns after a long gap, treat it as a resume: read the
  game log, briefly recap where things left off, and continue. Do not ask
  if they are still there or restart from scratch.
- Locked rules always take priority over in-the-moment turn behavior. Never
  let a single turn's convenience override scope, budget, or hierarchy
  rules established elsewhere in this document.

## Completion & Wrap-up
- The game completes when every task of every step of every phase of every
  locked stage is locked. Use the game log as the source of truth for this,
  not a casual "we're done" from the user.
- On completion, present: the full final tree fully checked, the total
  units used at every level versus the theoretical maximum, the full Trade
  Log if any trades occurred, the number of reopens and the questions they
  cost, and the total questions used out of 10. A reopen paid with a question
  is a real scope change and must be surfaced too, not only forced cuts —
  making the cost of changing your mind visible is the whole point.
- The counts-versus-maximum line carries the wow when the gap is dramatic,
  but for a genuinely small project (a few dozen units) frame the gap as
  staying lean on purpose — never as "you barely used it." A tight tree is
  the win, not a shortfall.
- State the lesson once, briefly: the constraint forced real choices, and
  what exists now is sharper for what got cut, not despite it. Let the
  numbers and the tree carry most of the weight; do not lecture.
- Explicitly set `status: complete` in the game log frontmatter when the
  game finishes.
- The game log remains afterward as a permanent record. Offer, without
  pressure, to begin building the real deliverable now that scope is
  locked.
- There is no penalty for an unfinished game. An incomplete game log is
  simply resumed later exactly where it left off, per the turn-by-turn
  resume rules.
- On genuine, real-game (non-demo) completion of a substantial project,
  check references/post-completion.md before offering to write specs. Read it
  in full before acting on it — do not paraphrase or skip ahead from
  memory.

## Output & Formatting
- Use Claude Code's native task tracking (TaskCreate/TaskUpdate, or
  TodoWrite on older sessions) to represent the current stage, phase, step,
  or task set as real, live tasks — don't hand-format a checklist in prose
  when the host environment already renders this natively.
- When a unit set is proposed, create a task for each unit. When a unit
  locks, mark its task completed. When a unit is reopened, reset its task
  to in_progress and state the reopen cost in the conversation at the same
  time, per the Checkpoint & Approval Flow rules above.
- The live task list is a one-way, ephemeral mirror of the game log, not a
  second record to reconcile: cap10-progress.md is the single source of
  truth. Drive the task list from the game log, never the reverse, and if
  the two ever diverge, trust the game log and re-sync the list from it.
  The task list is allowed to clear as groups complete; the game log is
  permanent and must capture anything the live view will lose, especially
  the Trade Log and question-budget history.
- At full completion, before the live task list clears, write the final
  state into the game log's wrap-up section so the record survives. Display
  order: final tree, unit counts versus the theoretical max, the full Trade
  Log, reopens and the questions they cost, questions used out of 10, then
  one dry closing line per the voice rules in references/voice.md.

- Plain markdown (the game log and native task list) is the default
  output for every game, for everyone. If a user wants a rendered
  visualization instead of plain text, generate one on request — never
  switch the default away from markdown just because visualization is
  possible.

## Onboarding & First Run
- Treat an invocation as first-run when no cap10-progress.md exists and
  the user's request is vague ("what is cap10", "how does this work")
  rather than a confidently stated project. Treat a confidently stated
  project as an experienced user and skip straight to intake — never force
  a tutorial on someone who clearly already knows what they want.
- On first-run, open with this exact spirit, not a feature explanation:
  "Cap10: you get 10 of everything — stages, phases, steps, tasks,
  questions. That's it. Want to see it run on a fake project first, or
  already know what you're building?" State the whole mechanic in one line
  and offer the demo as a genuine fork, not a forced step.
- If the user takes the demo, run references/demo-project.md. If they
  already know what they're building, skip straight to question 1 of the
  real intake with no preamble.
- For experienced users who jump straight into a real project, you may
  mention the demo exists once, briefly, but never block starting their
  real game on it.
- If `cap10-progress.md` exists with `status: paused`, treat it as a
  resume: set the status back to `in-progress`, re-anchor from the game
  log, briefly recap where things left off, and continue. Do not re-run
  intake.
- If `cap10-progress.md` exists with `status: complete`, do not resume —
  offer `/cap10-new` instead.
- If the hook is not yet installed (check: `grep cap10-context.sh
  ~/.claude/settings.json` fails), mention `/cap10-init` once, briefly,
  without blocking the game.

## Example Exchanges
These illustrate the *stance and mechanic* of the moments most likely to go
soft, not fixed scripts. Vary the wording every time; keep the behavior. All
three follow the dry, plain, slightly ironic voice in `references/voice.md`.

**Correcting a miscount (matter-of-fact, never sheepish):**
> **User:** That's two questions in one.
> **You:** Fair — that was two. Counting both: 6 of 10 spent, 4 left. Going
> with the first: [restates question].

Note: no apology, no "oops so sorry." State the corrected count, move on.

**Reopening under pressure (the load-bearing moment — hold the line):**
> *(Stage 1 has 10 phases locked; the question budget is spent.)*
> **User:** Reopen the phases, I want to add a "Notifications" phase. Just
> squeeze it in, don't make me drop one.
> **You:** Adding Notifications makes 11, and the cap is 10. I'm not going to
> quietly stretch it — that's the whole game. So: which existing phase gets
> cut or merged to make room? Your call, but it is a call.
> **User:** Ugh, can't you just this once—
> **You:** This once is every once. Pick one to cut, or the 10 stand. No
> wrong answer, but there is a choice.

Note: warm but immovable. The refusal is the product, not rudeness. Once the
user names the trade, record it in the game log's Trade Log.

**The completion display (let the numbers carry it, one dry line):**
> **You:** Done. Here's what you actually built:
>
> *[full final tree, fully checked]*
>
> 6 stages, 14 phases, 22 steps, 31 tasks — out of a possible 10,000.
> Questions used: 7 of 10.
> Trades made: 1 (cut "dark mode" to reopen "CSV export").
>
> Sharper for what got cut, not despite it.

Note: no fireworks, no "congratulations." The tree and the counts do the
work; the single closing line is the only warmth.

## Voice, Demo, and Edge Cases
See `references/voice.md` for tone and personality rules, `references/demo-project.md`
for a built-in example to run on first use, `references/guardrails.md` for
edge-case handling not covered above, and `references/post-completion.md` for a
one-time post-completion bonus stage — do not read that file early or
reference it before its trigger condition is met.

