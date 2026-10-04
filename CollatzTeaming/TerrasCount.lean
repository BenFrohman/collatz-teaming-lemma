/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Corrected binomial tail. The generating bound is a theorem.
This does not inhabit RemainingLemma, and it does not by itself
inhabit DensityZero NeverDrops: the bad-class covering is separate.
-/

namespace CollatzTeaming

def popcount : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) % 2 + popcount ((n + 1) / 2)
termination_by n => n
decreasing_by
  simp_wf
  omega

theorem popcount_div (n : Nat) : popcount n = n % 2 + popcount (n / 2) := by
  cases n with
  | zero => rfl
  | succ n => rfl

theorem popcount_two_mul (n : Nat) : popcount (2 * n) = popcount n := by
  rw [popcount_div (2 * n)]
  have hmod : (2 * n) % 2 = 0 := Nat.mul_mod_right 2 n
  have hdiv : (2 * n) / 2 = n := Nat.mul_div_cancel_left n (by decide : 0 < 2)
  simp [hmod, hdiv]

theorem popcount_two_mul_add_one (n : Nat) : popcount (2 * n + 1) = popcount n + 1 := by
  rw [popcount_div (2 * n + 1)]
  have hmod : (2 * n + 1) % 2 = 1 := by omega
  have hdiv : (2 * n + 1) / 2 = n := by omega
  simp [hmod, hdiv]

/-- Sum of `r ^ popcount i` for `i < n`. -/
def powSum (n r : Nat) : Nat :=
  match n with
  | 0 => 0
  | n + 1 => powSum n r + r ^ popcount n

theorem powSum_succ (n r : Nat) : powSum (n + 1) r = powSum n r + r ^ popcount n := rfl

theorem powSum_two_mul (n : Nat) : powSum (2 * n) 2 = 3 * powSum n 2 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have hlen : 2 * (n + 1) = 2 * n + 2 := by omega
    rw [hlen, powSum_succ, powSum_succ, popcount_two_mul n, popcount_two_mul_add_one n, ih]
    have hpow : 2 ^ (popcount n + 1) = 2 * 2 ^ popcount n := by rw [Nat.pow_succ]
    omega

theorem powSum_dyadic (k : Nat) : powSum (2 ^ k) 2 = 3 ^ k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [Nat.pow_succ, Nat.mul_comm, powSum_two_mul (2 ^ k), ih, Nat.pow_succ, Nat.mul_comm]

/-- Number of `i < n` with popcount at least `s`. -/
def badCount (n s : Nat) : Nat :=
  match n with
  | 0 => 0
  | n + 1 => badCount n s + if s ≤ popcount n then 1 else 0

theorem badCount_succ (n s : Nat) :
    badCount (n + 1) s = badCount n s + if s ≤ popcount n then 1 else 0 := rfl

theorem bad_le_powSum (n s : Nat) : badCount n s * 2 ^ s ≤ powSum n 2 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [badCount_succ, powSum_succ]
    by_cases hs : s ≤ popcount n
    · have hpow : 2 ^ s ≤ 2 ^ popcount n := Nat.pow_le_pow_right (by decide) hs
      simp [hs]
      omega
    · simp [hs]
      omega

/-- The corrected generating bound. -/
theorem binomial_tail (k m : Nat) : badCount (2 ^ k) m * 2 ^ m ≤ 3 ^ k := by
  calc
    badCount (2 ^ k) m * 2 ^ m ≤ powSum (2 ^ k) 2 := bad_le_powSum (2 ^ k) m
    _ = 3 ^ k := powSum_dyadic k

end CollatzTeaming
