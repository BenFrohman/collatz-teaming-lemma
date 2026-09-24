# Tao 2020 notes mapped onto this ledger

Source: Terence Tao, The Notorious Collatz Conjecture (UCLA slides/notes),
https://terrytao.wordpress.com/wp-content/uploads/2020/02/collatz.pdf

This file applies that text to the locked predicates. It does not finish Collatz.

## What Tao states that we already lock

- Map Col = T. Cycle C0 = 1→4→2→1 is the only named cycle.
- A second cycle or a divergent orbit would refute the conjecture. That is our split Δ_cyc vs Δ_div.
- 3n-1 has extra cycles (5-cycle and 17-cycle). A proof of T must use a property C_- does not share. Those cycles stay out of Δ_cyc(T).
- Heuristic: after an odd term the expected next odd is about 3n/4, so mean log-change log(3/4)<0. That is our model mean. Tao treats it as a heuristic, not a Lyapunov.
- Eliahou: a nontrivial cycle is long (his 1993 floor 17,087,915; later floors are larger). Short searches cannot replace that.
- Absence of extra cycles implies |2^a-3^b|→∞. The gap theorem is already a theorem (Baker). It is weaker than Lemma 1: Lemma 1 implies the gap grows, the gap growing does not empty Δ_cyc.

## What Tao 2019 almost-all does not do

Tao (2019): almost every n eventually falls below f(n) for any f→∞, however slowly.

That is not Lemma 2. Almost-all orbits becoming almost bounded leaves a zero-density set of outliers. Δ_div and Δ_cyc live in the leftovers. Terras / Allouche / Korec are the same kind of statement with weaker f. None of them is ∀n ReachesTrivialCycle(n).

## What is useful for the next grind

- Keep Lemma 2_V separate from the heuristic. log(3/4) is Tao’s average valuation, the same object that fails at 27→41.
- Do not import a Lyapunov from the almost-all machinery. Tao says there is no traditional Lyapunov for this discrete map.
- Do not treat |2^a-3^b|→∞ as Lemma 1. It is a consequence one would get after Lemma 1, and it is already known by Baker.
- Do not treat C_- cycles as T-cycles. Tao’s obstruction is exactly that warning.
- FRACTRAN / undecidability of Collatz-like maps: any argument that works verbatim for 3n-1 or for a general affine map is the wrong grain.

## What is not useful for a discharge

Nothing in the notes supplies Δ_cyc=∅ or Δ_div=∅. Tao presents Collatz as open. Applying the notes “to finish the work” stops at: the ledger split matches his split, the heuristic is not 2_V, almost-all is not L.
