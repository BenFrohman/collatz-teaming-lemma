# Collatz teaming lemma — Lean skeleton

**Author:** Benjamin Stanley Frohman (`@Investor0x`, GitHub `BenFrohman`)  
**Email:** frohmanbenjamin@gmail.com  
**ORCID:** [0009-0006-7068-3718](https://orcid.org/0009-0006-7068-3718)  
**Copyright:** © 2026 Benjamin Stanley Frohman  
**License:** [CC BY 4.0](LICENSE)

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
Kind A (no m-cycle for m ≤ 91) is literature (Steiner / Simons / Hercher). Kind B (every m) is Lemma 1 and is open.

## Ledger

See `docs/`. Entry points: `LEDGER.md`, `LEMMA1_CITED.md`, `LMN_SPLIT.md`, `DO_NOT_MISREAD.md`, `SWEAT_AND_LITERATURE.md`.

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md). PRs need @BenFrohman approval. See [COPYRIGHT](COPYRIGHT) and [LICENSE](LICENSE).

## Circularity note

Any argument that assumes every infinite team already falls into `{1,4,2}` in order to prove the remaining lemma is circular. The realized negative log-mean on the orbit of 27 is in that class.

## Zenodo

No solution preprint is deposited. A paper titled as a proof of Collatz would be false on the present kernel.

Companions: [the-3n-plus-1-machine](https://github.com/BenFrohman/the-3n-plus-1-machine), [3n-plus-c-cycle-census](https://github.com/BenFrohman/3n-plus-c-cycle-census).
