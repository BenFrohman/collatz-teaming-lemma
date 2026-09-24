# Grind — 24 September 2026

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

Not Lemma 1. Not a 92-cycle. Not a ban on m=92.

## 1. Simons is the closed form in a-coordinates

n_i = a_i 2^{k_i} - 1 is exactly the statement that 2^{k_i} divides n_i+1,
which is what T_1^{k_i}(n_i) = 3^{k_i}(n_i+1)/2^{k_i} - 1 requires.
Then ℓ_i extra halves give the Simons chain

    (a_i 3^{k_i} - 1)/2^{ℓ_i} = a_{i+1} 2^{k_{i+1}} - 1.

Checks: (n,k,ℓ)=(1,1,1) → 1. (3,2,0) → 8 = C(C(3)), and a=1 gives (9-1)/1=8.

## 2. Residue for k_i ≥ 2

C(n)=(3n+1)/2 is odd iff n ≡ 3 (mod 4).
If n ≡ 1 (mod 4) the block is forced to k=1.
Any block with k_i ≥ 2 has n_i ≡ 3 (mod 4).

## 3. Rhin vs the first m=92 Λ-upper

First Thm 21 step (docs/M92_ITERATION.md):

    K > 1.375e11,   Λ < 1.2617e-20.

Rhin, as quoted by Simons 2007:

    |L ln 2 - K ln 3| > exp(-13.3 (0.46057 + ln K)).

At K=1.375e11 that lower bound is ≈ 1.59e-151, far below 1.26e-20.
Same at the SdW wall K=3.43e20 (≈ 1.66e-276).

Raw Rhin does not contradict the first iterate. It is too small.
Hercher raises K with Lemma 22 / Thm 21 m2, not by putting Rhin against this Λ.

## 4. Still open after this grind

- The full m2 bootstrap at m=92 (Sage worksheet).
- A 92-tuple (n_i, k_i, ℓ_i).
- Lemma 1.
