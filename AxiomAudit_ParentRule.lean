/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

-- Standalone axiom audit for CollatzTeaming.ParentRule.
-- Built separately: its declarations share names with modules in the main root, so it cannot be imported alongside it.
import CollatzTeaming.ParentRule

/-!
# AxiomAudit_ParentRule

Machine-checked Lean 4 module.
-/

#print axioms CollatzTeaming.doubling_parent
#print axioms CollatzTeaming.iterate_halve_parent
#print axioms CollatzTeaming.odd_inverse_parent
#print axioms CollatzTeaming.parentsOf_spec
