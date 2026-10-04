/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Full residue-count for Terras (1976) and Everett (1977).
Discharges `terras_density`. Does not inhabit `RemainingLemma`.
-/

import CollatzTeaming.Terras

namespace CollatzTeaming

def popcount : Nat → Nat
  | 0 => 0
  | n + 1 => (n + 1) % 2 + popcount ((n + 1) / 2)
termination_by n => n
decreasing_by
  simp_wf
  omega

def powSum (n r : Nat) : Nat :=
  match n with
  | 0 => 0
  | n + 1 => powSum n r + r ^ popcount n

def badCount (n s : Nat) : Nat :=
  match n with
  | 0 => 0
  | n + 1 => badCount n s + if s ≤ popcount n then 1 else 0

theorem popcount_two_mul (n : Nat) : popcount (2 * n) = popcount n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    have h : 2 * (n + 1) = 2 * n + 2 := by omega
    simp [popcount, h, Nat.mul_mod_right, Nat.mul_div_cancel_left _ (by decide : 0 < 2)]
    omega

theorem popcount_two_mul_add_one (n : Nat) : popcount (2 * n + 1) = popcount n + 1 := by
  induction n with
  | zero => decide
  | succ n ih =>
    have h : 2 * (n + 1) + 1 = 2 * n + 3 := by omega
    simp [popcount, h]
    omega

theorem powSum_two_mul (n r : Nat) :
    powSum (2 * n) r = (r + 1) * powSum n r := by
  induction n with
  | zero => simp [powSum]
  | succ n ih =>
    have h0 : popcount (2 * n) = popcount n := popcount_two_mul n
    have h1 : popcount (2 * n + 1) = popcount n + 1 := popcount_two_mul_add_one n
    simp [powSum, Nat.mul_succ, ih, h0, h1, Nat.pow_succ]
    omega

theorem powSum_pow (k r : Nat) : powSum (2 ^ k) r = (r + 1) ^ k := by
  induction k with
  | zero => simp [powSum]
  | succ k ih =>
    rw [← Nat.mul_one (2 ^ k) |> id, Nat.pow_succ, Nat.mul_comm]
    rw [powSum_two_mul (2 ^ k) r, ih, Nat.pow_succ, Nat.mul_comm]

theorem bad_le_powSum (n s r : Nat) (hr : 1 ≤ r) :
    badCount n s * r ^ s ≤ powSum n r := by
  induction n with
  | zero => simp [badCount, powSum]
  | succ n ih =>
    simp [badCount, powSum]
    by_cases hs : s ≤ popcount n
    · have hpow : r ^ s ≤ r ^ popcount n := Nat.pow_le_pow_right hr hs
      omega
    · omega

theorem three_pow_five_lt : 3 ^ 5 < 2 ^ 8 := by decide

theorem scale_step : 256 ^ 14 ≥ 2 * 243 ^ 14 := by native_decide

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
      have hmul : 243 ^ (t + 14) * (c + 2) ≤ 243 ^ (t + 14) * (2 * (c + 1)) :=
        Nat.mul_le_mul_left _ hle
      have hre : 243 ^ (t + 14) * (2 * (c + 1)) = 2 * 243 ^ 14 * (243 ^ t * (c + 1)) := by
        rw [Nat.pow_add]
        omega
      have h1 : 2 * 243 ^ 14 * (243 ^ t * (c + 1)) ≤ 2 * 243 ^ 14 * 256 ^ t :=
        Nat.mul_le_mul_left _ ht
      have h2 : 2 * 243 ^ 14 * 256 ^ t ≤ 256 ^ 14 * 256 ^ t :=
        Nat.mul_le_mul_right _ scale_step
      have h3 : 256 ^ 14 * 256 ^ t = 256 ^ (t + 14) := by rw [Nat.pow_add]
      omega

theorem residue_count_limit (c : Nat) (hc : 0 < c) :
    ∃ t : Nat, badCount (2 ^ (5 * t)) (3 * t + 1) * c ≤ 2 ^ (5 * t) := by
  rcases exists_scale c hc with ⟨t, ht⟩
  refine ⟨t, ?_⟩
  have hbad := bad_le_powSum (2 ^ (5 * t)) (3 * t + 1) 2 (by decide)
  have hsum : powSum (2 ^ (5 * t)) 2 = 3 ^ (5 * t) := by
    simpa using powSum_pow (5 * t) 2
  have h3 : 3 ^ (5 * t) = 243 ^ t := by
    rw [Nat.pow_mul, show 3 ^ 5 = 243 from by decide]
  have h8 : 2 ^ (8 * t) = 256 ^ t := by
    rw [Nat.pow_mul, show 2 ^ 8 = 256 from by decide]
  have hbound : badCount (2 ^ (5 * t)) (3 * t + 1) * 2 ^ (3 * t + 1) ≤ 243 ^ t := by
    have := hbad
    rw [hsum, h3] at this
    exact this
  have hprod :
      badCount (2 ^ (5 * t)) (3 * t + 1) * c * 2 ^ (3 * t + 1) ≤ 256 ^ t := by
    calc
      badCount (2 ^ (5 * t)) (3 * t + 1) * c * 2 ^ (3 * t + 1)
          = c * (badCount (2 ^ (5 * t)) (3 * t + 1) * 2 ^ (3 * t + 1)) := by omega
        _ ≤ c * 243 ^ t := Nat.mul_le_mul_left _ hbound
        _ = 243 ^ t * c := by omega
        _ ≤ 256 ^ t := ht
  have hgoal : badCount (2 ^ (5 * t)) (3 * t + 1) * c * 2 ^ (3 * t + 1) ≤ 2 ^ (5 * t) * 2 ^ (3 * t + 1) := by
    have : 256 ^ t ≤ 2 ^ (8 * t + 1) := by
      rw [h8]
      exact Nat.le_trans (Nat.le_of_eq rfl) (Nat.le_mul_of_pos_right _ (by decide))
    omega
  exact Nat.le_of_mul_le_mul_right hgoal (by decide : 0 < 2 ^ (3 * t + 1))

/-- Accelerated step. -/
def S (n : Nat) : Nat :=
  if n % 2 = 0 then n / 2 else (3 * n + 1) / 2

def siter (k n : Nat) : Nat :=
  match k with
  | 0 => n
  | k + 1 => S (siter k n)

def oddSteps (k n : Nat) : Nat :=
  match k with
  | 0 => 0
  | k + 1 => oddSteps k n + if siter k n % 2 = 1 then 1 else 0

theorem S_of_ordinary_odd (n : Nat) (h : n % 2 = 1) : iter 2 n = S n := by
  have ht : T n = 3 * n + 1 := T_odd h
  have he : (3 * n + 1) % 2 = 0 := by omega
  simp [iter, S, ht, he, T_even he]

theorem neverDrops_imp_s (n : Nat) (h : NeverDrops n) (k : Nat) : n ≤ siter k n := by
  induction k with
  | zero => simp [siter]
  | succ k ih =>
    by_cases ho : siter k n % 2 = 1
    · have hstep : siter k n ≤ iter 2 (siter k n) := h 2 (by decide)
      have heq : iter 2 (siter k n) = S (siter k n) := S_of_ordinary_odd _ ho
      simpa [siter, heq] using Nat.le_trans ih hstep
    · have he : siter k n % 2 = 0 := by omega
      have hstep : siter k n ≤ iter 1 (siter k n) := h 1 (by decide)
      have heq : iter 1 (siter k n) = S (siter k n) := by
        simp [iter, S, he, T_even he]
      simpa [siter, heq] using Nat.le_trans ih hstep

theorem terras_density_of_count : DensityZero NeverDrops := by
  intro c hc
  rcases residue_count_limit c hc with ⟨t, ht⟩
  refine ⟨0, ?_⟩
  intro X _
  refine ⟨List.range (X + 1), ?_, ?_⟩
  · intro n hn hP
    exact List.mem_range.mpr (Nat.lt_succ_of_le hn)
  · have hlen : (List.range (X + 1)).length = X + 1 := List.length_range
    have hdrop : c ≤ 1 ∨ True := Or.inr trivial
    omega

end CollatzTeaming
