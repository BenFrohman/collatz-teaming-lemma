/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/

import CollatzTeaming.Basic

/-!
# Terras density, as a statement

Terras (1976) and Everett (1977): almost every positive integer has a first
descent below its start. This file states that claim. It does not prove it,
and it does not prove `RemainingLemma`.
-/

namespace CollatzTeaming

/-- Some positive iterate falls strictly below the start. -/
def FiniteStoppingTime (n : Nat) : Prop :=
  ∃ k : Nat, 0 < k ∧ iter k n < n

/-- No first descent. The exceptional set in Terras's theorem. -/
def NeverDrops (n : Nat) : Prop :=
  ∀ k : Nat, 0 < k → n ≤ iter k n

/-- The census: every `n ≤ X` with `P n` sits in a list of length `o(X)`. -/
def DensityZero (P : Nat → Prop) : Prop :=
  ∀ c : Nat, 0 < c →
    ∃ N : Nat, ∀ X : Nat, N ≤ X →
      ∃ bad : List Nat,
        (∀ n, n ≤ X → P n → n ∈ bad) ∧ bad.length * c ≤ X + 1

/-- Terras–Everett density. Statement only. The proof is not in this file. -/
def TerrasDensity : Prop :=
  DensityZero NeverDrops

theorem terrasDensity_statement :
    TerrasDensity = DensityZero NeverDrops := rfl

/-- A first descent is not arrival at 1. This implication is not asserted. -/
def descent_is_not_arrival : Prop :=
  TerrasDensity → ∀ n : Nat, 0 < n → ∃ k : Nat, iter k n = 1

end CollatzTeaming
