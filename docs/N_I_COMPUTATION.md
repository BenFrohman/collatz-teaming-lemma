# Computation steps for n_i

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0.
Date: 28 September 2026.

Author of this work: Benjamin Stanley Frohman.
Cited: Steiner 1977 for the trivial close. Citation, not co-author.

These are the steps that compute n_{i+1} from (n_i, k_i, ℓ_i).
They do not produce a 92-tuple of values.

## Step A — one block

T_1(n) = (3n+1)/2 when that is an integer (n odd).
After k copies,

    T_1^k(n) = 3^k (n+1)/2^k - 1.

Then ℓ extra halves:

    n' = [3^k (n+1) - 2^k] / 2^{k+ℓ}.

Clear the denominator:

    2^{k+ℓ} n' + 2^k = 3^k (n+1).

For n' to be a positive odd integer, 2^{k+ℓ} must divide 3^k(n+1)-2^k,
and the quotient must be odd and positive.

Residue: a second T_1 step is possible only if n ≡ 3 (mod 4).
If n ≡ 1 (mod 4) then k is forced to 1.

## Step B — worked checks

Check 1. n=1, k=1, ℓ=1.

    2^{2} n' + 2^{1} = 3^{1}(1+1)
    4n' + 2 = 6
    n' = 1.

Orbit: 1 → 4 → 2 → 1. That is C_0. Cite: Steiner 1977 for the 1-cycle.

Check 2. n=3, k=2, ℓ=0.

    2^{2} n' + 2^{2} = 3^{2}(3+1)
    4n' + 4 = 36
    n' = 8.

And C(C(3)) = C(10) = 5? Wait: Syracuse T_1 twice on 3:
T_1(3)=(9+1)/2=5, T_1(5)=(15+1)/2=8. Yes n'=8, even, so this is not yet a next odd minimum; ℓ=0 left an even. Extra halves would continue until odd. The identity still holds.
The k=1 stencil [3^k n+(3^k-1)/2]/2^{k+ℓ} at (3,2,0) is 31/4, not an integer. Discard that stencil for k≥2.

## Step C — 92-fold system

Repeat Step A with unknowns (n_i, k_i, ℓ_i), i=1,…,92:

    2^{k_i+ℓ_i} n_{i+1} + 2^{k_i} = 3^{k_i}(n_i+1),
    n_{93}=n_1>1,
    each n_i positive odd.

Simons form of the same step: n_i = a_i 2^{k_i}-1, a_i odd positive, then

    (a_i 3^{k_i} - 1)/2^{ℓ_i} = a_{i+1} 2^{k_{i+1}} - 1.

## Step D — what the steps do not compute

No choice of (k_i, ℓ_i) is supplied that closes with n_1>1.
The only computed integer close is n=1. ExistsNontrivial92 stays empty.
