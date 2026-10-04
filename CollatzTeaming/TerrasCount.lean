/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

The residue-count limit in Terras (1976) and Everett (1977):
the proportion of length-k parity vectors with 3^m < 2^k tends to 1.
This is not a proof of RemainingLemma.
-/

namespace CollatzTeaming

def popcount : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) % 2 + popcount ((n + 1) / 2)
termination_by n => n
decreasing_by
  simp_wf
  omega

def sumPowPop : Nat → Nat → Nat
  | 0, _ => 0
  | i + 1, r => r ^ popcount i + sumPowPop i r

theorem sumPowPop_zero (r : Nat) : sumPowPop 0 r = 0 := rfl

theorem popcount_zero : popcount 0 = 0 := rfl

theorem popcount_mul_two (n : Nat) : popcount (2 * n) = popcount n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have h : 2 * (n + 1) = 2 * n + 2 := by omega
    simp [popcount, h, Nat.mul_mod_right, Nat.mul_div_cancel_left _ (by decide : 0 < 2)]
    omega

theorem popcount_mul_two_add_one (n : Nat) : popcount (2 * n + 1) = popcount n + 1 := by
  induction n with
  | zero => decide
  | succ n ih =>
    have h : 2 * (n + 1) + 1 = 2 * n + 3 := by omega
    simp [popcount, h]
    omega

theorem sumPowPop_pow_succ (k r : Nat) :
    sumPowPop (2 ^ (k + 1)) r = (r + 1) * sumPowPop (2 ^ k) r := by
  induction k with
  | zero =>
    simp [sumPowPop, popcount]
    omega
  | succ k ih =>
    sorry

theorem sumPowPop_pow (k r : Nat) :
    sumPowPop (2 ^ k) r = (r + 1) ^ k := by
  induction k with
  | zero => simp [sumPowPop]
  | succ k ih =>
    rw [sumPowPop_pow_succ, ih, Nat.pow_succ, Nat.mul_comm]

def badVectors (k bound : Nat) : Nat :=
  let rec go : Nat → Nat
    | 0 => 0
    | i + 1 => go i + if bound ≤ popcount i then 1 else 0
  go (2 ^ k)

theorem badVectors_le_gen (k s r : Nat) (hr : 0 < r) :
    badVectors k s * r ^ s ≤ sumPowPop (2 ^ k) r := by
  sorry

theorem three_five_lt_two_eight : 3 ^ 5 < 2 ^ 8 := by decide

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
      have hle : c + 1 + 1 ≤ 2 * (c + 1) := by omega
      calc
        243 ^ (t + 14) * (c + 1 + 1)
            ≤ 243 ^ (t + 14) * (2 * (c + 1)) := by
              gcongr
              exact hle
          _ = 2 * 243 ^ 14 * (243 ^ t * (c + 1)) := by
              rw [Nat.pow_add]
              ring
          _ ≤ 2 * 243 ^ 14 * 256 ^ t := by
              gcongr
              exact ht
          _ ≤ 256 ^ 14 * 256 ^ t := by
              gcongr
              exact growth_243_256
          _ = 256 ^ (t + 14) := by
              rw [Nat.pow_add]

theorem residue_count_limit (c : Nat) (hc : 0 < c) :
    ∃ t : Nat, badVectors (5 * t) (3 * t + 1) * c ≤ 2 ^ (5 * t) := by
  rcases exists_scale c hc with ⟨t, ht⟩
  refine ⟨t, ?_⟩
  have hgen := badVectors_le_gen (5 * t) (3 * t + 1) 2 (by decide)
  have hsum := sumPowPop_pow (5 * t) 2
  sorry

end CollatzTeaming
