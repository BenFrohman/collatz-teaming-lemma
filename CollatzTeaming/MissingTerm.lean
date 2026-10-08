/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/

import CollatzTeaming.Remaining

/-!
# The missing term

The statement is in Lean. The missing term is a pair `⟨k, hk⟩` for an
arbitrary positive `n`, with `iter k n = 1`. This file records that type.
It does not construct the pair, and it does not inhabit `RemainingLemma`.
-/

namespace CollatzTeaming

/-- The type of the missing proof. Not inhabited here. -/
abbrev MissingTerm : Prop :=
  RemainingLemma

theorem missing_term_type : MissingTerm = RemainingLemma := rfl

/-- Shape of the hole, for one `n`. The pair is not supplied. -/
def witnessShape (n : Nat) : Prop :=
  0 < n → ∃ k : Nat, iter k n = 1

theorem witness_shape_of_remaining (h : RemainingLemma) (n : Nat) :
    witnessShape n :=
  h n

end CollatzTeaming
