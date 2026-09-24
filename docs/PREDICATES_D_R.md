# Predicates D and R

These were named in the grind as proved and were not written. They are elementary facts about T on ℕ, not Collatz.

## D — dichotomy

Every positive orbit is eventually periodic or unbounded. There is no third option.

    D : ∀ n>0,  (∃ p≥1, ∃ k, T^[k+p] n = T^[k] n)  ∨  Diverges n.

Proof. If O(n) is finite then some value repeats, hence the orbit is eventually periodic. If O(n) is infinite then it is unbounded in ℕ, i.e. Diverges n. □

D does not say which cycles exist. D does not say every orbit is bounded.

## R — reduction of L to the two Δs

    R : CollatzConjecture  ↔  (Δ_cyc = ∅ ∧ Δ_div = ∅).

Equivalently, for each n>0,

    ReachesTrivialCycle n  ↔  n ∉ Δ_cyc ∧ n ∉ Δ_div.

Proof. On ℕ an eventually periodic orbit enters some cycle. If that cycle is {1,2,4} then ReachesTrivialCycle n. If not, n ∈ Δ_cyc. If the orbit is not eventually periodic then n ∈ Δ_div by D. The two Δs are disjoint because a cycle is a finite orbit. □

R is also the Lean fact RemainingLemma ↔ CollatzConjecture, once Lemma L is identified with that conjecture.

## The arrow, written with hypotheses

    D ∧ R ∧ (Δ_cyc = ∅) ∧ (Δ_div = ∅)  ⇒  CollatzConjecture.

That is D + Lemma 1 + Lemma 2 ⇒ L. D and R are proved. Lemma 1 and Lemma 2 are not. The arrow does not discharge L.

## Lemma 2 split (correction)

The grind used “Lemma 2” for a Lyapunov. That is a different predicate.

- Lemma 2  :=  Δ_div = ∅.
  Every positive orbit is bounded, hence eventually periodic. Open.
- Lemma 2_V := there exists V:ℕ→ℝ and a finite F⊂ℕ such that for every odd n∉F,
  V(S_3(n)) < V(n), where S_3(n)=(3n+1)/2^{v_2(3n+1)}.
  This would imply Lemma 2. It is stronger. It is not the definition.

Tested and failed as instances of 2_V:
- V(n)=n, because v_2(3n+1)=1 ⇒ S_3(n)=(3n+1)/2 > n for odd n>1 (27→41).
- V(n)=log n, same points, log(41/27)>0.

A failed instance of 2_V is not Lemma 2 and is not ¬Lemma 2. Mean log(3/4)<0 is not 2_V and is not Lemma 2.
