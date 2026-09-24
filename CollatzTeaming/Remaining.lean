/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

The remaining lemma is definitionally the Collatz conjecture.
It is not proved. There is no `sorry` inhabitant.
-/

import CollatzTeaming.Basic

namespace CollatzTeaming

/-- Every positive integer eventually maps into `{1,4,2}`.
    This is the remaining lemma on the 3n+1 Machine. -/
def RemainingLemma : Prop := CollatzConjecture

theorem remaining_lemma_iff_collatz : RemainingLemma ↔ CollatzConjecture := by
  rfl

/-- Status lock: do not close this with an axiom or a `sorry`. -/
def remainingLemmaStatus : String := "open"

end CollatzTeaming
