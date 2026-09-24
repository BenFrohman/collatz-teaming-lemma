# Diophantine system for an m=92 cycle

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

No solution is written. This is the system a 92-cycle would have to satisfy.
Not Lemma 1. Not Card Ω = Aa+Bb+Cc as a theorem at X0=2^{71}.

## Variables

For i = 0, …, 91 (or 1, …, 92):

- n_i : odd local minimum (positive integer)
- k_i : number of consecutive o-steps after n_i
- ℓ_i : number of consecutive e-steps after those o-steps
- a_i : Simons coefficient, n_i = a_i 2^{k_i} − 1
  (3n+1 case of (p−2)x_i = a_i 2^{k_i} − q with p=3, q=1)

K = ∑ k_i, L = ∑ ℓ_i, m = 92.
Card Ω here means the T-period of the cycle (Eliahou), not m and not K.

## Block map (C = Syracuse)

C(n) = n/2 if even, (3n+1)/2 if odd.

After k_i o-steps then ℓ_i e-steps:

    n_{i+1} = [ 3^{k_i} n_i + (3^{k_i} − 1)/2 ] / 2^{k_i + ℓ_i}

must be an odd positive integer, and the k_i intermediate C-images after n_i must stay odd.

Close the loop:

    n_{92} maps to n_0,   equivalently n_{93} := n_1 if indexing from 1.

## Simons chain (Acta Arith. 131.3 / 134.3)

    (a_i 3^{k_i} − 1) / 2^{ℓ_i} = a_{i+1} 2^{k_{i+1}} − 1.

In matrix form, indices mod 92:

    ( −3^{k_i} ) a_i  +  2^{k_{i+1}+ℓ_i} a_{i+1}  =  2^{ℓ_i} − 1.

A 92-cycle exists if and only if there are positive integers
(n_i, k_i, ℓ_i) — or equivalently (a_i, k_i, ℓ_i) — solving that system
with each n_i a local minimum of a single closed C-orbit.

No such 92-tuple is known. Inventing n_i that fail the equalities is not a cycle.

## Walls the n_i would still have to live in

Cor. 29 (Barina X0=2^{71}): K > 1.375 × 10^{11}.
Cor. 24 if m ≤ 98: K > 7.76 × 10^{19}.
SdW upper at m=92: K < 3.430 × 10^{20}.
Every n_i > X0 = 2^{71}.

## Card Ω = Aa + Bb + Cc

Eliahou, Discrete Math. 118 (1993), at X0=2^{40}:

    Card Ω = 301994 a + 17087915 b + 85137581 c,   b ≥ 1, ac = 0.

That triple is stale at 2^{71}. The pattern at this floor is the candidate

    A = 114208327604,  B = 217976794617,  C = 103768467013

in docs/AC0_TRIPLE_CANDIDATE.md. Farey-adjacent. Not a replayed selection lemma.
Do not cite Card Ω = Aa+Bb+Cc with those A,B,C as a theorem.

Card Ω is a length. It is not the list (n_i). A window is not a cycle.
