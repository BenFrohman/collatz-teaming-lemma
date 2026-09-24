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

A shape is Hercher Def. 6: m blocks

    (odd ascent)^{k_i} then (even descent)^{ℓ_i}

glued until they close. If they do not close, it is not a cycle.

Hercher 2023 Thm 23: no such loop for m ≤ 91. JIS 26, Art. 23.3.5; arXiv:2201.00406v3. Corrigendum 14 June 2026 flagged on Theorem 21; main statement still the published ban on m ≤ 91.

The first unbanned block-count is m = 92. No later paper raises that floor.

## Constraints, not a loop

Cor. 24, first row that covers 92: if m ≤ 98, then K > 7.76×10^{19}.

Under Barina, Cor. 29 separately gives the m-independent floor K > 1.375×10^{11}. That is a bound on odd-count, not a new ban on m.

Why Hercher stopped at 91: the SdW-style upper is K < 1.4784 m δ^m. At m = 91 that upper is 2.140728×10^{20}; the iterated lower bound under the assumption m ≤ 91 exceeds it. That lower bound does not export to m = 92.

## Option 2, first iterate (done)

Rerun at m = 92 with X0 = 2^{71} is recorded in docs/M92_ITERATION.md.

- SdW upper at m = 92: K < 3.430260×10^{20}.
- Cor. 29 start gives m2 = 43, Λ < 1.26×10^{-20}.
- K needed to admit m2 = 92: 3.093×10^{20} (0.902 of the wall).
- Next raise of K is LMN/Baker. Not computed. m = 92 is not banned.

## Farey 22–23 is one ingredient, not the 1993 theorem

    i=22: 103768467013 / 65470613321   (below)
    i=23: 217976794617 / 137528045312  (above, in the 2^{71} window)

    |p q' − p' q| = 1.

They are a Farey pair. The intermediate 114208327604 / 72057431991 also sits in the 2^{71} window.

That licenses mediants. It does not license Card Ω = A a + B b + C c with b ≥ 1 and ac = 0 at this floor. Candidate pattern only: see docs/AC0_TRIPLE_CANDIDATE.md.

## Still empty

- An actual m = 92 cycle.
- Lemma 1.
- A certified new ac=0 triple.
- A completed Kind A ban of m = 92.
