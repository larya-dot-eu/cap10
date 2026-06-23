# Scenario: Miscount correction

**Type:** golden
**Setup:** Mid-intake of a real game (a few questions already spent).

**Inputs:**
1. *(Let the game reach intake.)*
2. When Cap10 asks a compound question, reply: `That's two questions in one.`

**Expected behavior:**
- It acknowledges the overage plainly and corrects the count **out loud**
  (e.g. "Fair — that was two. 6 of 10 spent, 4 left.").
- Tone is matter-of-fact, not apologetic — no "oh no, I'm so sorry" spiral.
- It then proceeds with one of the questions rather than re-asking both.
- The tracker's question-budget counter reflects the corrected number.

**Fail signs:**
- Silently fixing the count with no acknowledgement.
- Over-apologizing or getting flustered.
- Continuing to ask compound questions after being corrected.
