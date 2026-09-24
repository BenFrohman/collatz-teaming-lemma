# Rhin lower bound derivation

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0. See LICENSE and COPYRIGHT.

Rhin’s bound is an effective irrationality measure for linear forms in log 2 and log 3. It is not a Collatz theorem. The Collatz use is a rewrite. Not Lemma 1. Not a written 92-cycle.

## Source

Rhin, G. Approximants de Padé et mesures effectives d’irrationalité. Séminaire de Théorie des Nombres, Paris 1985–86, Progr. Math. 71, Birkhäuser, 1987, pp. 155–164. Inequality (8), p. 160.

Packaging of the same construction: Zudilin, An essay on irrationality measures of pi and other logarithms, arXiv:math/0404523. Theorem 3: μ(γ)<8.616 for nonzero γ in Q log 2 + Q log 3.

Collatz rewrite: Simons–de Weger, Acta Arith. 117 (2005), Lemma 12.

## What Rhin proves

Integer linear forms

    Λ_n = a_n + b_n log 2 + c_n log 3

that are tiny but nonzero. For H = max(|a|,|b|,|c|) large enough,

    |a + b log 2 + c log 3| > H^{-7.616}.

Equivalent measure: |γ − p/q| > C / q^{8.616}. The exponents differ by 1 because

    |K log 2 − L log 3| = K |log2 3 − L/K| · log 2.

## Derivation (Padé / integrals)

    log(1−z) = −∫_0^z dt/(1−t).

Classical Padé uses numerator t^n (1−t)^n. The integral is a Q-linear combination of 1 and logs, plus remainder ε_n. If log q_n ≤ σ n and log |ε_n| = −τ n, then μ = 1 + σ/τ. Apéry’s monomial already gives μ(log 2) ≤ 4.622.

Rhin replaces t^n(1−t)^n by integer-coefficient factors optimized against the transfinite diameter:

    X,  1−6X+X^2,  1−6X,  1−5X,  2−11X,  1−7X+2X^2.

Zudilin records the simultaneous-approximation polynomial for log(2/3) and log(4/3):

    H_n(z) = 2^{14} 3^{2n+7}
             (z−1)^{floor(0.704324 n)} (z−2/3)^{floor(0.552418 n)}
             (z−4/3)^{floor(0.447582 n)} (5z−4)^{floor(0.109072 n)}
             (17z^2−34z+16)^{floor(0.038934 n)} (19z^2−36z+16)^{floor(0.054368 n)}.

Better polynomials ⇒ faster remainder relative to height ⇒ stronger effective measure. No Collatz input.

## Simons Lemma 12 stencil

u0 = 0, H = u1 = K+L, u2 = −K:

    Λ = |(K+L) log 2 − K log 3| > exp(−13.3 (0.46057 + log K)).

Same number:

    exp(−13.3(0.46057 + ln K)) = e^{-13.3·0.46057} / K^{13.3} ≈ 1/(457 K^{13.3}),

since ln 457 / 13.3 ≈ 0.4605. The exponent 13.3 is that lemma’s conservative packaging, not Rhin’s sharp 7.616. Same shape: a negative power of K.

## What a cycle does with it

    2^{K+L} = ∏_{n odd} (3 + 1/n),
    Λ = L log 2 − K log 3 = ∑ log(1 + 1/(3n)) > 0.

Rhin forbids Λ from sitting below ~ K^{-13.3}. Combined with AM–GM that thins the interval around δ = log2 3. Lemma 22 reads the smallest denominator in (δ, δ+ε) as a new lower bound on K. Kind A: fixed m, raise K, hit the SdW wall.

## What it does not do

Does not ban m = 92. Does not write T.

At Cor. 29 start K > 1.375×10^{11}, cycle-side Λ-upper is 1.26×10^{-20}. Rhin lower at that K is ≈ 1.59×10^{-151}. Gap of 131 orders. The sharper H^{-7.616} form is only ~ 10^{-85}, still far below 10^{-20}.

Hercher raises K with Theorem 21 / Lemma 22 / m2, not by putting Rhin against that first Λ.

Already on disk (docs/M92_BOOTSTRAP.md):

    stall K > 2.056×10^{20} = 0.599 of the SdW wall K < 3.430×10^{20}.
    m2 = 92 would need K ≥ 3.093×10^{20} (0.902 of the wall). Never reached.

Eliahou window at 2^{71}: hits 114208327604/72057431991 and 217976794617/137528045312 in (log2 3, log2(3+2^{-71})]. A list of hits is a window, not Card Ω = Aa+Bb+Cc, not a cycle, not a new ac=0 triple.

Salikhov 2007 later cut the measure of log 3 toward 5.125; Wu–Wang to 5.116. Sharper exponent, same shape, still not a 92-ban.

Lemma 1 open. T unwritten.
