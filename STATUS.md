# Status

Checked with Lean 4.22.0 (`lake build`).

Proved locally: the cycle `1 → 4 → 2 → 1`, the even inverse branch, halving of `2^k * m`, the odd-predecessor class `m ≡ 4 (mod 6)`, and the equivalence of the forward claim, the reverse-tree claim, and arrival at `{1,4,2}`.

Open, and the only `sorry`s: `remaining_lemma`, `remaining_lemma_reverse_tree`, `remaining_lemma_forward`. Those three are the same covering claim.
