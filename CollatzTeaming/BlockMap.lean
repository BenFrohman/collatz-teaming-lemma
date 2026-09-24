/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Integer block-map identity.
T_1^k then ℓ extra halves:
  2^{k+ℓ} n' + 2^k = 3^k (n+1).
-/

namespace CollatzTeaming

/-- Closed-form identity for one block. -/
def blockClose (n k ell n' : Nat) : Prop :=
  2 ^ (k + ell) * n' + 2 ^ k = 3 ^ k * (n + 1)

/-- Trivial cycle C_0 as one block: 1 → 2 → 1. -/
theorem trivial_block : blockClose 1 1 1 1 := by
  native_decide

/-- n=3, k=2, ℓ=0 gives n'=8 = C(C(3)) under the shortcut. -/
theorem block_n3_k2 : blockClose 3 2 0 8 := by
  native_decide

/-- Residue lock: a second o-step needs n ≡ 3 (mod 4). -/
theorem odd_mod4 (n : Nat) (h : n % 2 = 1) : n % 4 = 1 ∨ n % 4 = 3 := by
  have : n % 4 < 4 := Nat.mod_lt n (by decide)
  omega

end CollatzTeaming
