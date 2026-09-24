# Collatz teaming lemma — Lean skeleton

**Author:** Benjamin Stanley Frohman (`@Investor0x`, GitHub `BenFrohman`)

**Status: the remaining lemma is not certified.**

This repository records the exact logical status of the remaining lemma on [The 3n+1 Machine](https://slate-terra-autumn-meadow.grok.me):

> every infinite team eventually maps into the cycle `{1,4,2}`.

That sentence is the Collatz conjecture on the positive integers. Lean records the equivalence and leaves the kernel open.

## What is certified

- The classical map `T`.
- The trivial cycle `C0 = (1 → 4 → 2 → 1)`, bound max = 4 on that orbit only.
- Predicates D (dichotomy) and R (reduction to the two Δs).
- The definition of inverse-residue teams.
- `RemainingLemma ↔ CollatzConjecture` by definition.

## What is not certified

```lean
theorem remaining_lemma : RemainingLemma := by
  sorry
```

Lemma 1 (`Δ_cyc=∅`), Lemma 2 (`Δ_div=∅`), and Lemma L stay open.
A failed Lyapunov (`V=n`, `V=log n` at 27→41) is not Lemma 2 and is not `¬`Lemma 2.

## Ledger

- [docs/LEDGER.md](docs/LEDGER.md)
- [docs/PREDICATES_D_R.md](docs/PREDICATES_D_R.md)
- [docs/LEMMA2_DIVERGENCE.md](docs/LEMMA2_DIVERGENCE.md)
- [docs/FAILED_V.md](docs/FAILED_V.md)
- [docs/SWEAT_AND_LITERATURE.md](docs/SWEAT_AND_LITERATURE.md) — full grind: Steiner, Simons, Hercher, Eliahou, Barina, CF windows, 27-orbit, searches
- [docs/SCAFFOLDING_AUDIT.md](docs/SCAFFOLDING_AUDIT.md)
- [docs/SIMONS_2CYCLE.md](docs/SIMONS_2CYCLE.md)

## Circularity note

Any argument that assumes every infinite team already falls into `{1,4,2}` in order to prove the remaining lemma is circular: it assumes the conclusion. The realized negative log-mean on the orbit of 27 is in that class.

## Zenodo

No solution preprint is deposited. A paper titled as a proof of Collatz would be false on the present kernel.

Companions: [the-3n-plus-1-machine](https://github.com/BenFrohman/the-3n-plus-1-machine), [3n-plus-c-cycle-census](https://github.com/BenFrohman/3n-plus-c-cycle-census).
