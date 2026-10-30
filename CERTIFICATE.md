# Build certificate

Author: Benjamin Stanley Frohman
Copyright (c) 2026 Benjamin Stanley Frohman
License: Apache License 2.0 (see LICENSE)

This certificate records a local build. It does not certify a proof of the Collatz conjecture.

- Toolchain: Lean 4.34.0, commit 293d5d0c0c3f3dded4688b3ccd6a33939ac5102b, Release
- Command: `lake build`
- Date: 2026-10-04
- Result: Build completed successfully (exit 0), 18 jobs
- Root imports every module under `CollatzTeaming/`

`lake build` (Lean 4.34.0): 0 `sorry`, no custom axioms. All 152 theorems depend only on `propext`, `Classical.choice`, `Quot.sound`.

The open covering claim is the named Prop `RemainingLemma`, taken as an explicit argument by `remaining_lemma`, `remaining_lemma_reverse_tree`, `remaining_lemma_forward`, and `covering_from_assumption`. `inclusion_not_binomial_tail` and `residue_count_for_terras` are proved. Local inverse steps, the Steiner equation, and the binomial generating bound are proved.

No dependency on Mathlib. No pull request to `leanprover-community/mathlib4` is eligible: this repository does not prove the conjecture.
