# The m=92 tuple

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

The tuple is the unknown. Filling 92 integers that fail the identities is not a cycle.

## Tuple

    T = (n_1,k_1,ℓ_1, …, n_92,k_92,ℓ_92)

with n_i odd, n_i > 2^{71}, k_i ≥ 1, ℓ_i ≥ 1, and if k_i ≥ 2 then n_i ≡ 3 (mod 4).

Equivalent a-form: n_i = a_i 2^{k_i} - 1, a_i odd positive.

## What T must satisfy

Closed block map, i = 1,…,92, n_{93} := n_1:

    2^{k_i+ℓ_i} n_{i+1} + 2^{k_i} = 3^{k_i} (n_i + 1).

Simons chain, indices mod 92:

    (-3^{k_i}) a_i + 2^{k_{i+1}+ℓ_i} a_{i+1} = 2^{ℓ_i} - 1.

Unrolled:

    n_1 (2^{K+L} - 3^K) = S(k,ℓ),
    K = k_1+⋯+k_92,   L = ℓ_1+⋯+ℓ_92.

## Walls on K, not on the missing n_i

    7.76 × 10^{19} < K < 3.430 × 10^{20}.

Cor. 29: K > 1.375 × 10^{11}.

## Status

T is unwritten. The only known cycle-tuple in this ledger is the 1-block

    (n,k,ℓ) = (1,1,1),

which is C_0 and is excluded by n_1 > 1.

Not Lemma 1. Not a Collatz extra cycle.
