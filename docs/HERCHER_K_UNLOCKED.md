# Hercher Corollary 29 under Barina X0 = 2^71

Copyright (c) 2026 Benjamin Stanley Frohman. CC BY 4.0. See LICENSE.

Hypothesis granted by the author of this repo: Barina 2025, every n < 2^71 reaches C0.

## What unlocks

Hercher, There are no Collatz m-cycles with m ≤ 91, arXiv:2201.00406v3 (JIS 26, 2023), Corollary 29:

    If X0 ≥ 1536 · 2^60 = 3 · 2^69,
    then every nontrivial cycle contains at least K > 1.375 · 10^11 odd numbers.

Arithmetic: 2^71 = 2048 · 2^60 > 1536 · 2^60. The hypothesis of Cor. 29 holds if Barina is accepted.

Therefore, under that hypothesis:

    K > 1.375 · 10^11

for every nontrivial T-cycle. K is the odd-count, not the block-count m.

## What does not unlock

- A new floor on m. Hercher already has m ≥ 92. Cor. 29 does not say m ≥ 92 + r.
- Lemma 1 (Δ_cyc = ∅). A huge K is compatible with one very long extra cycle.
- A new Eliahou triple (A,B,C) with ac = 0.
- Kind B (m-independent obstruction).

Remark 30 of the same paper: the 3·2^69 check is ~40% of the X0 that older length methods needed for the same K threshold.

Eliahou Farey at this floor is recorded in docs/ELIAHOU_WINDOWS.md: first principal upper hit 217976794617/137528045312. Intermediate also in the interval: 114208327604/72057431991. Those are length windows, not a replayed ac=0 form.
