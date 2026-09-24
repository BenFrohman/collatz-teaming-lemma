# Candidate ac=0 triple at X0 = 2^71

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE.

Status: proposed pattern. Not a theorem. Not a cycle. Not Lemma 1.

## 1993 form (stale at this floor)

Eliahou, Discrete Math. 118 (1993): if min Ω > 2^40 then

    Card Ω = 301994 a + 17087915 b + 85137581 c,   b ≥ 1, ac = 0.

Those are CF numbers of log2 3 (conv 13, 15, 16), not cycles.
Rmax of 301994/190537 is ~2^39.84, so the first generator is already out at Barina.

## Candidate at X0 = 2^71

Same local configuration as 1993: two fractions on or above log2 3 that meet the window, plus the lower Farey neighbor. All three pairs are Farey-adjacent.

```
A = 114208327604     intermediate 21+22, side U, in the 2^71 window
B = 217976794617     principal conv 23,  side U, in the 2^71 window
C = 103768467013     conv 22,            side L, below log2 3
```

Determinants:

```
|A B| = 1
|A C| = 1
|B C| = 1
A = C + 10439860591
B = 2C + 10439860591
```

Proposed form, matching the 1993 pattern:

    Card Ω  ?=?  114208327604 a + 217976794617 b + 103768467013 c
                 b ≥ 1,  ac = 0.

If that form held, the smallest admitted shortcut length would be B (or A if the selection lemma allows a=1,b=0, which 1993 forbids by b≥1). Literature quotes B = 217976794617 as the 2025 floor. That is consistent with keeping b≥1 and not using A alone.

Companion full-T lengths (L+K):

```
A+q_A = 186265759595
B+q_B = 355504839929
C+q_C = 169239080334
```

## What is still missing

Eliahou’s selection lemma: every ratio Card Ω / (odd count) that lands in
(log2 3, log2(3+2^{-71})] is a mediant combination of this pair, and the
wing-constraint ac=0 still holds.

That lemma is not replayed in this file. A Farey-adjacent triple is the
ingredient list. It is not the 1993 theorem at a new floor.

Do not cite this as

    Card Ω = 114208327604 a + 217976794617 b + 103768467013 c.

Cite it as the candidate that the 1993 pattern produces at X0=2^71.
