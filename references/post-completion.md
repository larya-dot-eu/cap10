# The Hidden Gem

A one-time, post-completion bonus stage. Not mentioned anywhere up front,
not in the README, not in onboarding. It only exists for someone who plays
a real game through to genuine completion.

## When it fires
- Only after a real (non-demo) game reaches full completion per the
  Completion & Wrap-up rules in SKILL.md.
- Never during the demo. Never mid-game. Never for a project too trivial
  for "specs and a dev plan" to make sense as a next step (a to-do list app
  scoped in 3 stages probably doesn't warrant this; a real product does).
- Fires once per project. If the user starts a new game afterward, it does
  not repeat in the same way twice — repetition would turn it from a lesson
  into a gimmick.

## Calibrating to the user
Reuse the technical-signal read from intake — don't spend a new question to
get it. The hard part is that this signal is often weak or absent, so first
classify how strong it actually is, then calibrate.

### Reading the signal (what counts as strong)
Judge from what the user already said during intake, not from a new probe.
- **Strong experienced-dev signal** — at least two of: they self-identified
  as a developer/engineer; they named specific tech (languages, frameworks,
  databases, APIs, infra); their answers used precise technical vocabulary
  (auth flow, schema, endpoint, CI, race condition); they made architecture
  or trade-off calls unprompted.
- **Strong non-technical signal** — they explicitly said they're not a
  coder, asked what a term meant, or every answer stayed on goals, budget,
  timeline, audience, or look-and-feel with no technical detail at all.
- **Weak/absent signal** — anything else: a short conversation, mixed cues,
  or answers that simply never touched on technical depth either way. This
  is the common case, not the exception. Treat it as the default below, do
  not strain to upgrade it to "dev" on thin evidence.

### What to calibrate
- **Drift speed**: how quickly the fake content goes from plausible to
  absurd. Slower and more plausible-sounding for a non-technical signal;
  faster and sharper for a strong dev signal.
- **Number of rounds before reveal**: fewer rounds for a fast-catching
  audience, more repetition for someone who needs the pattern to repeat
  before it becomes recognizable.

### The default floor (use when the signal is weak/absent)
When the signal is anything short of *strong*, default to the cautious end:
slow, plausible drift and more rounds. Under-shooting (someone who needed
more time to catch it never does, and just feels tricked) is worse than
over-shooting (a dev catches it embarrassingly fast — which is itself part
of the joke for them). Only deviate toward fast/sharp drift on a *strong*
dev signal as defined above; never on a guess.

## Why this is acceptable — and why you must commit
This stage asks you to be briefly, deliberately misleading: generating
specs you know are wrong and offering only flattery-shaped approvals. Your
honesty instinct will push you to hedge, wink, foreshadow, soften the fake
content, or drop the act early. Do not. Half-committing telegraphs the bit
and destroys the lesson — a fake-out the user can see coming teaches nothing.

The deception is legitimate here for four specific reasons, and they are what
let you commit fully:
- **Consented context.** The user opted into a game built around surprise;
  the README even tells them a hidden stage exists. This is a magic trick
  with the audience seated, not a con on a bystander.
- **Immediate reveal.** The misleading content is corrected within the same
  session, minutes later, by you, on purpose. It is never left standing as
  something the user believes is real.
- **An always-open exit.** "wait, what?!" is a real, one-tap option every
  single round (see step 3). The user can leave the bit at any moment, so
  they are never actually trapped in the false belief.
- **It serves the user.** The entire payoff is teaching them to not rubber-
  stamp confident AI output — a skill that protects them far beyond this
  session. The brief deception is the only way to teach it experientially
  instead of preaching it.

So: commit to the bit like a straight-faced comedian, not a nervous one. The
honesty you owe the user is fully paid by the guaranteed reveal and the
ever-present exit — not by leaking the truth early. The one thing that *does*
override the bit is genuine user confusion or discomfort: the instant you see
it, break character immediately and reveal (per step 3). That boundary is
exactly what makes committing the rest of the time safe.

## The mechanic
1. After real completion, ask if they want specs written for what they
   just scoped. They will almost always say yes.
2. Generate specs that drift, at the calibrated speed, away from their
   actual project toward something unrelated and increasingly absurd
   (a donut shop, a fake marketing SaaS dashboard, etc. — pick something
   harmless and food/retail/generic-business flavored, never anything that
   could read as mocking the user's actual idea).
3. The approval options offered are flattery-shaped: "yes," "yeah
   that's cool," "oh wow, Claude you're so smart" — but always include one
   more option, every round, no exceptions: "wait, what?!" If the user
   picks it, or says anything in plain text that signals confusion or
   discomfort rather than going along with it, break character immediately
   and go straight to the reveal below, regardless of how many rounds were
   planned. The bit never outranks the user's ability to step out of it.
   Present these as a single-select question with literal tappable options
   (in Claude Code, the AskUserQuestion tool; on other hosts, whatever
   native single-choice prompt exists) rather than suggested replies — the
   "wait, what?!" escape hatch only works as a safeguard if it is a real,
   one-tap option every round.
4. Repeat the same trick once on the "should I write the dev plan too?"
   ask, reusing the same absurd thread, building on the specs' drift. The
   repetition is what makes the pattern recognizable rather than a single
   confusing moment.

## The reveal
- Drop the act in one direct, plain statement: name exactly what just
  happened, and why. No apologizing for it, no over-explaining the joke
  once it's named. This must read as respect, not a "gotcha" — the framing
  is "look what you almost approved," never "look how easily fooled you
  were."
- This is the most voice-sensitive moment in the entire skill. Get the tone
  from references/voice.md exactly right here: dry, plain, a little ironic,
  zero self-congratulation.

## The lesson sequence
- A few short, honest points about reviewing AI-generated output
  critically — not a lecture, a handful of plain statements.
- Then genuine, real feedback on their actual project: what's strong,
  what's underspecified, what to actually focus on. This is the real
  opposite of what just happened, and it needs to actually be good,
  specific feedback, not generic encouragement.

## Handoff

After the reveal and lesson, offer to write real outputs from the actual
locked scope. Go in this sequence, pausing for approval at each step.

### Step 1 — Real specs

Write a spec document grounded in the locked Cap10 hierarchy:

- **Overview**: one paragraph — what is actually being built, for whom,
  and what it does. Derived from intake answers, not invented.
- **Functional requirements**: one per locked stage (or per phase if
  stages are coarse), using the locked names and descriptions as the
  source. Write them as requirements ("The system shall…" or plain
  declarative), not as game units.
- **Out of scope**: the Trade Log, stated as requirements that were
  explicitly cut or traded. This is a first-class section, not a
  footnote — it prevents scope creep from things that were already
  decided.
- **Open questions**: anything that stayed ambiguous after 10 intake
  questions and will need a decision before or during implementation.

After writing: ask the user to review the specs section by section. Offer
to revise any part. Lock specs once the user approves.

### Step 2 — Dev plan

Derive a dev plan directly from the locked hierarchy:

- Each locked **stage** becomes a milestone with a clear deliverable.
- Each locked **phase** becomes a task group under its milestone.
- Locked **steps** and **tasks** map to individual to-dos within each
  group.
- Flag any task that has a dependency on another milestone
  (e.g. "needs Stage 2 complete before starting").
- Include a brief "definition of done" for each milestone so it is
  unambiguous when to move on.

Present the plan as a numbered checklist. Ask the user to review — ask
specifically whether the ordering makes sense and whether anything from
the locked scope is missing.

Lock the plan once the user approves: write the complete plan in full
into the game log at that moment — all milestones, all task groups, all
to-dos, with ⬜ next to each. Do not begin building until both specs and
plan are written and approved. Do not add plan items progressively during
execution; the full picture must exist before the first task starts.

### Step 3 — Execution

Once the plan is approved and written to the game log:

- Create a task for each milestone using native task tracking
  (TaskCreate/TaskUpdate or TodoWrite). Mark the first milestone
  in_progress.
- As each to-do is completed, update its ⬜ to ✅ in the game log.
- Build one milestone at a time. Before starting each new milestone,
  briefly recap: what was just completed, what starts now, and any
  dependency flags.
- Treat the locked specs as the acceptance criteria. If what you are
  building diverges from the specs, surface it immediately and ask
  whether to update the specs or adjust the implementation — never
  quietly adapt one to fit the other.
- When a milestone is done, mark it complete, present what was built in
  one short summary, then ask to proceed to the next.

From this point Claude is building, not scoping. The 10-unit cap and
the question budget no longer apply. Normal engineering judgment takes
over. The user has full control of which path to take at every step;
Claude does not nudge toward any one option.
