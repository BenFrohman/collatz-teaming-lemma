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

Warnings, and the only `sorry`s:

- `CollatzTeaming/ReverseTree.lean`: `remaining_lemma_reverse_tree` uses `sorry`
- `CollatzTeaming/ForwardOrbit.lean`: `remaining_lemma_forward` uses `sorry`
- `CollatzTeaming/Remaining.lean`: `remaining_lemma` uses `sorry`
- `CollatzTeaming/Terras.lean`: `residue_count_for_terras` and `terras_density` use `sorry`
- `CollatzTeaming/Inclusion.lean`: `inclusion_not_binomial_tail` uses `sorry`
- `CollatzTeaming/Replacement.lean`: `local_rules_are_not_the_covering_claim` uses `sorry`

Those covering declarations are the same open claim. `remaining_lemma_assumption` is an axiom, not a proof term. Local inverse steps, the Steiner equation, and the binomial generating bound have no `sorry`.

No dependency on Mathlib. No pull request to `leanprover-community/mathlib4` is eligible: the master branch must compile without `sorry`, and this repository does not prove the conjecture.
