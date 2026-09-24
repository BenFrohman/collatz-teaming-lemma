# C_- orbit convergence and uses of μ_F

## Convergence as observed, not L_-

On starts 1..1000 every orbit met one of the three known cycles. Counts match the census note:

    I (1-cycle): 349     II (5-cycle): 306     III (17-cycle): 345
    other cycle: 0       unresolved: 0

Peaks in that prefix: I 113240, II 45200, III 132860. This is a basin census, not L_-.

On each known cycle the odd-to-odd log-sum is exactly 0. That is required: a cycle cannot have a strictly negative Lyapunov along itself.

Contrast at 27: under T one has 27 → 82 → 41 (v=1). Under C_- one has 3*27-1=80, then 40,20,10,5, into cycle II. Different map, different first step.

## What μ_F can be used for

μ_F = log(3/4) is the Frohman model mean: expected odd-to-odd contraction for T=3n+1 under the heuristic that the next odd is about 3n/4. Tao calls that a non-rigorous heuristic.

Allowed uses:

1. Compare a realized odd-to-odd mean on a finite path of T to μ_F. On 27 under T the realized mean is much closer to 0 than to μ_F until the path hits C0. That gap is data, not a V.
2. Sign test across maps. For an+1, the same averaging gives log(a/4). a=3 ⇒ μ_F<0 (heuristic fall). a=5 ⇒ log(5/4)>0 (heuristic growth). That is why a method that ignores the +1 versus -1, or 3 versus 5, is too coarse. Already in the census NOTE.
3. Reject naive V=log as 2_V, because v=1 steps have log-change log(3/2)>0 > μ_F. The mean hides those steps.

Forbidden uses:

- Discharge Lemma 2 or L for T.
- Discharge L_- for C_-. On C_- the same large-n average is still log(3/4), yet two extra cycles exist. So μ_F<0 does not imply a single attractor.
- Treat cycle log-drift 0 as a contradiction. Drift 0 is what a cycle is.

## Verdict

C_- looks, in small prefixes, like three basins. L_- stays open. μ_F is a named heuristic for T. Its honest application is comparison and coarseness-control, not a lock-pick.
