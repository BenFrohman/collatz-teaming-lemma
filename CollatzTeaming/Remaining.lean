/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

The remaining lemma of The 3n+1 Machine is isolated here.
It is definitionally the Collatz conjecture. It is not proved.
-/

import CollatzTeaming.Basic

namespace CollatzTeaming

/-- Every positive integer eventually maps into `{1,4,2}`.
    This is the remaining lemma on the 3n+1 Machine. -/
def RemainingLemma : Prop := CollatzConjecture

theorem remaining_lemma_iff_collatz : RemainingLemma ↔ CollatzConjecture := by
  rfl

/-- Kernel of the open problem. Do not close this with an axiom. -/
theorem remaining_lemma : RemainingLemma := by
  sorry

end CollatzTeaming
