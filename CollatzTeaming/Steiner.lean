/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
/-
Steiner 1-cycle equation. Factor 1 by case split, not by omega.
Not the covering claim.
-/

namespace CollatzTeaming

def steinerEq (n L : Nat) : Prop :=
  n * (2 ^ L - 3) = 1

theorem steiner_L2 : steinerEq 1 2 := by
  unfold steinerEq
  decide

theorem nat_mul_eq_one {n m : Nat} (h : n * m = 1) : n = 1 ∧ m = 1 :=
  ⟨Nat.eq_one_of_mul_eq_one_right h, Nat.eq_one_of_mul_eq_one_left h⟩

theorem steiner_factors {n L : Nat} (h : steinerEq n L) :
    n = 1 ∧ 2 ^ L - 3 = 1 := by
  unfold steinerEq at h
  exact nat_mul_eq_one h

theorem steiner_L_eq_two {n L : Nat} (h : steinerEq n L) : L = 2 := by
  have hk : 2 ^ L - 3 = 1 := (steiner_factors h).2
  match L with
  | 0 => simp at hk
  | 1 => simp at hk
  | 2 => rfl
  | k + 3 =>
    have h8 : 8 ≤ 2 ^ (k + 3) := by
      have : 2 ^ 3 ≤ 2 ^ (k + 3) :=
        Nat.pow_le_pow_right (by decide : 0 < 2) (Nat.le_add_left 3 k)
      simpa using this
    omega

theorem steiner_one_cycle {n L : Nat} (h : steinerEq n L) : n = 1 ∧ L = 2 :=
  ⟨(steiner_factors h).1, steiner_L_eq_two h⟩

end CollatzTeaming
