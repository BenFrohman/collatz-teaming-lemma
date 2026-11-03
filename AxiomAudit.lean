-- Axiom audit: prints the axioms of every theorem/lemma in the project.
-- CI fails unless each depends only on propext, Classical.choice, Quot.sound (or none).
import CollatzTeaming
import CollatzTeaming.Axiom
import CollatzTeaming.Basic
import CollatzTeaming.BlockMap
import CollatzTeaming.ForwardOrbit
import CollatzTeaming.Inclusion
import CollatzTeaming.Kernel
import CollatzTeaming.M92
import CollatzTeaming.Remaining
import CollatzTeaming.Replacement
import CollatzTeaming.ReverseTree
import CollatzTeaming.Rhin
import CollatzTeaming.Steiner
import CollatzTeaming.Terras
import CollatzTeaming.TerrasCount
import CollatzTeaming.TerrasTail
import CollatzTeaming.Types
import CollatzTeaming.FirstDescent
import CollatzTeaming.MissingTerm
import CollatzTeaming.ZeroPath

#print axioms CollatzTeaming.remaining_lemma_from_assumption
#print axioms CollatzTeaming.T_even
#print axioms CollatzTeaming.T_four
#print axioms CollatzTeaming.T_odd
#print axioms CollatzTeaming.T_one
#print axioms CollatzTeaming.T_two
#print axioms CollatzTeaming.even_double
#print axioms CollatzTeaming.iter_succ
#print axioms CollatzTeaming.iter_succ'
#print axioms CollatzTeaming.iter_zero
#print axioms CollatzTeaming.iterate_halve
#print axioms CollatzTeaming.team_maps_to_odd
#print axioms CollatzTeaming.trivial_cycle
#print axioms CollatzTeaming.two_mul_even
#print axioms CollatzTeaming.block_n3_k2
#print axioms CollatzTeaming.frohman_block_n3_k2
#print axioms CollatzTeaming.frohman_odd_mod4
#print axioms CollatzTeaming.frohman_trivial_block
#print axioms CollatzTeaming.odd_mod4
#print axioms CollatzTeaming.trivial_block
#print axioms CollatzTeaming.forward_even_branch
#print axioms CollatzTeaming.forward_odd_pred
#print axioms CollatzTeaming.forward_one_double
#print axioms CollatzTeaming.one_reaches_one
#print axioms CollatzTeaming.reaches_one_iff_in_reverse_tree
#print axioms CollatzTeaming.remaining_forward_iff_reverse
#print axioms CollatzTeaming.remaining_lemma_forward
#print axioms CollatzTeaming.inclusion_not_binomial_tail
#print axioms CollatzTeaming.terras_inclusion
#print axioms CollatzTeaming.amber_edge
#print axioms CollatzTeaming.doubling_parent
#print axioms CollatzTeaming.first_odd_parent
#print axioms CollatzTeaming.odd_inverse_parent
#print axioms CollatzTeaming.odd_parent_sixteen
#print axioms CollatzTeaming.orbit27_kernel
#print axioms CollatzTeaming.orbit27_length
#print axioms CollatzTeaming.orbit27_peak_index
#print axioms CollatzTeaming.orbit_15
#print axioms CollatzTeaming.orbit_27
#print axioms CollatzTeaming.orbit_7
#print axioms CollatzTeaming.orbit_871
#print axioms CollatzTeaming.orbit_97
#print axioms CollatzTeaming.parentsOf_spec
#print axioms CollatzTeaming.syracuse_five
#print axioms CollatzTeaming.syracuse_not_injective
#print axioms CollatzTeaming.syracuse_one
#print axioms CollatzTeaming.two_pow_71_reaches_one
#print axioms CollatzTeaming.two_pow_71_value
#print axioms CollatzTeaming.C0_closes_one
#print axioms CollatzTeaming.reaches_one_of_trivial
#print axioms CollatzTeaming.remaining_lemma
#print axioms CollatzTeaming.remaining_lemma_iff_collatz
#print axioms CollatzTeaming.covering_claim_def
#print axioms CollatzTeaming.covering_from_assumption
#print axioms CollatzTeaming.C_double
#print axioms CollatzTeaming.C_odd_pred
#print axioms CollatzTeaming.div_add_mod_six
#print axioms CollatzTeaming.even_preimage
#print axioms CollatzTeaming.four_le_of_mod_six
#print axioms CollatzTeaming.mod_six_of_odd_step
#print axioms CollatzTeaming.oddPred_eq
#print axioms CollatzTeaming.oddPred_odd
#print axioms CollatzTeaming.oddPredecessor_of_mod_six
#print axioms CollatzTeaming.one_in_reverse_tree
#print axioms CollatzTeaming.remaining_lemma_reverse_tree
#print axioms CollatzTeaming.nat_mul_eq_one
#print axioms CollatzTeaming.steiner_L2
#print axioms CollatzTeaming.steiner_L_eq_two
#print axioms CollatzTeaming.steiner_factors
#print axioms CollatzTeaming.steiner_one_cycle
#print axioms CollatzTeaming.tail_le
#print axioms CollatzTeaming.tail_zero
#print axioms CollatzTeaming.two_pow_le_three_pow
#print axioms CollatzTeaming.all_words
#print axioms CollatzTeaming.badCount_zero_left
#print axioms CollatzTeaming.badCount_zero_right
#print axioms CollatzTeaming.block_tail
#print axioms CollatzTeaming.gen_bound
#print axioms CollatzTeaming.tail_ratio
#print axioms CollatzTeaming.three_five_lt_two_eight
#print axioms CollatzTeaming.two_le_three_pow
#print axioms CollatzTeaming.bern_243_256
#print axioms CollatzTeaming.cancel_bound
#print axioms CollatzTeaming.drop_of_affine
#print axioms CollatzTeaming.neverDrops_not_in_tree
#print axioms CollatzTeaming.not_neverDrops_iff
#print axioms CollatzTeaming.ratio_unbounded
#print axioms CollatzTeaming.residue_count_for_terras
#print axioms CollatzTeaming.stopping_weaker_than_tree
#print axioms CollatzTeaming.Block.kpos
#print axioms CollatzTeaming.Block.odd
#print axioms CollatzTeaming.blockCount_eq

-- Modules added to the root import (certification extension)
#print axioms CollatzTeaming.descent_27
#print axioms CollatzTeaming.descent_703
#print axioms CollatzTeaming.four_reaches_trivial_at_zero
#print axioms CollatzTeaming.missing_term_type
#print axioms CollatzTeaming.one_reaches_trivial_at_zero
#print axioms CollatzTeaming.one_zero_path
#print axioms CollatzTeaming.reaches_trivial_at_zero
#print axioms CollatzTeaming.two_reaches_trivial_at_zero
#print axioms CollatzTeaming.witness_shape_of_remaining
#print axioms CollatzTeaming.zero_fixed
#print axioms CollatzTeaming.zero_orbit
#print axioms CollatzTeaming.zero_path
#print axioms CollatzTeaming.zero_path_four
#print axioms CollatzTeaming.zero_path_one
#print axioms CollatzTeaming.zero_path_two
