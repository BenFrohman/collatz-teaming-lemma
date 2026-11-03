-- Standalone axiom audit for CollatzTeaming.ParentRule.
-- Built separately: its declarations share names with modules in the main root, so it cannot be imported alongside it.
import CollatzTeaming.ParentRule

#print axioms CollatzTeaming.doubling_parent
#print axioms CollatzTeaming.iterate_halve_parent
#print axioms CollatzTeaming.odd_inverse_parent
#print axioms CollatzTeaming.parentsOf_spec
