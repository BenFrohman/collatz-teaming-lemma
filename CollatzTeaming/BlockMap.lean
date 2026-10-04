/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Block-map checks. Equality is decided after unfolding, so Lean 4.34
can synthesize Decidable. Not the covering claim.
-/

namespace CollatzTeaming

def blockClose (n k ell n' : Nat) : Prop :=
  2 ^ (k + ell) * n' + 2 ^ k = 3 ^ k * (n + 1)

theorem frohman_trivial_block : blockClose 1 1 1 1 := by
  unfold blockClose
  decide

theorem trivial_block : blockClose 1 1 1 1 := frohman_trivial_block

theorem frohman_block_n3_k2 : blockClose 3 2 0 8 := by
  unfold blockClose
  decide

theorem block_n3_k2 : blockClose 3 2 0 8 := frohman_block_n3_k2

theorem frohman_odd_mod4 (n : Nat) (h : n % 2 = 1) :
    n % 4 = 1 ∨ n % 4 = 3 := by
  have : n % 4 < 4 := Nat.mod_lt n (by decide)
  omega

theorem odd_mod4 (n : Nat) (h : n % 2 = 1) :
    n % 4 = 1 ∨ n % 4 = 3 := frohman_odd_mod4 n h

end CollatzTeaming
