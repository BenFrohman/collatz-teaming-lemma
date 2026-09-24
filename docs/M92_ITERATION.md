# First Hercher iterate at m = 92, X0 = 2^{71}

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

Kind A attempt. Not Lemma 1. m = 92 is not banned in this file.

## What the 91-kill did (Hercher Thm 23)

Assume m ≤ 91. Start from Simons–de Weger Thm 3: K > 7·10^{11}.
With X0 = 704·2^{60} get m2 ≥ 47, then a tighter (K+L)/K, then a new K lower from linear forms.
Iterate: m2 ≥ 86, K > 7.76·10^{19}; m2 ≥ 88, K > 2.05·10^{20}; m2 ≥ 91, K > 7.94·10^{21}.
That last lower exceeds the SdW upper K < 1.4784 m δ^m < 2.2·10^{20}. Contradiction. No m ≤ 91.

The last step used m ≤ 91 to force m2 ≥ 91. It does not export.

## Numbers at m = 92, δ = log2 3, X0 = 2^{71}

SdW upper (same constant as Hercher / SdW for 91 ≤ m ≤ 515619):

    K < 1.4784 · 92 · δ^{92} = 3.430260·10^{20}.

Comparison: at m = 91 the same formula is 2.140728·10^{20}.

Hercher Thm 21 m2-test at this X0 (the printed inequality
(δ^{m2}−1)/(δ−1) · log2(162/97 · X0) ≤ (m2/m) K):

| starting K | max m2 the ineq allows |
|---|---|
| 7.2·10^{10} (all-m floor) | 42 |
| 1.375·10^{11} (Cor. 29 under Barina) | 43 |
| 7·10^{11} (SdW Thm 3) | 47 |
| 7.76·10^{19} (mid-iterate of the 91-kill) | 88 |

K required to even admit m2 = 92 at this X0: 3.093002·10^{20}.
That is 0.902 of the SdW upper. Close. Not a contradiction by itself.

## First Thm 21 step from Cor. 29

m = 92, K > 1.375·10^{11}, m2 = 43, X0 = 2^{71}:

    v = (m2/m) K (δ−1)/(δ^{m2}−1) = 94.2529
    (K+L)/K < δ + 1.3238·10^{-31}
    Λ = L ln 2 − K ln 3 < 1.2617·10^{-20}

The next K lower is a linear-form bound on that Λ (Laurent–Mignotte–Nesterenko / Baker). That step lives in Hercher’s Sage worksheet, not in this notebook. It is not computed here.

## Status

Computed: the m = 92 upper, the first m2, the first Λ-upper.
Not computed: the LMN iterate that would raise K, and every later m2.
Not claimed: no 92-cycle.

To finish Kind A at m = 92 one must rerun Hercher’s worksheet with X0 = 2^{71} and m fixed at 92 until either a lower bound exceeds 3.430260·10^{20} or the iteration stalls. That is a paper. This file is the first arithmetic of that paper.
