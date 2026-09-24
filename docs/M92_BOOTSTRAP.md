# m=92 Theorem 21 / Lemma 22 bootstrap

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

X0 = 2^{71}. m = 92. δ = log2 3. Not Lemma 1. Not a written 92-cycle.

## Does a 92-cycle close?

This grind does not decide. Close means n_93 = n_1 under the 92 block maps.
No tuple T is known except C_0 = (1,1,1), which is excluded by n_1 > 1.

## Bootstrap (Thm 21 + Lemma 22)

Start from Cor. 29: K > 1.375e11, which admits m2 = 43.

    it  K               m2   K_next
    0   1.3750e11       43   4.7837e15
    1   4.7837e15       67   3.9756e17
    2   3.9756e17       77   4.6403e18
    3   4.6403e18       82   2.7444e19
    4   2.7444e19       86   7.7692e19
    5   7.7692e19       88   2.0563e20
    6   2.0563e20       91   stall (Lemma 22 den does not rise)

SdW wall at m=92: K < 1.4784 m δ^m = 3.430e20.
Stall / wall = 0.599. No contradiction.

m2 = 92 would need K ≥ 3.093e20 (0.902 of the wall). The bootstrap never reaches m2 = 92.

Cor. 17 alone stalls earlier at K = 2.744e19.

## Eliahou window at 2^{71}

Hits inside (log2 3, log2(3+2^{-71})]:

    114208327604 / 72057431991
    217976794617 / 137528045312

A list of hits is a window, not Card Ω = Aa+Bb+Cc and not a cycle.
No new ac=0 triple is asserted.

## T

    T = (n_1,k_1,ℓ_1, …, n_92,k_92,ℓ_92) = ??

T is unwritten. The only cycle-tuple on disk is (1,1,1).
