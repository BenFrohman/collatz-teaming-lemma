/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

-- Official kernel-certificate #print axioms for the inverse-team equivalence.
-- CI fails unless each depends only on propext, Classical.choice, Quot.sound (or none).
import CollatzTeaming.Remaining
import CollatzTeaming.ForwardOrbit
import CollatzTeaming.Replacement

/-!
# AxiomAudit_Equivalence

Machine-checked Lean 4 module.
-/

#print axioms CollatzTeaming.remaining_lemma_iff_collatz
#print axioms CollatzTeaming.reaches_one_of_trivial
#print axioms CollatzTeaming.remaining_forward_iff_reverse
#print axioms CollatzTeaming.covering_claim_def
