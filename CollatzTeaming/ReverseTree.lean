/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Reverse tree of 1. Local inverse branches are proved.
The covering claim is the remaining lemma and is not proved.
-/

import CollatzTeaming.Basic

namespace CollatzTeaming

abbrev C : Nat → Nat := T

def InReverseTree (n : Nat) : Prop :=
  ∃ k : Nat, iter k n = 1

def RemainingLemma : Prop :=
  ∀ n : Nat, 0 < n → InReverseTree n

theorem one_in_reverse_tree : InReverseTree 1 :=
  ⟨0, rfl⟩

theorem C_double (m : Nat) : C (2 * m) = m :=
  even_double m

theorem even_preimage (m : Nat) (h : InReverseTree m) : InReverseTree (2 * m) := by
  rcases h with ⟨k, hk⟩
  refine ⟨k + 1, ?_⟩
  rw [iter_succ', even_double, hk]

def oddPred (m : Nat) : Nat :=
  (m - 1) / 3

theorem div_add_mod_six (m : Nat) (h : m % 6 = 4) :
    m = 6 * (m / 6) + 4 := by
  have hd := Nat.div_add_mod m 6
  rw [h] at hd
  exact hd.symm

theorem four_le_of_mod_six (m : Nat) (h : m % 6 = 4) : 4 ≤ m := by
  have := div_add_mod_six m h
  omega

theorem oddPred_eq (m : Nat) (h : m % 6 = 4) :
    oddPred m = 2 * (m / 6) + 1 := by
  have hm := div_add_mod_six m h
  unfold oddPred
  omega

theorem oddPred_odd (m : Nat) (h : m % 6 = 4) : oddPred m % 2 = 1 := by
  have := oddPred_eq m h
  omega

theorem C_odd_pred (m : Nat) (h : m % 6 = 4) : C (oddPred m) = m := by
  have hodd := oddPred_odd m h
  have heq := oddPred_eq m h
  have hm := div_add_mod_six m h
  unfold C
  rw [T_odd hodd]
  omega

def OddPredecessor (m : Nat) : Prop :=
  m % 6 = 4 ∧ 0 < oddPred m ∧ oddPred m % 2 = 1 ∧ C (oddPred m) = m

set_option linter.unusedVariables false in
theorem oddPredecessor_of_mod_six (m : Nat) (h : m % 6 = 4) (hpos : 0 < m / 6) :
    OddPredecessor m := by
  refine ⟨h, ?_, oddPred_odd m h, C_odd_pred m h⟩
  have hq := oddPred_eq m h
  omega

theorem mod_six_of_odd_step (n : Nat) (h : n % 2 = 1) :
    (3 * n + 1) % 6 = 4 := by
  have hn : n = 2 * (n / 2) + 1 := by
    have hd := Nat.div_add_mod n 2
    rw [h] at hd
    exact hd.symm
  omega

theorem remaining_lemma_reverse_tree : RemainingLemma := by
  sorry

end CollatzTeaming
