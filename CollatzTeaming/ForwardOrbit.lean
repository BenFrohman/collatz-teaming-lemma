/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Forward formulation of the remaining lemma: every positive integer
has a finite forward orbit that meets 1. Equivalent to reverse-tree
coverage. Not proved.
-/

import CollatzTeaming.ReverseTree

namespace CollatzTeaming

/-- The forward orbit of `n`: the sequence `n, C n, C² n, …`. -/
def forward (n k : Nat) : Nat :=
  (C^[k]) n

/-- `n` reaches 1 in the forward direction. -/
def ReachesOne (n : Nat) : Prop :=
  ∃ k : Nat, forward n k = 1

/-- Same covering claim, written without reversing arrows. -/
def RemainingLemmaForward : Prop :=
  ∀ n : Nat, 0 < n → ReachesOne n

theorem reaches_one_iff_in_reverse_tree (n : Nat) :
    ReachesOne n ↔ InReverseTree n := by
  rfl

theorem remaining_forward_iff_reverse :
    RemainingLemmaForward ↔ RemainingLemma := by
  rfl

theorem one_reaches_one : ReachesOne 1 :=
  ⟨0, rfl⟩

/-- One forward step from the even branch: `C (2m) = m`. -/
theorem forward_one_double (m : Nat) : forward (2 * m) 1 = m := by
  simpa [forward] using C_double m

/-- If `m` reaches 1, so does `2m`, by one extra forward step. -/
theorem forward_even_branch (m : Nat) (h : ReachesOne m) : ReachesOne (2 * m) := by
  rcases h with ⟨k, hk⟩
  refine ⟨k + 1, ?_⟩
  simpa [forward, Function.iterate_succ_apply, C_double] using hk

/-- The forward covering claim. Open, and identical to the reverse-tree claim. -/
theorem remaining_lemma_forward : RemainingLemmaForward := by
  sorry

end CollatzTeaming
