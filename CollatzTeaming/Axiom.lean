/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

Named assumption for the covering claim. This is not a proof and not a certificate.
Discharge later by deleting this axiom and supplying a theorem of the same type
whose `#print axioms` output does not mention this name or `sorryAx`.
-/

import CollatzTeaming.ReverseTree

namespace CollatzTeaming

/-- Open assumption: every positive integer lies in the reverse tree of 1.
    Equivalent to the Collatz conjecture. Not derived from the local inverse rules. -/
axiom remaining_lemma_assumption : RemainingLemma

theorem remaining_lemma_from_assumption : RemainingLemma :=
  remaining_lemma_assumption

end CollatzTeaming
