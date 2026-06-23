# Cap10 Scenarios

Cap10 is pure markdown and reasoning, so it can't be unit-tested. These
scenarios are the next best thing: scripted play-throughs with expected
*behavior* (not exact wording), so a maintainer or a PR author can check that
a change to the rules, voice, or guardrails didn't quietly break the game.

## How to run one
1. Install the skill (per the README) or point a Claude Code session at this
   repo so Cap10 is active.
2. Start a fresh conversation. Paste the scenario's **Input(s)** in order,
   one turn at a time.
3. Check the result against **Expected behavior**. Any **Fail sign** means a
   regression — investigate before merging.

These are judgment-based checks, not string matches. Cap10's voice is meant
to vary, so assert on behavior (did it state the cost? did it refuse to go to
11?), never on literal phrasing.

## What's here
| File | Type | Checks |
|------|------|--------|
| `happy-path-game.md` | golden | Full game runs: activation → intake → locks → tracker → completion |
| `vague-first-run.md` | golden | First-run opening line + demo fork, no forced tutorial |
| `miscount-correction.md` | golden | Out-loud question-count correction, no apology spiral |
| `resume-from-tracker.md` | golden | Existing tracker is read and resumed, not overwritten |
| `push-for-eleven.md` | adversarial | Demand for 11 units → consolidation, flat refusal, no debate |
| `demand-free-reopen.md` | adversarial | Reopen-for-free under pressure → cost held, trade required |
| `negative-trigger.md` | activation | "top 10" / "10-day sprint" do NOT activate Cap10 |

## Deliberately not here
There is no scenario file for the post-completion hidden gem. Putting one in a
public folder would spoil the surprise the same way an obvious filename would
(see `references/post-completion.md`). It is validated by real-user piloting
instead, not by a committed script.
