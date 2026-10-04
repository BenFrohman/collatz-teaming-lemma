/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Corrected Terras tail. The generating bound is proved.
This file does not prove RemainingLemma.
-/

namespace CollatzTeaming

/-- Number of length-`k` binary words with at least `m` ones. -/
def badCount : Nat → Nat → Nat
  | 0, 0 => 1
  | 0, _ + 1 => 0
  | k + 1, 0 => 2 ^ (k + 1)
  | k + 1, m + 1 => badCount k m + badCount k (m + 1)

theorem badCount_zero_left (m : Nat) : badCount 0 (m + 1) = 0 := rfl

theorem badCount_zero_right (k : Nat) : badCount k 0 = 2 ^ k := by
  cases k <;> rfl

theorem two_le_three_pow (k : Nat) : 2 ^ k ≤ 3 ^ k := by
  induction k with
  | zero => simp
  | succ k ih =>
    calc
      2 ^ (k + 1) = 2 * 2 ^ k := by rw [Nat.pow_succ]
      _ ≤ 3 * 2 ^ k := Nat.mul_le_mul_right _ (by decide)
      _ ≤ 3 * 3 ^ k := Nat.mul_le_mul_left _ ih
      _ = 3 ^ (k + 1) := by rw [Nat.pow_succ]

/-- Generating bound: each one is weighted by `2`, and `(1 + 2) ^ k = 3 ^ k`. -/
theorem gen_bound (k m : Nat) : 2 ^ m * badCount k m ≤ 3 ^ k := by
  induction k generalizing m with
  | zero =>
    cases m with
    | zero => simp [badCount]
    | succ m => simp [badCount]
  | succ k ih =>
    cases m with
    | zero =>
      rw [badCount_zero_right]
      exact two_le_three_pow (k + 1)
    | succ m =>
      have h1 : 2 ^ m * badCount k m ≤ 3 ^ k := ih m
      have h2 : 2 ^ (m + 1) * badCount k (m + 1) ≤ 3 ^ k := ih (m + 1)
      calc
        2 ^ (m + 1) * badCount (k + 1) (m + 1)
            = 2 ^ (m + 1) * (badCount k m + badCount k (m + 1)) := by rfl
        _ = 2 ^ (m + 1) * badCount k m + 2 ^ (m + 1) * badCount k (m + 1) := by
              rw [Nat.mul_add]
        _ = 2 * (2 ^ m * badCount k m) + 2 ^ (m + 1) * badCount k (m + 1) := by
              rw [Nat.pow_succ, Nat.mul_assoc]
        _ ≤ 2 * 3 ^ k + 3 ^ k := by
              apply Nat.add_le_add
              · exact Nat.mul_le_mul_left 2 h1
              · exact h2
        _ = 3 * 3 ^ k := by omega
        _ = 3 ^ (k + 1) := by rw [Nat.pow_succ, Nat.mul_comm]

theorem three_five_lt_two_eight : 243 < 256 := by decide

theorem block_tail (t : Nat) :
    2 ^ (3 * t) * badCount (5 * t) (3 * t) ≤ 243 ^ t := by
  have h := gen_bound (5 * t) (3 * t)
  simpa [Nat.pow_mul, Nat.mul_comm] using h

theorem all_words (t : Nat) : 2 ^ (5 * t) = 32 ^ t := by
  simpa [Nat.pow_mul] using rfl

/-- `(243/256)^t` tail: the bad-word count is at most this fraction of `2^(5t)`. -/
theorem tail_ratio (t : Nat) :
    badCount (5 * t) (3 * t) * 32 ^ t ≤ 243 ^ t * 4 ^ t := by
  have h := block_tail t
  have hsplit : 2 ^ (5 * t) = 2 ^ (3 * t) * 2 ^ (2 * t) := by
    rw [← Nat.pow_add, Nat.add_mul]
    simp
  calc
    badCount (5 * t) (3 * t) * 32 ^ t
        = badCount (5 * t) (3 * t) * 2 ^ (5 * t) := by rw [all_words]
    _ = badCount (5 * t) (3 * t) * (2 ^ (3 * t) * 2 ^ (2 * t)) := by rw [hsplit]
    _ = (2 ^ (3 * t) * badCount (5 * t) (3 * t)) * 2 ^ (2 * t) := by
          rw [Nat.mul_comm (badCount _ _) (2 ^ (3 * t)), Nat.mul_assoc]
    _ ≤ 243 ^ t * 2 ^ (2 * t) := Nat.mul_le_mul_right _ h
    _ = 243 ^ t * 4 ^ t := by rw [Nat.pow_mul]

end CollatzTeaming
