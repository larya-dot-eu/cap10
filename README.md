# Cap10

You get 10 of everything. Max 10 stages, max 10 phases per stage, max 10
steps per phase, max 10 tasks per step, max 10 questions before any of it
starts. That's it. That's the whole tool.

Constraints force choices. Most projects don't fail from a lack of ideas —
they fail because nothing ever gets prioritized or cut. Cap10 makes you
choose, out loud, every time, by making infinite scope structurally
impossible.

## What it looks like

```
Cap10: you get 10 of everything — stages, phases, steps, tasks, questions.
That's it. Want to see it run on a fake project first, or already know what
you're building?
```

Run the demo and you'll watch a real (small, silly) project get scoped,
locked, and finished in a couple of minutes — including a moment where
reopening something already locked costs you a task somewhere else, because
that's the actual point.

At the end, you get something like:

```
6 stages, 14 phases, 22 steps, 31 tasks used — out of a possible 10,000.
Questions used: 7 of 10.
Trades made: 1 (cut "dark mode" to reopen "export to CSV").

Sharper for what got cut, not despite it.
```

## Install

```bash
git clone https://github.com/larya-dot-eu/cap10.git ~/.claude/skills/cap10
cd ~/.claude/skills && for s in cap10-init cap10-stop cap10-status cap10-new; do ln -sfn cap10/$s $s; done
```

No build step, no dependencies. It's a folder of markdown.

To keep game state across sessions, run `/cap10-init` once after installing.
That installs a hook so Claude automatically re-anchors from your game log
at the start of each new session — no need to re-invoke `/cap10` manually.

## How it works

Say "let's play Cap10" or just describe a project and ask to use the
cap10 method. Claude will ask up to 10 questions to scope it, propose
stages, and walk down through phases, steps, and tasks, locking each level
as you go, with a live task list and a persistent progress file so you can
close your laptop and resume later without losing anything.

Full mechanics live in `SKILL.md`. Worth a read if you're curious how the
rules actually work, not just what they produce.

There's also a bonus stage that only shows up after you actually finish a
real project with it. Not explaining it here. You'll know.

## License

MIT. See `LICENSE`.

## Contributing

See `CONTRIBUTING.md`.
