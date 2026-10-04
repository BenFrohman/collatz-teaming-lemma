/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Remaining lemma: every positive integer lies in the reverse tree of 1.
The even inverse branch is proved. The covering claim is not.
-/

namespace CollatzTeaming

/-- Ordinary Collatz map. -/
def C (n : Nat) : Nat :=
  if n % 2 = 0 then n / 2 else 3 * n + 1

/-- `n` lies in the reverse tree of 1 iff some forward iterate equals 1. -/
def InReverseTree (n : Nat) : Prop :=
  ∃ k : Nat, (C^[k]) n = 1

/-- The remaining lemma. Equivalent to the Collatz conjecture. -/
def RemainingLemma : Prop :=
  ∀ n : Nat, 0 < n → InReverseTree n

theorem one_in_reverse_tree : InReverseTree 1 :=
  ⟨0, rfl⟩

theorem C_double (m : Nat) : C (2 * m) = m := by
  have h : (2 * m) % 2 = 0 := by
    simpa using Nat.mul_mod_right 2 m
  simp [C, h, Nat.mul_div_cancel_left]

/-- From any node `m` the branch `2m, 4m, 8m, …` stays in the tree of `m`. -/
theorem even_preimage (m : Nat) (h : InReverseTree m) : InReverseTree (2 * m) := by
  rcases h with ⟨k, hk⟩
  refine ⟨k + 1, ?_⟩
  rw [Function.iterate_succ_apply, C_double, hk]

/-- Odd-predecessor side condition: `(m - 1) / 3` is an integer odd predecessor
    only when `m ≡ 4 (mod 6)`. This local rule does not force coverage. -/
def OddPredecessor (m : Nat) : Prop :=
  m % 6 = 4 ∧ 0 < (m - 1) / 3 ∧ ((m - 1) / 3) % 2 = 1 ∧ C ((m - 1) / 3) = m

/-- Covering claim. Density zero of a complement does not discharge this. -/
theorem remaining_lemma_reverse_tree : RemainingLemma := by
  sorry

end CollatzTeaming
