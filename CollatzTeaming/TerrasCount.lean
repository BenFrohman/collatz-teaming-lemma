/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Residue count for Terras (1976) and Everett (1977).
The tail ratio is proved. It does not inhabit `RemainingLemma`,
and it is not yet a term of type `DensityZero NeverDrops`.
-/

namespace CollatzTeaming

theorem three_pow_five_lt_two_pow_eight : 3 ^ 5 < 2 ^ 8 := by
  decide

theorem three_pow_eight_lt_two_pow_thirteen : 3 ^ 8 < 2 ^ 13 := by
  decide

theorem pow_strict_mono {a b t : Nat} (h : a < b) (ht : 0 < t) : a ^ t < b ^ t := by
  induction t with
  | zero => omega
  | succ t ih =>
    cases t with
    | zero => simpa using h
    | succ t =>
      cases a with
      | zero =>
        have hb : 0 < b ^ (t + 2) := Nat.pow_pos (Nat.pos_of_lt h)
        simp [Nat.pow_succ, hb]
      | succ a =>
        have hlt : (a + 1) ^ (t + 1) < b ^ (t + 1) := ih (Nat.succ_pos t)
        calc
          (a + 1) ^ (t + 2) = (a + 1) ^ (t + 1) * (a + 1) := by rw [Nat.pow_succ]
          _ < b ^ (t + 1) * (a + 1) :=
              Nat.mul_lt_mul_of_pos_right hlt (Nat.succ_pos a)
          _ ≤ b ^ (t + 1) * b :=
              Nat.mul_le_mul_left _ h
          _ = b ^ (t + 2) := by rw [Nat.pow_succ]

/-- Odd-step density at most `5/8` is contracting: `3^5 < 2^8`. -/
theorem admissible_ratio (t : Nat) (ht : 0 < t) : 3 ^ (5 * t) < 2 ^ (8 * t) := by
  simpa [Nat.pow_mul, Nat.mul_comm] using
    pow_strict_mono three_pow_five_lt_two_pow_eight ht

/-- Residue-count ratio. The generating-function tail above `5k/8`
    decays as `(3^8 / 2^13)^t` for `k = 8 t`. -/
theorem residue_count_ratio (t : Nat) (ht : 0 < t) : 3 ^ (8 * t) < 2 ^ (13 * t) := by
  simpa [Nat.pow_mul, Nat.mul_comm] using
    pow_strict_mono three_pow_eight_lt_two_pow_thirteen ht

/-- The ratio absorbs a fixed density constant once `c ≤ 2^t`. -/
theorem residue_count_absorbs (t c : Nat) (ht : 0 < t) (hc : c ≤ 2 ^ t) :
    3 ^ (8 * t) * c < 2 ^ (13 * t) * 2 ^ t := by
  have h := residue_count_ratio t ht
  have hle : 3 ^ (8 * t) * c ≤ 3 ^ (8 * t) * 2 ^ t := Nat.mul_le_mul_left _ hc
  have hlt : 3 ^ (8 * t) * 2 ^ t < 2 ^ (13 * t) * 2 ^ t :=
    Nat.mul_lt_mul_of_pos_right h (Nat.two_pow_pos t)
  exact Nat.lt_of_le_of_lt hle hlt

end CollatzTeaming
