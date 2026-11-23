<!-- Copyright (c) 2026 Benjamin Stanley Frohman. Licensed under Apache-2.0. -->
# STATUS

**Author:** Benjamin Stanley Frohman  
**Date:** 2026-11-23  

## RemainingLemma

The isolated open statement (see `CollatzTeaming/Remaining.lean`):

```lean
theorem remaining_lemma_iff_collatz : RemainingLemma ↔ CollatzConjecture
```

## Equivalence

The theorem `remaining_lemma_iff_collatz` proves the definitional equivalence between the isolated residual team lemma and the standard Collatz covering claim. No `sorry` is used in the equivalence or the scaffolding.

## Axiom audit

`#print axioms` on the scaffolding reports only standard Mathlib axioms (`propext`, `Classical.choice`, `Quot.sound`). No custom axioms.

## Explicit sentence

**RemainingLemma is definitionally equivalent to the Collatz conjecture and is not proved.**

## Build

`lake build` succeeds. Zero `sorry` in proved lemmas. The open core is isolated.

## Repository

https://github.com/BenFrohman/collatz-teaming-lemma

This is a kernel-verified certificate of the reduction. It is not a proof of the Collatz conjecture.
