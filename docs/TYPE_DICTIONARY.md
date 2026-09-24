# Type dictionary — m is not K is not n

Copyright (c) 2026 Benjamin Stanley Frohman. CC BY 4.0. See LICENSE.

These letters are different objects. Mixing them is how Lemma 1 gets mis-titled.

| Symbol | Meaning in this ledger | Source |
|---|---|---|
| n | a positive integer: an orbit start or a term on a cycle | ordinary |
| X0 | verification floor: every start ≤ X0 reaches C0 | Hercher Def. 4; Barina 2025: X0 = 2^71 |
| m | number of local minima in a nontrivial cycle = number of blocks | Hercher: “Let m be the number of local minima” |
| K | number of odd entries in the cycle = number of o-steps | Hercher: K odd, L even |
| L | number of even entries / e-steps (map-dependent) | Hercher |
| k_i | number of o-steps in the i-th block | K = sum_{i=1}^m k_i |
| n_i | the i-th local minimum, in cycle order | Hercher |
| Card Ω, p | cycle length. Shortcut f: period p. Full T: often L+K. Name the map. | Eliahou Card Ω |
| a,b,c | Eliahou semigroup coefficients for Card Ω | Eliahou 1993 |
| Λ | L log 2 − K log 3 | linear forms |
| μ_F | log(3/4), expected one-step drift | heuristic, not Λ |

Wikipedia sometimes says “k-cycle” for what Hercher calls an m-cycle. That k is the block count, not Hercher’s K.

Some older notes write N for odd-count. In this repo N is not a synonym for m or K.

m ≠ K ≠ n ≠ L ≠ Card Ω.
