# Negative expected drift does not imply a unique attractor at 1

**Not a disproof of the Collatz conjecture.**

Benjamin Stanley Frohman  
24 September 2026

## Title discipline

This note is not “the official Collatz disproof.” Collatz is the claim that every positive orbit of

    T(n) = n/2 if n even, else 3n+1

reaches C0 = (1 → 4 → 2 → 1). Nothing below refutes that claim. “Killed” here means one implication is false. It does not mean Collatz is discharged or solved.

## The slogan

Treat as a theorem the sentence:

    If μ_F := log(3/4) < 0, then every orbit goes to 1 and there is only one attractor.

That is the folklore jump from Tao’s 2020 heuristic (“average size of odd terms decreases toward 1”) to Collatz. μ_F is the Frohman model mean: the same expected 3n/4 contraction. Tao calls the calculation a convincing but non-rigorous heuristic. He does not call it a theorem.

## Why the slogan is not a theorem

μ_F is an average over a guessed law for v2(3n ± 1). It does not control a single v=1 step (27 → 41 under T). It does not name the attractor. It does not forbid extra loops.

## Witness that the slogan is false as a general rule

Let C_-(n) = n/2 if n even, else 3n-1. At large n the same averaging still looks like next odd ≈ 3n/4, so the sign is still μ_F < 0. Yet C_- has three known positive attractors:

    I   1 → 2 → 1
    II  5 → 14 → 7 → 20 → 10 → 5
    III 17 → 50 → 25 → 74 → 37 → 110 → 55 → 164 → 82 → 41 → 122 → 61 → 182 → 91 → 272 → 136 → 68 → 34 → 17

In particular 5 never maps to 1 under C_-. So

    μ_F < 0  ⇒  unique basin {1}

is false for this family of maps. The cycles I--III are classical, not newly found here.

## What remains standing

μ_F < 0 is compatible with fall toward some bounded set. It does not pick C0 and it does not prove there is only one such set.

Not refuted by this note:

- Lemma L for T (Collatz).
- Lemma L_- (every positive C_- orbit meets I ∪ II ∪ III).
- Lemma 1: Δ_cyc(T) = ∅.

A fourth C_- cycle or an unbounded C_- orbit would refute L_-. Neither is supplied here.

## Comparison orbit (classical start 27)

    T:    27 → 82 → 41 → … → C0
    C_-:  27 → 80 → 40 → 20 → 10 → 5 → II

Same integer, two maps. Not a new cycle.

## Verdict

Disproved: the slogan. Not disproved: Collatz.
