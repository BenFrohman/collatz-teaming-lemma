/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

The remaining lemma is definitionally the Collatz covering claim.
-/

import CollatzTeaming.Basic
import CollatzTeaming.ReverseTree

namespace CollatzTeaming

theorem reaches_one_of_trivial (n : Nat) (h : ReachesTrivialCycle n) :
    InReverseTree n := by
  rcases h with ⟨k, hk⟩
  rcases hk with h1 | h2 | h4
  · exact ⟨k, h1⟩
  · refine ⟨k + 1, ?_⟩
    rw [iter_succ, h2, T_two]
  · refine ⟨k + 2, ?_⟩
    rw [iter_succ, iter_succ, h4, T_four, T_two]

theorem remaining_lemma_iff_collatz : RemainingLemma ↔ CollatzConjecture := by
  constructor
  · intro h n hn
    rcases h n hn with ⟨k, hk⟩
    exact ⟨k, Or.inl hk⟩
  · intro h n hn
    exact reaches_one_of_trivial n (h n hn)

theorem remaining_lemma : RemainingLemma := by
  sorry

end CollatzTeaming
