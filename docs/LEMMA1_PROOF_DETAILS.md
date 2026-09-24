# Lemma 1 — proof details

Lemma 1 (this project): Δ_cyc(T) = ∅. Every closed T-orbit is C0 = (1 → 4 → 2 ↑ 1).

That is the cycle half of Collatz. It is not L (Δ_cyc and Δ_div both empty). It is not proved here. What follows is the published spine plus the search elements kept from the grind.

## What an m-cycle is

An m-cycle is a closed orbit that decomposes into m blocks. Each block is

    odd ascent^{k_i} then even descent^{ℓ_i}.

Blocks are paths. The m-cycle is those m paths glued until they close. If they do not close, the Diophantine system has no solution and the object is not a cycle.

K in Steiner is the number of odd terms in a 1-block cycle, not “K odd terms anywhere.” Simons’ 2-cycle is two blocks, not “two odd terms.”

## Proved (cite, do not re-prove)

1. Steiner 1977. The only 1-cycle is the trivial one. Equation n(2^L − 3) = 1 forces n = 1, L = 2. This project’s Proposition 1.1 is that case.

2. Simons 2005 / 2007. No 2-cycle. Architecture: two odd local minima x_i = a_i 2^{k_i} − 1; closing is a Diophantine system; (K+L)/K must sit next to log_2 3; lower bound from growth, upper bound from Laurent–Mignotte–Nesterenko; window reduced to Steiner’s 100 < K < 86000; only candidate pairs (306, 485) and (15601, 24727); partial quotients too small. 2007 rewrite uses Steiner as input and a de Weger linear-form estimate. The a,b ≤ 30 grind is obsolete as a 2-cycle statement.

3. Simons–de Weger 2005/2010. No m-cycle for 1 ≤ m ≤ 68, later m ≤ 76 with a stronger X_0 bound.

4. Hercher 2022/2023 (arXiv:2201.00406). No m-cycle for m ≤ 91. Next published target mentioned there: a much larger odd-count bound (~10^11) needs a stronger verified range for T.

5. Eliahou 1993. Any nontrivial cycle period (in the compressed sense used there) has the form 301994 a + 17087915 b + 85137581 c with b ≥ 1 and a c = 0. That is a continued-fraction constraint from log 3 / log 2, not a cycle. The convergent 301994/190537 is an Eliahou window, not a solution.

Catalan–Mihăilescu: 2^a − 3^b = ±1 only in small cases. The trivial cycle uses 2^2 − 3 = 1. That kills some 1-block equations. It does not kill general m.

## Grind kept from this project (search, not proof)

These are the elements from the 27 / C_- / μ_F session that belong under Lemma 1 as data, not as QED.

- Odd starts < 20_000 under S_3: only core {1}. Finite search.
- Close (K, L) pairs exist (5/8, 17/27, 22/35, …). They are continued-fraction neighbors of log_2 3, not cycles by themselves.
- Convergents of log_2 3 start 2/1 (trivial L=2, K=1), then 3/2, 8/5, 19/12, 65/41, … Eliahou windows, not new solutions.
- 27 under T: 37 odd terms until first drop below 27; last odd 23; net log ≈ −0.16; realized mean ≈ −0.004 versus model μ_F = log(3/4) ≈ −0.288. Gap is data. Using that the path later hits 1 to call the mean a Lyapunov is circular.
- V(n)=n fails on every odd: 3n+1 > n. V=log n fails at 27 → 41. That is Lemma 2 sweat, recorded here only so it is not reused as a cycle test.
- C_- comparison: same start 27 walks 80 → 40 → 20 → 10 → 5 onto II. Wrong map. Does not produce a T-cycle and does not name a Frohman cycle. I, II, III of C_- are classical.

## What is still open for Lemma 1

No m-cycle is known, and none exists for m ≤ 91. That is not Δ_cyc(T)=∅. A hypothetical cycle with m ≥ 92, of a shape the Steiner–Simons–Hercher block calculus does not already exclude, is the remaining cycle object.

A site claiming a full Lean “no nontrivial cycle” theorem is not imported here until the kernel certificate is checked against the same statement as Lemma 1. This file does not mint that certificate.

## What this file must not do

- Discharge Lemma 1.
- Treat μ_F < 0 as a cycle obstruction (C_- already has extra cycles with the same sign).
- Treat cycle log-sum 0 as a contradiction (that is the definition of a cycle).
- Write ¬L or ¬L_- from C_-.
- Call 5 or 17 a Frohman cycle.
