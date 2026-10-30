/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
/-
Replacement for treating density zero, or the local inverse rules, as an
inhabitant of the covering claim. No proof of that claim is supplied.
-/

import CollatzTeaming.ReverseTree
import CollatzTeaming.Axiom
import CollatzTeaming.Terras

namespace CollatzTeaming

/-- The covering claim, written as the user stated it. -/
theorem covering_claim_def :
    RemainingLemma = (∀ n : Nat, 0 < n → InReverseTree n) := rfl

/-- Terras–Everett density (Terras 1976, Everett 1977): the `n` that never drop below
    their start have density zero. Classical, not proved here (the inclusion of `NeverDrops`
    in the bad residue classes is not formalized). Not an inhabitant of `RemainingLemma`. -/
def TerrasDensity : Prop :=
  DensityZero NeverDrops

/-- Density zero of the non-descending set is not the covering claim.
    This implication is not asserted. The two propositions are recorded apart. -/
def density_does_not_supply_covering : Prop :=
  TerrasDensity ≠ RemainingLemma

/-- Usable form of the open claim, conditional on the hypothesis `RemainingLemma`. -/
theorem covering_from_assumption (h : RemainingLemma) :
    ∀ n : Nat, 0 < n → InReverseTree n :=
  h

end CollatzTeaming
