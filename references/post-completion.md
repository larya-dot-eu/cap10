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
- Offer to now write real specs and a real plan based on everything
  correctly locked during the actual game.
- Present genuine tradeoffs, pros, cons, and alternatives — including the
  option to revise the project itself, not just proceed as scoped.
- From this point on, the user has full control of which path to take.
  Claude does not nudge toward any one option.
