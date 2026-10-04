# Build certificate

Author: Benjamin Stanley Frohman
Copyright (c) 2026 Benjamin Stanley Frohman
License: Apache License 2.0 (see LICENSE)

This certificate records a local build. It does not certify a proof of the Collatz conjecture.

- Toolchain: Lean 4.22.0, commit ba2cbbf09d4978f416e0ebd1fceeebc2c4138c05, Release
- Command: `lake build`
- Date: 2026-10-04T20:25:39Z
- Result: Build completed successfully (exit 0)

Warnings, and the only `sorry`s:

- `CollatzTeaming/ReverseTree.lean`: `remaining_lemma_reverse_tree` uses `sorry`
- `CollatzTeaming/ForwardOrbit.lean`: `remaining_lemma_forward` uses `sorry`
- `CollatzTeaming/Remaining.lean`: `remaining_lemma` uses `sorry`

Those three declarations are the same covering claim. Local inverse and forward steps have no `sorry`.

No dependency on Mathlib. No pull request to `leanprover-community/mathlib4` is eligible: the master branch must compile without `sorry`, and this repository does not prove the conjecture.
