# Grind: K=1 cycle, K=2 window, naive Lyapunov

24 September 2026. Sweat, not a discharge. One special case of Lemma 1 is a finished local theorem. Lemma 1, Lemma 2, and Lemma L stay open.

## Proposition 1.1 — proved

The only positive 1-odd-term cycle of (C_+) is (1 → 4 → 2 → 1).

Proof. One odd term n and L halvings means

    (3n+1)/2^L = n  ⇒  n(2^L − 3) = 1.

The only positive integer solution is n=1, 2^L−3=1, hence L=2. That is the known cycle.

This is Steiner’s K=1 case, written out. It is not Lemma 1.

## K=2 — partial grind

Two odd terms, valuations a,b ≥ 1:

    n0(2^{a+b}−9)=2^a+3,
    n1(2^{a+b}−9)=2^b+3.

A search of all 1 ≤ a,b ≤ 30 finds only (a,b)=(2,2), n0=n1=1, the trivial cycle written twice. So there is no 2-odd-term cycle with both valuations ≤ 30. Simons already excluded every 2-cycle. This grind does not replace that paper.

The next rationals L/K near log_2 3 are the continued-fraction window, not cycles by themselves:

    2/1, 3/2, 8/5, 19/12, 65/41, 84/53, …

The first of those is the trivial cycle. The rest are Eliahou’s length windows. A close ratio is necessary, not sufficient.

## Lemma 2 — every naive Lyapunov fails

A Lyapunov V must fall at every odd-to-odd step outside a finite set.

- V(n)=n fails whenever v_2(3n+1)=1: then S_3(n)=(3n+1)/2 > n for every odd n>1. Example: 27 → 41.
- V(n)=log n fails at the same points: log(41/27)>0.
- On the first 200 odd starts, log increases on 50 of them.

The model mean log(3/4)<0 is an average over valuations. Most individual odds have v=1 and grow. A working V has to wait for later high-valuation steps to compensate. That compensation is not uniform.

On the orbit of 27, after the fact, the net odd-to-odd log-change is negative because the orbit hits 1. Using that sign uses the conclusion. It is not a Lyapunov.

## What this grind did not do

- It did not empty Δ_cyc.
- It did not empty Δ_div.
- It did not produce a V that falls for every odd n.
- It did not solve the Steiner identity for general K.

Still proved: D, R, Proposition 1.1, D+1+2 ⇒ L.
Still open: Lemma 1, Lemma 2, Lemma L.

Next honest grind: the full K=2 identity with no valuation cap (Simons, already in the literature), or a candidate V that can survive v=1 steps. No QED on 1, 2, or L from this note.
