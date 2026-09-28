# JIS corrigendum to Hercher, 14 June 2026

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0.
Date: 28 September 2026.

Author of this ledger note: Benjamin Stanley Frohman.
Cited source: Hercher, C. Corrigendum to Article 23.3.5,
Journal of Integer Sequences 26 (2023),
https://cs.uwaterloo.ca/journals/JIS/VOL26/Hercher/corrigendum.pdf
dated 14 June 2026. Hercher is a citation, not a co-author.
Acknowledgement in that PDF: Xinjun Wang pointed out the error.

This file is a working paraphrase of the published correction.
It is not a reprint of the PDF.

## What was wrong

In the proof of Hercher Theorem 21, bottom of page 14, the derivation of

    T(n_{m-m_2+1+ℓ}) < 3 / (2^v - 1)^\delta

contains an error. Theorem 21 is the inequality that feeds the bootstrap
used in Theorem 23 (no m-cycle for m ≤ 91) and in Corollary 24 / 29.

## Replacement argument (work shown)

On a hypothetical cycle, at a local minimum n_i set

    x_i := log(n_i + 1).

(The published note works in that logarithmic coordinate; the exact
normalisation log vs log_2 does not change the vertex argument.)

By the cycle constraints one has x_i ≥ 1 and a geometric cap x_{i+1} ≤ δ x_i,
with δ = log_2 3. Remark 7 of the paper: T(n_i) < 3/n_i.
Hence the block of m_2 consecutive T-sums is bounded by a function

    S(x_{m-m_2+1}, …, x_m) = ∑ 3 / (2^{x_j} - 1).

S is convex on the positive orthant. On the polytope cut out by
x_j ≥ 1, x_{j+1} ≤ δ x_j, and the sum-to-v constraint coming from

    v = (m_2 / m) K (δ-1)/(δ^{m_2}-1),

the maximum of S sits at a vertex. Evaluating at the geometric vertex
(v, δv, …, δ^{m_2-1} v), then relaxing to (v, δv, …, δv), yields

    T(n_{m-m_2+1}) + ∑_{i=m-m_2+2}^{m} T(n_i)
        < 3/(2^v - 1) + 3(m_2-1)/(2^{\u03b4 v} - 1)
        < 3/(2^v - 1) + 3(m_2-1) / (2^v - 1)^\delta.

That is the inequality Theorem 21 needed.

## What the corrigendum does and does not do

Does: repairs the T-sum estimate inside Theorem 21.
Does not: withdraw Theorem 23. Does not write (n_1,…,n_92).
Does not empty Δ_cyc. Does not prove Collatz.
This ledger does not re-prove Theorem 21 or 23 after the patch.

Source PDF: https://cs.uwaterloo.ca/journals/JIS/VOL26/Hercher/corrigendum.pdf
