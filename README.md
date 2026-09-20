# Collatz teaming lemma — Lean skeleton

**Author:** Benjamin Stanley Frohman (`@Investor0x`, GitHub `BenFrohman`)

**Status: the remaining lemma is not certified.**

This repository records the exact logical status of the remaining lemma on [The 3n+1 Machine](https://slate-terra-autumn-meadow.grok.me):

> every infinite team eventually maps into the cycle `{1,4,2}`.

That sentence is the Collatz conjecture on the positive integers. Lean records the equivalence and leaves the kernel open.

## What is certified

- The classical map `T`.
- The trivial cycle `1 → 4 → 2 → 1`.
- The definition of inverse-residue teams.
- `RemainingLemma ↔ CollatzConjecture` by definition.

## What is not certified

```lean
theorem remaining_lemma : RemainingLemma := by
  sorry
```

A `sorry` here is required. Closing it would be a proof of Collatz. No such proof is supplied. Visual orbits on the site, Terras density, Tao almost-boundedness, and the machine check below `2^68` do not discharge this theorem.

## Circularity note

Any argument that assumes every infinite team already falls into `{1,4,2}` in order to prove the remaining lemma is circular: it assumes the conclusion.

## Zenodo

No solution preprint is deposited. A paper titled as a proof of Collatz would be false on the present kernel. If a note is archived later, it must state that the remaining lemma is open.

Companion presentation: `BenFrohman/the-3n-plus-1-machine`.
