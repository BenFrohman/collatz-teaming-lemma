# Hercher walls versus the ledger window

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0.
Date: 28 September 2026.

Author of this work: Benjamin Stanley Frohman.
Cited: Hercher, C. There are no Collatz m-cycles with m ≤ 91.
J. Integer Sequences 26 (2023), Article 23.3.5. arXiv:2201.00406v3.
Simons–de Weger as quoted there. Those are citations, not co-authors.

There is no Hercher “odd-Tsetlin” paper. K is odd-term count.

## Table

| number | source | what it is |
|---|---|---|
| m ≤ 91 banned | Hercher Thm 23 | block-count |
| K > 7.76×10^19 if m ≤ 98 | Hercher Cor. 24 table (row m=98) | odd-count floor |
| K > 1.375×10^11 if X_0 ≥ 3·2^69 | Hercher Cor. 29 | odd-count floor; needs Barina-scale X_0 |
| K < 2.2×10^20 | Hercher quoting SdW, used to kill m ≤ 91 | odd-count ceiling |
| K < 3.430×10^20 | ledger SdW-style wall at m=92 | not re-derived in this pass |

So 7.76×10^19 < K for a hypothetical m=92 ≤ 98 cycle is Hercher Cor. 24.
The pair 7.76×10^19 < K < 3.430×10^20 is a window on odd-count, not a list of n_i.

JIS lists a corrigendum dated 14 June 2026. This note does not apply it.

## Cycle split (T = 3n+1)

Collatz: every n>0 hits C_0 : 1 → 4 → 2 → 1.
That splits as Δ_cyc = ∅ and Δ_div = ∅.

Cited, not re-proved here: Steiner 1977 (only 1-cycle is C_0);
Simons 2005/2007 (no 2-cycle); Simons–de Weger (no m-cycle through the mid-70s);
Hercher Thm 23 (no m-cycle for m ≤ 91).

Extra cycles of C_- = 3n−1 do not inhabit Δ_cyc(T).

ExistsNontrivial92 stays uninhabited. That is not Collatz.
