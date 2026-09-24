# Shapes with m ≥ 92

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

There is no published extra cycle with m ≥ 92. “Record shape” here means the constraints such a cycle would have to obey. It is not a found loop.

## Type

m = number of local minima = number of blocks. Not K.

An m-cycle is m paths of the form

    (odd ascent)^{k_i} then (even descent)^{ℓ_i}

glued until n_{m+1} = n_1. If they do not close, it is not a cycle.

Hercher 2023: no such loop for m ≤ 91. JIS 26, Art. 23.3.5; arXiv:2201.00406v3. Corrigendum 14 June 2026 flagged on Theorem 21; main statement still the published ban on m ≤ 91.

The first unbanned block-count is m = 92.

## What Hercher records for those shapes

Corollary 24 (Table 1): if an m-cycle exists with m at most the left column, then the odd-count K exceeds the right column.

| m at most | K at least |
|---|---|
| 98 | 7.76 × 10^{19} |
| 117 | 2.74 × 10^{19} |
| 369 | 4.64 × 10^{18} |
| 4366 | 3.97 × 10^{17} |
| 17096 | 1.30 × 10^{17} |
| 802380 | 5.26 × 10^{15} |
| 1.07 × 10^6 | 4.78 × 10^{15} |
| 1.89 × 10^9 | 1.64 × 10^{12} |
| 2.18 × 10^9 | 8.90 × 10^{11} |
| 1.34 × 10^{10} | 1.37 × 10^{11} |
| all m | 7.20 × 10^{10} |

Under Barina X0 = 2^{71}, Hercher Corollary 29 also gives K > 1.375 × 10^{11} for every nontrivial cycle, any m. That bound is on K, not on m.

No paper after Hercher 2023 was found that raises the block-count floor above 92.

## Farey pair 22 and 23

Convergents of log_2 3:

    22: 103768467013 / 65470613321   (below)
    23: 217976794617 / 137528045312  (above, in the 2^{71} window)

    |p q' − p' q| = 1.

They form a Farey pair. Intermediate t=1 at index 23:

    114208327604 / 72057431991

also sits in the 2^{71} window and is Farey-adjacent to both.

Eliahou 1993 concludes Card Ω = A a + B b + C c with b ≥ 1 and ac = 0 from a selection lemma on such a pair plus the k(min) criterion. The 1993 (A,B,C) is stale. Listing the 2^{71} numerators

    114208327604,  217976794617,  103768467013

is the candidate list that matches that pattern. It is not the 1993 lemma replayed. This file does not assert

    Card Ω = 114208327604 a + 217976794617 b + 103768467013 c.

## Still empty

- An actual m=92 (or any m≥92) cycle.
- Lemma 1.
- A certified new ac=0 triple.
