<!-- Copyright (c) 2026 Benjamin Stanley Frohman. Licensed under Apache-2.0. -->
# STATUS

**Author:** Benjamin Stanley Frohman  
**Date:** 2026-11-23  

## RemainingLemma

The isolated open covering claim (see `CollatzTeaming/Remaining.lean` and `CollatzTeaming/ReverseTree.lean`):

```lean
def RemainingLemma : Prop :=
  ∀ n : Nat, 0 < n → InReverseTree n

theorem remaining_lemma_iff_collatz : RemainingLemma ↔ CollatzConjecture
```

`RemainingLemma` is a named proposition. It is not proved, and it is not a `sorry`.

## Equivalence (proved)

The theorem `remaining_lemma_iff_collatz` is kernel-checked and sorry-free. It is the definitional equivalence between the isolated residual team lemma and the standard Collatz covering claim. Forms that take `h : RemainingLemma` as a hypothesis (`remaining_lemma`, `remaining_lemma_from_assumption`, `remaining_lemma_forward`, `remaining_lemma_reverse_tree`, `covering_from_assumption`) are conditional restatements, not a proof of the covering claim.

## Also proved (kernel-checked, sorry-free)

- the inverse-team / parent-rule scaffolding and the reverse tree of 1
- finite orbit certificates (including the classical hailstone of 27)

Four modules (`CollatzTeaming.Derived`, `CollatzTeaming.ParentRule`, `CollatzTeaming.Scenes`, `CollatzTeaming.TerrasDensity`) are not imported by the root library because they reuse theorem names already declared in `Kernel` and `Terras`. They are still part of the development: official CI builds, sorry-scans, axiom-audits, and kernel-checks them separately.

## Open

- `RemainingLemma` and the equivalent `CollatzConjecture` are not proved.
- `TerrasDensity` is a stated density claim only; this repository does not prove it. Density zero of the non-descending set is not the covering claim.

## Axiom audit

`#print axioms` on the scaffolding reports only the standard Lean axioms (`propext`, `Classical.choice`, `Quot.sound`). This repository has no Mathlib dependency and no custom axioms.

## Explicit sentence

**RemainingLemma is definitionally equivalent to the Collatz conjecture and is not proved.**

## Build

Official CI `lake build` succeeds on the root library and on the four unimported modules. Zero `sorry` / `admit` / `native_decide` in every tracked `.lean` file and in the full lake build log. The open core is isolated as named propositions.

## Repository

https://github.com/BenFrohman/collatz-teaming-lemma

This is a kernel-verified certificate of the reduction. It is not a proof of the Collatz conjecture.
