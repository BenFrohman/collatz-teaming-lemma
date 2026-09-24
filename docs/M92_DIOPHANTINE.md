# Diophantine system for an m=92 cycle

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

Locked 24 September 2026.

No solution is written. This is the system a 92-cycle would have to satisfy.
Not Lemma 1. Not Card Ω = Aa+Bb+Cc as a theorem at X0=2^{71}.

## Definition

    C^{k_i + ℓ_i}(n_i) = n_{i+1},    i = 1, …, 92,
    n_{93} := n_1 > 1.

If the 92 blocks do not close, it is not a cycle.

## Variables

- n_i : odd local minimum (positive integer)
- k_i : number of consecutive o-steps after n_i
- ℓ_i : number of consecutive e-steps after those o-steps
- a_i : Simons coefficient, n_i = a_i 2^{k_i} − 1

K = ∑ k_i, L = ∑ ℓ_i, m = 92.
Card Ω is the T-period (Eliahou), not m and not K.

## Block map (C = Syracuse)

C(n) = n/2 if even, (3n+1)/2 if odd.

    n_{i+1} = [ 3^{k_i} n_i + (3^{k_i} − 1)/2 ] / 2^{k_i + ℓ_i}

must be an odd positive integer, and the k_i intermediate C-images after n_i must stay odd.

## Simons chain

    (a_i 3^{k_i} − 1) / 2^{ℓ_i} = a_{i+1} 2^{k_{i+1}} − 1.

Indices mod 92:

    (−3^{k_i}) a_i + 2^{k_{i+1}+ℓ_i} a_{i+1} = 2^{ℓ_i} − 1.

No such 92-tuple is known.

## Walls

    7.76 × 10^{19} < K < 3.430 × 10^{20}.

Cor. 29 separately: K > 1.375 × 10^{11}. Every n_i > X0 = 2^{71}.

## Card Ω = Aa + Bb + Cc

Eliahou 1993, X0=2^{40}:

    Card Ω = 301994 a + 17087915 b + 85137581 c,   b ≥ 1, ac = 0.

Stale at 2^{71}. Candidate only:

    A = 114208327604,  B = 217976794617,  C = 103768467013.

Not a theorem at this floor. A window is not a cycle.
