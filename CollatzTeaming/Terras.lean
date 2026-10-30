/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
/-
Terras (1976) and Everett (1977): almost every positive integer has finite
stopping time. The residue-count limit is proved in TerrasCount.lean.
The inclusion of NeverDrops in those bad classes is the remaining step of
this density theorem. This file does not prove RemainingLemma.
-/

import CollatzTeaming.ReverseTree
import CollatzTeaming.TerrasCount

namespace CollatzTeaming

/-- First return strictly below the start. -/
def FiniteStoppingTime (n : Nat) : Prop :=
  ∃ k : Nat, 0 < k ∧ iter k n < n

/-- The complementary event in Terras's theorem: no first descent. -/
def NeverDrops (n : Nat) : Prop :=
  ∀ k : Nat, 0 < k → n ≤ iter k n

theorem not_neverDrops_iff (n : Nat) :
    ¬ NeverDrops n ↔ FiniteStoppingTime n := by
  constructor
  · intro h
    by_cases h0 : ∃ k, 0 < k ∧ iter k n < n
    · exact h0
    · have h' : ∀ k, 0 < k → n ≤ iter k n := by
        intro k hk
        have : ¬ iter k n < n := by
          intro hlt
          exact h0 ⟨k, hk, hlt⟩
        omega
      exact False.elim (h h')
  · intro h hn
    rcases h with ⟨k, hk, hlt⟩
    exact Nat.not_le_of_gt hlt (hn k hk)

/-- A density-zero formulation that does not decide `NeverDrops`.
    Every non-dropping `n ≤ X` sits in some list of length `o(X)`. -/
def DensityZero (P : Nat → Prop) : Prop :=
  ∀ c : Nat, 0 < c →
    ∃ N : Nat, ∀ X : Nat, N ≤ X →
      ∃ bad : List Nat,
        (∀ n, n ≤ X → P n → n ∈ bad) ∧ bad.length * c ≤ X + 1

/-- Bernoulli-type bound: `243^t (243 + 13 t) ≤ 243 · 256^t`. -/
theorem bern_243_256 (t : Nat) : 243 ^ t * (243 + 13 * t) ≤ 243 * 256 ^ t := by
  induction t with
  | zero => decide
  | succ t ih =>
    have key : 243 ^ t * 243 * (243 + 13 * (t + 1)) ≤ 256 * (243 ^ t * (243 + 13 * t)) := by
      generalize 243 ^ t = A
      rw [Nat.mul_assoc, Nat.mul_left_comm 256 A]
      exact Nat.mul_le_mul_left A (by omega)
    calc 243 ^ (t + 1) * (243 + 13 * (t + 1)) = 243 ^ t * 243 * (243 + 13 * (t + 1)) := by
          rw [Nat.pow_succ]
      _ ≤ 256 * (243 ^ t * (243 + 13 * t)) := key
      _ ≤ 256 * (243 * 256 ^ t) := Nat.mul_le_mul_left _ ih
      _ = 243 * 256 ^ (t + 1) := by rw [Nat.pow_succ, Nat.mul_left_comm, Nat.mul_comm (256 ^ t) 256]

/-- `(256/243)^t` eventually exceeds any `c`. -/
theorem ratio_unbounded (c : Nat) : c * 243 ^ (243 * c) ≤ 256 ^ (243 * c) := by
  have h := bern_243_256 (243 * c)
  have h1 : 243 ^ (243 * c) * (13 * (243 * c)) ≤ 243 * 256 ^ (243 * c) :=
    Nat.le_trans (Nat.mul_le_mul_left _ (by omega)) h
  have h2 : 243 * (13 * (c * 243 ^ (243 * c))) ≤ 243 * 256 ^ (243 * c) := by
    have : 243 ^ (243 * c) * (13 * (243 * c)) = 243 * (13 * (c * 243 ^ (243 * c))) := by
      generalize 243 ^ (243 * c) = A
      rw [Nat.mul_comm A, Nat.mul_assoc 13, Nat.mul_assoc 243, Nat.mul_left_comm 13 243]
    omega
  have h3 := Nat.le_of_mul_le_mul_left h2 (by decide)
  omega

theorem cancel_bound (c t T : Nat) (hT : T * 2 ^ (3 * t + 1) ≤ 243 ^ t)
    (hr : c * 243 ^ t ≤ 256 ^ t) : T * c ≤ 2 ^ (5 * t) := by
  have e : 256 ^ t = 2 ^ (3 * t) * 2 ^ (5 * t) := by
    rw [← Nat.pow_add, show 3 * t + 5 * t = 8 * t by omega, Nat.pow_mul]
  have h1 : c * (T * 2 ^ (3 * t + 1)) ≤ c * 243 ^ t := Nat.mul_le_mul_left c hT
  have h2 : 2 ^ (3 * t) * (T * c) ≤ 2 ^ (3 * t) * 2 ^ (5 * t) := by
    have : 2 ^ (3 * t) * (T * c) ≤ c * (T * 2 ^ (3 * t + 1)) := by
      rw [Nat.pow_succ]
      generalize 2 ^ (3 * t) = P
      have hx : c * (T * (P * 2)) = P * (T * c) * 2 := by
        simp only [Nat.mul_comm, Nat.mul_assoc, Nat.mul_left_comm]
      rw [hx]
      exact Nat.le_mul_of_pos_right _ (by decide)
    omega
  exact Nat.le_of_mul_le_mul_left h2 (Nat.pow_pos (by decide))

/-- The residue count: for every `c > 0` some block length `5t` has at most a `1/c`
    fraction of parity words with more than `3t` odd steps. -/
theorem residue_count_for_terras (c : Nat) (_hc : 0 < c) :
    ∃ t : Nat, tail (5 * t) (3 * t + 1) * c ≤ 2 ^ (5 * t) := by
  refine ⟨243 * c, cancel_bound c (243 * c) _ ?_ (ratio_unbounded c)⟩
  have h := tail_le (5 * (243 * c)) (3 * (243 * c) + 1)
  rwa [Nat.pow_mul 3 5] at h


/-- Affine descent: if the k-th image has the shape `(3^m n + a) / 2^k`
    and `2^k > 3^m`, then every large enough `n` in that class drops. -/
theorem drop_of_affine (n k m a : Nat)
    (hk : 0 < k) (hpow : 3 ^ m < 2 ^ k)
    (himg : iter k n * 2 ^ k = 3 ^ m * n + a)
    (hbig : a < (2 ^ k - 3 ^ m) * n) :
    FiniteStoppingTime n := by
  have hmul : iter k n * 2 ^ k < n * 2 ^ k := by
    calc
      iter k n * 2 ^ k = 3 ^ m * n + a := himg
      _ < 3 ^ m * n + (2 ^ k - 3 ^ m) * n := Nat.add_lt_add_left hbig _
      _ = 2 ^ k * n := by
        have hsub : 3 ^ m + (2 ^ k - 3 ^ m) = 2 ^ k := Nat.add_sub_of_le (Nat.le_of_lt hpow)
        calc
          3 ^ m * n + (2 ^ k - 3 ^ m) * n = (3 ^ m + (2 ^ k - 3 ^ m)) * n := by
            rw [Nat.add_mul]
          _ = 2 ^ k * n := by rw [hsub]
      _ = n * 2 ^ k := Nat.mul_comm _ _
  have hlt : iter k n < n := Nat.lt_of_mul_lt_mul_right hmul
  exact ⟨k, hk, hlt⟩

/-- A first descent is weaker than membership in the reverse tree of 1. -/
theorem stopping_weaker_than_tree (n : Nat) (h : InReverseTree n) (hn : 1 < n) :
    FiniteStoppingTime n := by
  rcases h with ⟨k, hk⟩
  have hk0 : 0 < k := by
    cases k with
    | zero => simp [iter] at hk; omega
    | succ k => exact Nat.succ_pos k
  have hlt : iter k n < n := by
    rw [hk]
    omega
  exact ⟨k, hk0, hlt⟩

/-- Never dropping excludes the reverse tree, for `n > 1`.
    The converse is false: a descent below `n` need not reach 1. -/
theorem neverDrops_not_in_tree (n : Nat) (hn : 1 < n) (h : NeverDrops n) :
    ¬ InReverseTree n := by
  intro ht
  rcases stopping_weaker_than_tree n ht hn with ⟨k, hk, hlt⟩
  exact Nat.not_le_of_gt hlt (h k hk)

/-- The missing implication. Not asserted. A density-zero set may be infinite,
    and a first descent is not arrival at 1. -/
def density_does_not_cover : Prop :=
  DensityZero NeverDrops → RemainingLemma

end CollatzTeaming
