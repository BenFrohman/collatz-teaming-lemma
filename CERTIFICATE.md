# Build certificate

Author: Benjamin Stanley Frohman
Copyright (c) 2026 Benjamin Stanley Frohman
License: Apache License 2.0 (see LICENSE)

This certificate records a local build. It does not certify a proof of the Collatz conjecture.

## Kernel certificate, 22 November 2026

This is the current machine check of the built library. It does not prove the Collatz conjecture.

- Toolchain: `leanprover/lean4:v4.34.0` (Lean commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`), Lake 5.0.0-src+293d5d0, no Mathlib
- Run [44968452979](https://github.com/BenFrohman/collatz-teaming-lemma/actions/runs/44968452979), commit `134483cd`, 2026-11-22T00:49:16Z
- Recheck [45083068264](https://github.com/BenFrohman/collatz-teaming-lemma/actions/runs/45083068264), commit `230089be`, 2026-11-22T23:24:32Z, same audit
- `lake build`: 22 jobs. Sorry scan: 0 hits in 30 Lean files. `#print axioms`: 126 theorems in 18 modules, only `propext`, `Classical.choice`, `Quot.sound`, or none. No `sorryAx`. Leanchecker: 20 of 20 modules, 0 failures
- `RemainingLemma` is not one of those 126 theorems
- Paper PDF with this certificate appended: [10.5281/zenodo.24451077](https://doi.org/10.5281/zenodo.24451077)

The 4 October and 3 November notes below counted declarations by a different listing (107 in the root audit, 148 with the standalone modules). They are history. They are not the 22 November log.


- Toolchain: Lean 4.34.0, commit 293d5d0c0c3f3dded4688b3ccd6a33939ac5102b, Release
- Command: `lake build`
- Date: 2026-10-04
- Result: Build completed successfully (exit 0), 18 jobs
- Root imports every module under `CollatzTeaming/`

`lake build` (Lean 4.34.0): 0 `sorry`, no custom axioms. All 152 theorems depend only on `propext`, `Classical.choice`, `Quot.sound`.

The open covering claim is the named Prop `RemainingLemma`, taken as an explicit argument by `remaining_lemma`, `remaining_lemma_reverse_tree`, `remaining_lemma_forward`, and `covering_from_assumption`. `inclusion_not_binomial_tail` and `residue_count_for_terras` are proved. Local inverse steps, the Steiner equation, and the binomial generating bound are proved.

No dependency on Mathlib. No pull request to `leanprover-community/mathlib4` is eligible: this repository does not prove the conjecture.

## Coverage extension (2026-11-03)

The note "Root imports every module under `CollatzTeaming/`" above was not accurate for the earlier build; coverage is now:

- Added to the root import `CollatzTeaming.lean` and to `AxiomAudit.lean` (15 new theorems; 107 audited in total):
  `FirstDescent`, `MissingTerm`, `ZeroPath`. (`ReverseTree` was already covered, being imported by `Kernel`, `Axiom` and others.)
- Built and audited standalone (CI: `lake build CollatzTeaming.ParentRule CollatzTeaming.Scenes CollatzTeaming.TerrasDensity`, audit files
  `AxiomAudit_ParentRule.lean` (4), `AxiomAudit_Scenes.lean` (17), `AxiomAudit_TerrasDensity.lean` (1)): `ParentRule`, `Scenes`, `TerrasDensity`.
  They compile, contain no `sorry`, and use only `propext`, `Classical.choice`, `Quot.sound`, but they redeclare names already
  in the root (`parentsOf` and `syracuse` from `Kernel`, `DensityZero` from `Terras`), so they cannot be imported into the
  root without renaming declarations. In `Scenes`, `decide` was replaced by `decide +kernel` (kernel-checked; statements unchanged)
  because elaborator `decide` hit the recursion limit.

## Derived added (2026-11-03)

- `CollatzTeaming.Derived` is now built and audited standalone (CI: added to the standalone `lake build` line; audit file
  `AxiomAudit_Derived.lean`, 19 theorems, all with standard axioms only, none with `sorry`). It redeclares names already in the root
  or other standalone modules (`syracuse`, `syracuse_one`, `syracuse_five`, `syracuse_not_injective`, `orbit_two_pow_71`,
  `odd_inverse_parent`, ...), so it cannot be imported into the root.
- Seven orbit-table proofs changed from `decide` to `decide +kernel` (kernel-checked; statements unchanged; no `native_decide`).
- The former theorem `derived_does_not_close_collatz : (iter 111 27 = 1) ≠ CollatzConjecture` was removed and kept as a comment.
  Because `iter 111 27 = 1` is proved (`orbit_27_reaches`), that statement is equivalent to `¬ CollatzConjecture`: it is not a
  formalization of "these finite checks do not prove Collatz" (a claim about provability), and it is unprovable unless Collatz is false.

Totals: 107 theorems in the root audit; standalone audits ParentRule 4, Scenes 17, TerrasDensity 1, Derived 19 (148 declarations audited in all).

### Superseded note
Earlier text (kept for the record): - `CollatzTeaming.Derived` — does not compile. The orbit-table `decide` proofs hit the recursion limit, and the theorem
  `derived_does_not_close_collatz : (iter 111 27 = 1) ≠ CollatzConjecture` is not decidable (no `Decidable` instance), and proving it
  would amount to proving `¬ CollatzConjecture`. Not built, not certified.
