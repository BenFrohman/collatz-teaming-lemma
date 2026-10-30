/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/
/-
Named assumption for the covering claim. This is not a proof and not a certificate.
Discharge later by deleting this axiom and supplying a theorem of the same type
whose `#print axioms` output does not mention this name or `sorryAx`.
-/

import CollatzTeaming.ReverseTree

namespace CollatzTeaming

/-- The covering claim enters only as an explicit hypothesis `h : RemainingLemma`.
    It is equivalent to the Collatz conjecture and is not proved here. -/
theorem remaining_lemma_from_assumption (h : RemainingLemma) : RemainingLemma := h

end CollatzTeaming
