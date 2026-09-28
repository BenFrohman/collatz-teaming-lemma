# 92-cycle grind in four parts

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0.
Date: 28 September 2026.

Author of this work: Benjamin Stanley Frohman.
Cited: Steiner 1977; Hercher 2022. Citations, not co-authors.

A 92-cycle is not computed here. These are the four parts a computation
would have to finish. No n_i is invented.

## Part 1 — local block map, 92 times

On an odd local minimum n, after k copies of T_1(n)=(3n+1)/2 and ℓ extra halves:

    2^{k+ℓ} n' + 2^k = 3^k (n+1).

A 92-cycle is 92 such identities, indices mod 92:

    2^{k_i+ℓ_i} n_{i+1} + 2^{k_i} = 3^{k_i} (n_i+1),    i = 1, …, 92.

The old stencil [3^k n + (3^k-1)/2] / 2^{k+ℓ} equals this iff k=1.
Check already computed: (n,k,ℓ)=(3,2,0) gives n'=8 = T(T(3)), stencil gives 31/4.

## Part 2 — close the loop

    n_93 = n_1 > 1.

Unrolled around the cycle:

    n_1 (2^{K+L} - 3^K) = S(k, ℓ),

where K = ∑ k_i, L = ∑ ℓ_i, and S is the inhomogeneous sum from the +2^k terms.
If n_93 ≠ n_1, it is not a cycle. Repeating C_0 ninety-two times still has n=1,
so it fails n_1 > 1.

## Part 3 — walls and residue

Residue: C(n) odd iff n ≡ 3 (mod 4). If n ≡ 1 (mod 4), the block is forced to k=1.
Any k_i ≥ 2 requires n_i ≡ 3 (mod 4).

Walls on odd-count K, cited:

    Cor. 29 (X_0 ≥ 3·2^{69}, Barina 2^{71}): K > 1.375×10^{11}.
    Cor. 24 if m ≤ 98: K > 7.76×10^{19}.
    SdW wall at m=92: K < 3.430×10^{20}.

Those bound K. They are not a list of n_i. Cite: Hercher 2022 for m ≤ 91 banned.

## Part 4 — what was actually computed

    (n, k, ℓ) = (1, 1, 1) ⇒ n' = 1.

Orbit 1 → 4 → 2 → 1. That is C_0. Cite: Steiner 1977 for the full 1-cycle.
The elementary identity n(2^L-3)=1 is only the k=1 case.

No 92-tuple is written. ExistsNontrivial92 stays uninhabited.
This four-part grind is not a computed 92-cycle, not Δ_cyc(T)=∅, not Collatz.
