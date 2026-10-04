/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Residue-count limit of Terras (1976) and Everett (1977).
Length-k parity vectors with at least 3k/5 odd steps are a vanishing
fraction of the 2^k classes. Those are the non-contracting classes.
This is not an inhabitant of RemainingLemma.
-/

namespace CollatzTeaming

/-- Number of length-`n` binary vectors with at least `s` ones. -/
def tail : Nat → Nat → Nat
  | 0, 0 => 1
  | 0, _ + 1 => 0
  | n + 1, 0 => 2 ^ (n + 1)
  | n + 1, s + 1 => tail n s + tail n (s + 1)

theorem tail_zero (n : Nat) : tail n 0 = 2 ^ n := by
  induction n with
  | zero => rfl
  | succ n _ => rfl

theorem two_pow_le_three_pow (n : Nat) : 2 ^ n ≤ 3 ^ n := by
  induction n with
  | zero => decide
  | succ n ih =>
    calc
      2 ^ (n + 1) = 2 * 2 ^ n := by rw [Nat.pow_succ]
      _ ≤ 3 * 2 ^ n := Nat.mul_le_mul_right _ (by decide)
      _ ≤ 3 * 3 ^ n := Nat.mul_le_mul_left _ ih
      _ = 3 ^ (n + 1) := by rw [Nat.pow_succ]

theorem tail_le (n s : Nat) : tail n s * 2 ^ s ≤ 3 ^ n := by
  induction n generalizing s with
  | zero =>
    cases s with
    | zero => simp [tail]
    | succ s => simp [tail]
  | succ n ih =>
    cases s with
    | zero =>
      simpa [tail] using two_pow_le_three_pow (n + 1)
    | succ s =>
      have h1 := ih s
      have h2 := ih (s + 1)
      have hsplit : tail (n + 1) (s + 1) * 2 ^ (s + 1)
          = tail n s * 2 ^ (s + 1) + tail n (s + 1) * 2 ^ (s + 1) := by
        simp [tail, Nat.add_mul]
      have hpow : 2 ^ (s + 1) = 2 * 2 ^ s := by rw [Nat.pow_succ]
      have hfirst : tail n s * 2 ^ (s + 1) ≤ 2 * 3 ^ n := by
        rw [hpow, ← Nat.mul_assoc]
        exact Nat.mul_le_mul_left 2 h1
      have hsum : tail n s * 2 ^ (s + 1) + tail n (s + 1) * 2 ^ (s + 1)
          ≤ 2 * 3 ^ n + 3 ^ n := Nat.add_le_add hfirst h2
      have hthree : 2 * 3 ^ n + 3 ^ n = 3 ^ (n + 1) := by
        rw [Nat.pow_succ]
        omega
      rw [hsplit]
      exact le_trans hsum (le_of_eq hthree)

theorem growth_243_256 : 256 ^ 14 ≥ 2 * 243 ^ 14 := by
  native_decide

theorem exists_scale (c : Nat) (hc : 0 < c) :
    ∃ t : Nat, 243 ^ t * c ≤ 256 ^ t := by
  induction c with
  | zero => omega
  | succ c ih =>
    cases c with
    | zero => exact ⟨0, by decide⟩
    | succ c =>
      rcases ih (Nat.succ_pos _) with ⟨t, ht⟩
      refine ⟨t + 14, ?_⟩
      have hle : c + 2 ≤ 2 * (c + 1) := by omega
      have hpow243 : 243 ^ (t + 14) = 243 ^ t * 243 ^ 14 := by
        rw [Nat.pow_add, Nat.mul_comm]
      have hpow256 : 256 ^ (t + 14) = 256 ^ 14 * 256 ^ t := by
        rw [Nat.pow_add]
      have hstep : 243 ^ (t + 14) * (c + 2) ≤ 256 ^ (t + 14) := by
        calc
          243 ^ (t + 14) * (c + 2)
              ≤ 243 ^ (t + 14) * (2 * (c + 1)) := Nat.mul_le_mul_left _ hle
            _ = 2 * 243 ^ 14 * (243 ^ t * (c + 1)) := by
                rw [hpow243]
                omega
            _ ≤ 2 * 243 ^ 14 * 256 ^ t := Nat.mul_le_mul_left _ ht
            _ ≤ 256 ^ 14 * 256 ^ t := Nat.mul_le_mul_right _ growth_243_256
            _ = 256 ^ (t + 14) := hpow256.symm
      exact hstep

theorem three_cube_lt_two_five : 3 ^ 3 < 2 ^ 5 := by decide

theorem contracting_block (t : Nat) (ht : 0 < t) : 3 ^ (3 * t) < 2 ^ (5 * t) := by
  have hbase : 3 ^ 3 < 2 ^ 5 := three_cube_lt_two_five
  have hpow := Nat.pow_lt_pow_left hbase ht
  simpa [Nat.pow_mul, Nat.mul_comm] using hpow

/-- For every positive `c` there is a length `k = 5t` such that the
    non-contracting parity vectors are at most a `1/c` fraction of the classes. -/
theorem residue_count_limit (c : Nat) (hc : 0 < c) :
    ∃ t : Nat,
      tail (5 * t) (3 * t + 1) * c ≤ 2 ^ (5 * t) ∧
      (t = 0 ∨ 3 ^ (3 * t) < 2 ^ (5 * t)) := by
  rcases exists_scale c hc with ⟨t, ht⟩
  refine ⟨t, ?_, ?_⟩
  · have htail := tail_le (5 * t) (3 * t + 1)
    have h3 : 3 ^ (5 * t) = 243 ^ t := by
      have h243 : 243 = 3 ^ 5 := by decide
      rw [h243, ← Nat.pow_mul, Nat.mul_comm]
    have hden : 2 ^ (3 * t + 1) * 2 ^ (5 * t) = 2 * 256 ^ t := by
      have h256 : 256 = 2 ^ 8 := by decide
      rw [h256, ← Nat.pow_add, ← Nat.pow_add, Nat.pow_succ]
      omega
    have hmul : tail (5 * t) (3 * t + 1) * 2 ^ (3 * t + 1) ≤ 243 ^ t := by
      rw [h3] at htail
      exact htail
    have hgoal : tail (5 * t) (3 * t + 1) * c ≤ 2 ^ (5 * t) := by
      have hscale : 243 ^ t * c ≤ 256 ^ t := ht
      have hbridge : tail (5 * t) (3 * t + 1) * c * 2 ^ (3 * t + 1)
          ≤ 2 * 256 ^ t := by
        calc
          tail (5 * t) (3 * t + 1) * c * 2 ^ (3 * t + 1)
              = c * (tail (5 * t) (3 * t + 1) * 2 ^ (3 * t + 1)) := by omega
            _ ≤ c * 243 ^ t := Nat.mul_le_mul_left _ hmul
            _ = 243 ^ t * c := by omega
            _ ≤ 256 ^ t := hscale
            _ ≤ 2 * 256 ^ t := Nat.le_mul_of_pos_left _ (by decide)
      have hdiv : tail (5 * t) (3 * t + 1) * c * 2 ^ (3 * t + 1)
          ≤ 2 ^ (3 * t + 1) * 2 ^ (5 * t) := by
        rw [hden]
        exact hbridge
      exact Nat.le_of_mul_le_mul_left hdiv (Nat.pow_pos (by decide : 0 < 2))
    exact hgoal
  · cases t with
    | zero => exact Or.inl rfl
    | succ t => exact Or.inr (contracting_block (t + 1) (Nat.succ_pos _))

end CollatzTeaming
