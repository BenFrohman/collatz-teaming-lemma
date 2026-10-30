<!-- Copyright (c) 2026 Benjamin Stanley Frohman. Licensed under Apache-2.0. -->
# Status

Checked with Lean 4.34.0 (`lake build`): 0 `sorry`, no custom axioms, 152 theorems whose axioms are only `propext`, `Classical.choice`, `Quot.sound`.

Proved: the cycle `1 → 4 → 2 → 1`, the even inverse branch, halving of `2^k * m`, the odd-predecessor class `m ≡ 4 (mod 6)`, the equivalence of the forward claim, the reverse-tree claim, and arrival at `{1,4,2}`, the finite orbit certificates (`decide +kernel`), `inclusion_not_binomial_tail`, and `residue_count_for_terras`.

Conditional on the named hypothesis `RemainingLemma` (open; equivalent to Collatz): `remaining_lemma`, `remaining_lemma_reverse_tree`, `remaining_lemma_forward`, `covering_from_assumption`.
