/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Steiner 1977 unit equation for a 1-cycle:
  n (2^L - 3) = 1  forces  n = 1 and L = 2.
This is Prop. 1.1 on the ledger. It is not Lemma 1.
-/

namespace CollatzTeaming

/-- Saturated Nat form of the 1-cycle closing equation. -/
def steinerEq (n L : Nat) : Prop :=
  n * (2 ^ L - 3) = 1

theorem steiner_L2 : steinerEq 1 2 := by
  native_decide

/-- If the product is 1 then both factors are 1. -/
theorem steiner_factors {n L : Nat} (h : steinerEq n L) :
    n = 1 ∧ 2 ^ L - 3 = 1 := by
  have hn : n ≠ 0 := by
    intro hz
    simp [steinerEq, hz] at h
  have hk : 2 ^ L - 3 ≠ 0 := by
    intro hz
    simp [steinerEq, hz] at h
  have : n = 1 := by
    have : n * (2 ^ L - 3) = 1 := h
    omega
  exact ⟨this, by simpa [this] using h⟩

theorem steiner_L_eq_two {n L : Nat} (h : steinerEq n L) : L = 2 := by
  have ⟨hn, hk⟩ := steiner_factors h
  match L with
  | 0 => simp at hk
  | 1 => simp at hk
  | 2 => rfl
  | k + 3 =>
    have : 2 ^ (k + 3) - 3 ≥ 5 := by
      have : 2 ^ (k + 3) ≥ 8 := by
        have : 2 ^ 3 ≤ 2 ^ (k + 3) := Nat.pow_le_pow_right (by decide : 0 < 2) (Nat.le_add_left 3 k)
        exact this
      omega
    omega

theorem steiner_one_cycle {n L : Nat} (h : steinerEq n L) : n = 1 ∧ L = 2 :=
  ⟨(steiner_factors h).1, steiner_L_eq_two h⟩

end CollatzTeaming
