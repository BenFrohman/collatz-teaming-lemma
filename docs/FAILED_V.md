# Named cycle, orbit bound, failed V

## The named cycle

    C0 = (1 → 4 → 2 → 1).

That is the only cycle locked on this ledger. Proposition 1.1: it is the only 1-block cycle. Simons: there is no 2-block cycle. No other cycle is named.

## Bound on that orbit

    O(1) = O(2) = O(4) = {1,2,4},    max O(1) = 4.

Step by step: 1 is odd, v2(4)=2, S3(1)=1. Then 1 → 4 → 2 → 1. The orbit never leaves {1,2,4}. This bound is only for C0. It is not a bound for a general start.

## What a failed V is

Lemma 2_V asks for one function V and a finite exceptional set F such that

    ∀ odd n ∉ F,    V(S3(n)) < V(n).

A **failed V** is a concrete pair (V, F) that does not satisfy that universal. There exists an odd n ∉ F with V(S3(n)) ≥ V(n).

Witness for V(n)=n and V(n)=log n, F={1}:

    27 odd, v2(82)=1, S3(27)=41 > 27,    log(41/27)>0.

So those two functions are not instances of 2_V.

## What a failed V faithfully releases

Only this:

    ¬ (this V, with this F, is a witness of Lemma 2_V).

It does not release:

- ¬ Lemma 2   (Δ_div need not be nonempty)
- Lemma 2      (Δ_div need not be empty)
- a new cycle
- a uniform bound on all orbits
- Lemma L on every start

## Instance bound that is not Lemma 2

The orbit of 27 is finite and hits C0. Computed max is 9232, length 112 to close at 1. That is ReachesTrivialCycle(27), a single path. It uses the conclusion on that start. The net log drop along that path is after the fact. It is not a V that falls at 27→41, and it is not Δ_div=∅.
