# Contributing to Cap10

This isn't a codebase. It's a folder of markdown that tells Claude how to
run a game. There's no build, no tests to run, no CI. Contributing mostly
means improving the rules, the wording, or catching a case the rules don't
handle yet.

## Useful contributions
- A guardrail case we missed (`references/guardrails.md`)
- A voice rule that's too soft, too hype-y, or just not landing
  (`references/voice.md`)
- A clearer or funnier demo project (`references/demo-project.md`)
- A genuine logic gap in `SKILL.md` — something where the rules contradict
  each other, or leave a real scenario undefined

## Not useful
- Application code, package.json, a build step, or CI. The skill is
  intentionally pure markdown and reasoning. Hook scripts in `hooks/`
  installed to `~/.claude/` are acceptable skill infrastructure (plain
  bash, no build, no deps); anything that needs a build step to produce
  the deliverable is the wrong shape for this project.
- Softening the constraint. "Let users reopen things for free" or "make the
  question cap flexible" are not features, they're the thing this skill
  exists to refuse. Pitches that weaken the cap will be declined regardless
  of how reasonable they sound in isolation.

## How to propose a change
Open a PR against `SKILL.md` or the relevant `references/` file. Explain
what scenario you're fixing or what's currently going wrong, not just what
text you're changing. If you're proposing a new rule, say whether it's
load-bearing (forces a real choice or teaches something) or just process —
decorative rules get cut, not added.

Before opening the PR, run the scenarios in `scenarios/` and confirm your
change didn't break any of them — especially `demand-free-reopen.md` (the
reopen cost) and `negative-trigger.md` (activation), the two most fragile
behaviors. These are judgment-based play-throughs, not automated tests; see
`scenarios/README.md` for how to run them. If your change alters intended
behavior, update the affected scenario in the same PR.

## Known open problems
- `references/post-completion.md` calibrates its tone and pacing to a "technical
  signal" read from the user's intake answers. The file now defines signal
  tiers (strong-dev / strong-non-technical / weak-or-absent) and a cautious
  default floor for the common weak/absent case, which closes the worst gap.
  But the tiers are theory, not data: whether they actually catch the
  "non-technical user gets tricked and feels mocked" failure mode is unproven
  until the mechanic is piloted on real strangers of differing skill levels.
  Treat the calibration as mitigated, not solved — refine the heuristics from
  real usage rather than further armchair tuning.

## License
By contributing, you agree your changes are released under the same MIT
license as the rest of the repo.
