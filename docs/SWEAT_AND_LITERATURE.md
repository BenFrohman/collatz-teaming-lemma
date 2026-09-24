# Full grind record — 24 September 2026

Author: Benjamin Stanley Frohman. This file deposits the agent-grind screenshots into the ledger.
It is not a proof of Collatz. Lemma 1, Lemma 2, and Lemma L stay open.

## Scaffold (locked)

- D: every positive orbit is eventually periodic or unbounded. Proved.
- R: CollatzConjecture ↔ (Δ_cyc=∅ ∧ Δ_div=∅). Proved.
- Lemma 1: Δ_cyc=∅. Open.
- Lemma 2: Δ_div=∅. Open. Not a Lyapunov.
- Lemma 2_V: some V falls at every odd-to-odd step off a finite F. Stronger than Lemma 2. Open. Tested instances fail.
- Lemma L: every n>0 reaches C0. Open. Needs D, R, 1, 2.

Named cycle only: C0 = (1 → 4 → 2 → 1). Bound on that orbit: max = 4.

The outdated table row “Lemma 2 / Lyapunov = descent along paths” is retired. Use the split above.

---

## Lemma 1 sweat — literature (constraints, not emptiness)

These bound a hypothetical extra cycle. None of them is Δ_cyc=∅.

- Steiner: no nontrivial 1-cycle. The only 1-block cycle is C0 (Proposition 1.1). Uses 2^2 − 3 = 1.
- Simons 2005/2007: no 2-block closed orbit.
- Simons–de Weger, then Hercher: no m-cycle for m ≤ 91.
- Eliahou: if an extra cycle exists, its period has the form 301994a + 17087915b + 85137581c with b ≥ 1 and ac=0 (given a large minimum).
- Eliahou fraction 301994/190537 is a convergent of log_2 3. That is why cycle length is forced onto that arithmetic. It is not itself a cycle.
- Grind citation “Wikipedia 2025 shortcut”: period floor on the order of 2.18×10^11 (217,976,794,617). Secondary source; treat as a pointer, not a primary theorem.
- Barina: no extra cycle meets {1,…,2^71−1}. If Δ_cyc ≠ ∅ then every point of it is > 2^71.

Catalan / Mihăilescu: the only solution of 2^a − 3^b = ±1 in the relevant small range is the trivial-cycle identity 2^2 − 3 = 1. That is Steiner’s K=1 case, not a new cycle.

Continued-fraction window of log_2 3 (Eliahou windows, not solutions):

    2/1, 3/2, 8/5, 19/12, 65/41, …

Close (K,L) pairs with L/K near log_2 3 exist (examples from the grind: 5/8, 17/27, 22/35 and 3/5, 5/8, 6/10). They are CF neighbors. They are not cycles by themselves. A cycle still has to close on an integer start.

2^L − 3^K at large convergents overflows naive integer-to-string conversion (4300-digit cap in one grind REPL). That is a machine limit, not a theorem.

Not in Δ_cyc:

- the three positive cycles of C_− (3n−1),
- the 5n+1 cycles.

Those are different maps. Conjugacy C_−c(n)=−C_c(−n) sends negative 3n+1 cycles to positive 3n−1 cycles. They say nothing about Δ_cyc for T = C_+1 on positives.

### Structural properties of Δ_cyc (if nonempty)

- Invariant under n → 2n. If n ∈ Δ_cyc then 2^k n ∈ Δ_cyc. Nonempty ⇒ infinite.
- Closed under the odd inverse (m−1)/3 when m ≡ 4 (mod 6).
- Disjoint from Pred(1), the inverse tree of C0.
- On any extra cycle the product of multipliers is 1, so realized log-drift is exactly 0.

These properties do not empty the set.

---

## Lemma 1 sweat — finite searches (not Simons, not Lemma 1)

- Odd-to-odd cycle search on starts 1..5000 with K ≤ 300: only the core {1}.
- Odd starts < 20,000: only S_3-cycle is {1}.

A search of 1..N cannot see a cycle that never intersects [1,N]. Barina already places any extra cycle above 2^71. These searches do not replace Simons or Hercher.

---

## Lemma 2 sweat — failed V, named orbit of 27

S_3(n) = (3n+1)/2^{v_2(3n+1)} on odd n.

Failed instances of Lemma 2_V with F={1}:

- V(n)=n. On the full map, 27 → 82 > 27. On odd-to-odd, 27 --v=1--> 41 > 27.
- V(n)=log n. Same first odd-to-odd step: log(41/27)>0.

A failed V releases only: this pair (V,F) is not a witness of 2_V. It does not release Lemma 2, ¬Lemma 2, a new cycle, a uniform bound, or L.

### Orbit of 27 (classical hailstone; instance of ReachesTrivialCycle(27))

Length to close at 1: 112 terms in the grind listing that includes the start and the closing 1 (standard delay counts differ by off-by-one). Max = 9232.

Odd terms until first drop below 27 (37 terms, last 23):

27, 41, 31, 47, 71, 107, 161, 121, 91, 137, 103, 155, 233, 175, 263, 395, 593, 445, 167, 251, 377, 283, 425, 319, 479, 719, 1079, 1619, 2429, 911, 1367, 2051, 3077, 577, 433, 325, 61, 23

Grind figures on that prefix:

- net log ≈ −0.160
- realized mean ≈ −0.00433
- model mean log(3/4) ≈ −0.2877

On the full odd path of 27 to 1 (41 odd steps in one grind count):

- realized mean ≈ −0.080
- model ≈ −0.288

The realized mean is negative after the fact because the orbit hit 1. That uses ReachesTrivialCycle(27). It is not a Lyapunov. The model mean is not the realized mean on this prefix.

Bound max O(27)=9232 is an instance bound. Bound max O(1)=4 is the bound on C0. Neither is Lemma 2.

---

## What is not deposited as a theorem

- No fourfold partner, no NS tether, no Hodge claim.
- No discharge of Lemma 1, 2, or L.
- No claim that the CF table or the 1..20000 search is Simons.
- No claim that the 27 path is a new cycle.

## Where else this lives

Companion computational census (different maps, not Δ_cyc): https://github.com/BenFrohman/3n-plus-c-cycle-census
Companion visual machine (presentation, not a proof): https://github.com/BenFrohman/the-3n-plus-1-machine
