# Deepening the m=92 block map

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

This file derives the block map. It does not write a 92-cycle.

## Syracuse C

    C(n) = n/2 if n even,  (3n+1)/2 if n odd.

An o-step is one odd application. An e-step is one halving.
A block is k consecutive o-steps (each image odd until the last), then ℓ extra e-steps to the next odd minimum.

## One o-step

    C(n) = (3n+1)/2.

For C(n) to be odd, 3n+1 ≡ 2 (mod 4), so n ≡ 3 (mod 4).
If n ≡ 1 (mod 4) then C(n) is even and the block is forced to have k=1.

## k o-steps

Write T_1(n)=(3n+1)/2. Then

    T_1(n) = 3n/2 + 1/2,
    T_1^k(n) = 3^k n / 2^k + sum_{j=0}^{k-1} 3^j / 2^{k-j}
             = (3^k n + 3^k - 2^k) / 2^k
             = 3^k (n+1)/2^k - 1.

Check: extra term sum_{i=0}^{k-1} 3^{k-1-i} 2^i = 3^k - 2^k.

## Then ℓ extra halves

    n_{next} = T_1^k(n) / 2^ℓ = ( 3^k (n+1) - 2^k ) / 2^{k+ℓ}.

Integer form of the block:

    2^{k+ℓ} n_{next} + 2^k = 3^k (n+1).

## What was wrong in the k=1-only stencil

The stencil

    n_{next} = [ 3^k n + (3^k-1)/2 ] / 2^{k+ℓ}

agrees with the closed form if and only if (3^k-1)/2 = 3^k - 2^k, i.e. 3^k = 2^{k+1}-1.
That holds only at k=1 (3=3). At k=2 it is 9 vs 7.

Check on disk:

    n=1, k=1, ℓ=1 (trivial cycle): both formulas give 1.  C: 1 → 2 → 1.
    n=3, k=2, ℓ=0: closed form gives 8 = C(C(3)). Stencil gives 31/4, not even an integer.

So the stencil is the k=1 slice. The m=92 system must use the closed form, or the Simons a_i chain, not the k=1 stencil for general k_i.

## Trivial cycle as a 1-block

n_1=1, k_1=1, ℓ_1=1:

    2^{2}·1 + 2^{1} = 4+2=6,    3^{1}(1+1)=6.

Simons: n=a 2^k-1 gives a=1, and (a 3^k-1)/2^ℓ=1 matches a 2^k-1=1.

## Unrolled cycle

Telescope 2^{k_i+ℓ_i} n_{i+1} + 2^{k_i} = 3^{k_i}(n_i+1) around i=1..…m.
The result is one linear equation

    n_1 (2^{K+L} - 3^K) = S(k,ℓ),

with S a positive integer built from the 92 intermediate 3-power/2-power terms.
A 92-cycle is a positive odd solution of that equation together with the 92 local block identities and the walls

    7.76×10^{19} < K < 3.430×10^{20}.

No such tuple is written.

Not Lemma 1.
