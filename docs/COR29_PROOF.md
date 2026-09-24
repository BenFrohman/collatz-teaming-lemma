# Corollary 29 — proof walkthrough and the unwritten 92-loop

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

Cite, do not redo: Hercher, There are no Collatz m-cycles with m ≤ 91,
arXiv:2201.00406v3, JIS 26 (2023) Art. 23.3.5.
C++ programs on the JIS page: collatz_cycle.cpp (Cor. 29), collatz_m-cycle.cpp (Cor. 19).
Corrigendum 14 June 2026 is flagged on Theorem 21; Cor. 29 numbers below are the published ones.

Barina 2025 supplies X0 = 2^{71} > 3·2^{69}, so the hypothesis of Cor. 29 is granted if Barina is accepted. That is not a new proof of the corollary.

## Statement

If X0 ≥ 1536 · 2^{60} = 3 · 2^{69}, then every nontrivial cycle has

    K > 1.375 × 10^{11}

odd terms. K is odd-count, not block-count m.

## Step 1 — product identity (Thm 16)

On a cycle, ∏ n = ∏ C(n) gives

    2^{K+L} = ∏_{n odd} (3 + 1/n).

AM–GM on the right, then log(1 + μ/3) < μ/3, yields

    δ < (K+L)/K < δ + 1/(K · 3 log 2) · ∑_{i=1}^m T(n_i),

where T(n_i) = ∑_{t=0}^{k_i-1} 1/C^t(n_i) and ∑ k_i = K. δ = log2 3.

## Step 2 — control the sum (Lem 26 → Thm 27)

Lemma 26 is a case split on one, two, or three consecutive minima:

    T(n_i) < k_i · (3/4) · 1/X0,

or the same with two or three blocks. Glue those partial sums around the cycle,
take t copies, send t → ∞, and the leftover +8 vanishes. Result:

    ∑_i T(n_i) ≤ K · (3/4) · 1/X0.

Plug into Thm 16: the slack no longer carries m. That is why Cor. 29 does not raise the block-count floor.

## Step 3 — slack to a K-floor (Lem 22)

The interval (δ, δ+ε) with ε ∝ 1/X0 contains L/K. Lemma 22: the first CF disagreement of δ and δ+ε produces a minimum denominator. That denominator is the K-floor. Larger X0 shrinks ε and can only raise K.

## Step 4 — the number 3·2^{69}

A raw 3/(4 X0) bound is not optimal. Hercher runs Lemma 26 by residue class modulo powers of 2 (C++, five weeks on an 8-core i9). Classes whose smallest positive representative already exceeds 3781 · 2^{60} are skipped. What remains is the checkpoint

    X0 ≥ 1536 · 2^{60} = 3 · 2^{69}.

Remark 30: that floor is about 40% of the older length-method checkpoint for the same K-threshold.

## The unwritten 92-loop

A 92-cycle would be a solution of

    C^{k_i + ℓ_i}(n_i) = n_{i+1},    i = 1, …, 92,    n_{93} = n_1.

No solution is written. None is published.

Any nontrivial cycle — including a hypothetical 92-block one — still needs

    K = ∑ k_i > 1.375 × 10^{11}.

That is a floor on odd-count, not a list of n_i. Cor. 24 adds: if m ≤ 98 then K > 7.76 × 10^{19}. Together with the SdW wall,

    7.76 × 10^{19} < K < 3.430 × 10^{20}.

Those are the walls around an unwritten orbit.

Not Lemma 1. Not a Collatz counterexample.
