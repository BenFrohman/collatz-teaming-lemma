# Ledger — cycles are closed; blocks are paths

Collatz is not “every path is a cycle.” It is: every positive orbit reaches the trivial cycle 1→4→2→1. That splits as

- no other cycle (Δ_cyc = ∅),
- no divergent infinite path (Δ_div = ∅).

Those are different sets. A path to 1 is not a cycle. An infinite climbing path is not a cycle.

An m-cycle is one closed orbit that decomposes into m blocks. Each block is a path of the shape odd-ascent then even-descent. The block is a path; the m-cycle is those paths glued until they close. If the loop does not close, Simons’ system has no solution and the object is not a 2-cycle.

| Object | Status |
|---|---|
| D | dichotomy: every orbit is eventually periodic or unbounded — proved |
| R | Collatz ↔ (Δ_cyc=∅ ∧ Δ_div=∅) — proved |
| Path 1→4→2→1 | the trivial cycle (a closed path) |
| Proposition 1.1 | only 1-block cycle is that one |
| Simons 2005/2007 | no 2-block closed orbits |
| Lemma 1 | Δ_cyc=∅, every closed orbit, any number of blocks — open |
| Lemma 2 | Δ_div=∅ — open; not proved, not disproved |
| Lemma 2_V | a Lyapunov falling at every odd-to-odd step off a finite set — stronger than Lemma 2; n and log fail; not the definition |
| Lemma L | ∀ n>0 reaches {1,2,4} — open; needs D, R, Lemma 1, Lemma 2 |

Lemma 1 is still about cycles. Lemma 2 is empty divergence, not a V.
