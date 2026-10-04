/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Replacement for treating density zero, or the local inverse rules, as an
inhabitant of the covering claim. No proof of that claim is supplied.
-/

import CollatzTeaming.ReverseTree
import CollatzTeaming.Axiom

namespace CollatzTeaming

/-- The covering claim, written as the user stated it. -/
theorem covering_claim_def :
    RemainingLemma = (∀ n : Nat, 0 < n → InReverseTree n) := rfl

/-- First descent never occurs. Weaker than failing to reach 1. -/
def NeverDrops (n : Nat) : Prop :=
  ∀ k : Nat, 0 < k → n ≤ iter k n

/-- Asymptotic density zero, stated without Mathlib. -/
def DensityZero (P : Nat → Prop) : Prop :=
  ∀ ε : Rat, 0 < ε →
    ∃ N : Nat, ∀ X : Nat, N ≤ X →
      ((List.range (X + 1)).countP P : Rat) / (X + 1) < ε

/-- What Terras–Everett actually is. Not an inhabitant of `RemainingLemma`. -/
def TerrasDensity : Prop :=
  DensityZero NeverDrops

/-- The local rules do not have the covering type. -/
theorem local_rules_are_not_the_covering_claim :
    (∀ m, InReverseTree m → InReverseTree (2 * m)) ≠ RemainingLemma := by
  sorry

/-- Density zero of the non-descending set is not the covering claim.
    This implication is not asserted. The two propositions are recorded apart. -/
def density_does_not_supply_covering : Prop :=
  TerrasDensity ≠ RemainingLemma

/-- Usable form of the open claim: an assumption, not a proof term. -/
theorem covering_from_assumption :
    ∀ n : Nat, 0 < n → InReverseTree n :=
  remaining_lemma_assumption

end CollatzTeaming
