/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Forward formulation. Equivalent to reverse-tree coverage. Not proved.
-/

import CollatzTeaming.ReverseTree

namespace CollatzTeaming

def forward (n k : Nat) : Nat :=
  iter k n

def ReachesOne (n : Nat) : Prop :=
  ∃ k : Nat, forward n k = 1

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

theorem forward_one_double (m : Nat) : forward (2 * m) 1 = m := by
  simp [forward, even_double m]

theorem forward_even_branch (m : Nat) (h : ReachesOne m) : ReachesOne (2 * m) := by
  rcases h with ⟨k, hk⟩
  refine ⟨k + 1, ?_⟩
  rw [forward, iter_succ', even_double]
  exact hk

theorem forward_odd_pred (m : Nat) (h : m % 6 = 4) :
    forward (oddPred m) 1 = m := by
  simp [forward, C_odd_pred m h]

theorem remaining_lemma_forward : RemainingLemmaForward := by
  sorry

end CollatzTeaming
