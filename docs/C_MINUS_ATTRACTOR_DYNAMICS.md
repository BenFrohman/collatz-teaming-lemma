# C_- attractor dynamics

Three attractors, no clean residue lock. Not L_-.

## Attractors

- I: 2-cycle 1 → 2 → 1
- II: 5-cycle through 5, 7
- III: 18-cycle through 17

Odd-to-odd log-sum on each is 0. Once on the loop, no further descent.

## Basins mix

On 1..4095: I 1350, II 1313, III 1432 — about a third each.
Mod 8, 16, and 32, every class feeds all three basins. Typical splits 0.30–0.40, not 0–1. No small-modulus invariant sends a residue to only one basin. Landing is a long parity vector, not a residue.

## Inverse tree

Every point has even preimage 2m. Odd preimage (m+1)/3 exists only when that is a positive odd integer. Some cycle points have an off-cycle odd feeder (23 → 68 into III). 1 has no odd preimage. Each basin is an infinite tree glued onto a finite loop: three copies of the Pred(1) shape.

## Delay (starts 1..200)

Steps to first cycle point: I mean ≈17, II ≈11, III ≈7. III catches nearby starts faster because the 17-cycle occupies more small integers. Small-N effect, not L_-.

## What this is not

Not a proof that the three trees cover ℕ>0. Not a fourth cycle. Not a residue test for L_-. μ_F<0 still only says orbits tend to shrink; here they can shrink onto any of three loops.

Comparison start 27: 80 → 40 → 20 → 10 → 5 onto II. Ordinary. No special invariant.
