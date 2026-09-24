# Eliahou windows

Copyright (c) 2026 Benjamin Stanley Frohman. CC BY 4.0. See LICENSE.

A window is a necessary congruence on cycle *length*. It is not a cycle.
Only 2/1 among the small convergents of log2 3 is an actual cycle (C0 in the Steiner 1-block equation 2^2-3=1).

## 1993 form (X0 = 2^40)

S. Eliahou, The 3x+1 problem: new lower bounds on nontrivial cycle lengths,
Discrete Mathematics 118 (1993), 45-56. DOI 10.1016/0012-365X(93)90052-U.

For a nontrivial compressed cycle Ω with min Ω > 2^40,

    Card Ω = 301994 a + 17087915 b + 85137581 c

with a,c ≥ 0, b ≥ 1, and a c = 0. Smallest admissible length on that floor: 17 087 915.

Those three generators are continued-fraction data of log2 3, not loops:

    301994/190537     convergent 13, first survives only to Rmax ~ 2^39.8
    17087915/10781274 convergent 15, first survives to Rmax ~ 2^48.1
    85137581/53715833 convergent 16, the neighboring under-approximation

The small grind list 2/1, 3/2, 8/5, 19/12, 65/41, 84/53, … is the same CF. Only 2/1 is C0.

## What raising X0 does

The admissible upper approximations n/k are those satisfying

    log2 3 < n/k ≤ log2(3 + 1/X0).

Raising X0 shrinks the interval. Old generators fall out. New closer convergents fall in. The semigroup shape remains; the coefficients change. It never deletes the semigroup and it never writes a cycle.

## At Barina X0 = 2^71

D. Barina, Improved verification limit for the convergence of the Collatz conjecture,
J. Supercomput. 81 (2025), 810. DOI 10.1007/s11227-025-07337-0.
Verified range: every n < 2^71 reaches C0.

High-precision CF of log2 3 (80 decimal digits):

    first principal upper convergent still inside (log2 3, log2(3+2^{-71})]
    is 217976794617 / 137528045312
    (convergent 23). n+k = 355504839929.

That is the published 2025 length floor: 217 976 794 617 on the shortcut map f,
355 504 839 929 on the unaccelerated map T. This generator remains admissible
until Rmax ~ 2^75.4, so the step 2^68 → 2^71 does not change the first generator.

The 1993 triple is stale at this floor. We do not write a new three-coefficient
form with a c = 0 here. That needs Eliahou’s Farey / intermediate-fraction argument
replayed at the new floor. A list of principal convergents is not that argument.

## The three next-grind options, typed

1. Recompute Eliahou coefficients at X0=2^71.
   Done as far as the first generator and the published length floor.
   Not done: a new (A,B,C) with ac=0. That is a short paper, not this file.

2. Push Hercher m ≤ 91 to a larger m at the same X0.
   Hercher, There are no Collatz m-cycles with m ≤ 91, arXiv:2201.00406.
   His next-K checkpoint used every n ≤ 3·2^69 hitting C0. Barina 2^71 exceeds
   3·2^69, so that K-checkpoint is available if one accepts Barina.
   A larger-m theorem is still Kind A (fixed m, LMN + range). It is not Kind B.
   No such theorem is written here.

3. An m-independent obstruction.
   That is Lemma 1: Δ_cyc(T)=∅. Open. Linear forms in logs explain why Kind A
   terminates. They are not a replacement for the remaining m.

## Not claimed

- Lemma 1, Lemma L, Lemma L_-.
- A new Frohman cycle.
- That μ_F < 0 forbids extra loops.
