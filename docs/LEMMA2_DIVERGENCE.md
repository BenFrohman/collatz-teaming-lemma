# Lemma 2 — divergence, defined

Let T be the classical map on ℕ, T(0)=0. Write O(n)={T^[k] n : k≥0}.

## Three predicates (disjoint on n>0, up to the basin of a cycle)

- ReachesTrivialCycle n := ∃k, T^[k] n ∈ {1,2,4}.
- OnNontrivialCycle n := ∃p≥1, T^[p] n = n and n ∉ {1,2,4}
  (or: the orbit eventually enters such an n).
- Diverges n := O(n) is infinite.

On ℕ a bounded orbit has finite image, hence is eventually periodic. So

    Diverges n  ⟹  O(n) unbounded  ⟹  n is never periodic.

A point on a nontrivial cycle is bounded. It is not a divergence.
A path that reaches 1 is finite in the relevant sense. It is not a divergence.

## The two Δs

    Δ_cyc := { n>0 | the orbit of n enters a cycle other than {1,2,4} }
    Δ_div := { n>0 | Diverges n }

These are disjoint. Their union is exactly the complement of the trivial basin:

    ¬ ReachesTrivialCycle n  ⟹  n ∈ Δ_cyc ∪ Δ_div.

## Locked definitions of the lemmas

- Lemma 1 := Δ_cyc = ∅.
  Closed orbits only. Prop 1.1 and Simons live here.
- Lemma 2 := Δ_div = ∅.
  Every positive orbit is bounded, hence eventually periodic.
- Lemma L := ∀ n>0, ReachesTrivialCycle n.
  Equivalent to Δ_cyc ∪ Δ_div = ∅, i.e. Lemma 1 and Lemma 2 together.

That is the implication 1+2 ⇒ L. It is an arrow. It is not a discharge.

## What Lemma 2 is not

Lemma 2 is not the existence of a Lyapunov V.

A function V:ℕ→ℝ that strictly decreases at every odd-to-odd step outside a finite set would be a *sufficient method* for Lemma 2 (and, if the finite exceptional set is only {1}, would force bounded orbits). The grind tested V(n)=n and V(n)=log n. Both rise whenever v₂(3n+1)=1. Those tests rule out those V. They do not prove or disprove Δ_div=∅.

The model mean log(3/4)<0 is an average over valuations. It is not Diverges n = False.
The sign of log along the orbit of 27 after that orbit hits 1 uses Lemma L on that start. It is not a Lyapunov and it is not Lemma 2.

## Status

Lemma 2 is open. No V is supplied that survives v=1. No other argument emptying Δ_div is supplied.
