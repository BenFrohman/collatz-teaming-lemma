/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Terras (1976) and Everett (1977): almost every positive integer has finite
stopping time. This file states that theorem and proves the local descent
inequality. It does not prove RemainingLemma.
-/

import CollatzTeaming.ReverseTree

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

/-- Terras–Everett: the set that never drops has density zero.
    Not formalized in this repository. Not a term of type `RemainingLemma`. -/
theorem terras_density : DensityZero NeverDrops := by
  sorry

/-- Affine descent: if the k-th image has the shape `(3^m n + a) / 2^k`
    and `2^k > 3^m`, then every large enough `n` in that class drops. -/
theorem drop_of_affine (n k m a : Nat)
    (hk : 0 < k) (hpow : 3 ^ m < 2 ^ k)
    (himg : iter k n * 2 ^ k = 3 ^ m * n + a)
    (hbig : a < (2 ^ k - 3 ^ m) * n) :
    FiniteStoppingTime n := by
  have h2 : 0 < 2 ^ k := Nat.pow_pos (by decide : 0 < 2)
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
