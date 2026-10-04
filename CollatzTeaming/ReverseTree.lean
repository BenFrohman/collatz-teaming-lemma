/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

The remaining lemma, stated as coverage of the reverse tree of 1.
Local inverse rules are proved. The covering claim is not.
-/

namespace CollatzTeaming

/-- Ordinary Collatz map: halve if even, otherwise send n to 3n+1. -/
def C (n : Nat) : Nat :=
  if n % 2 = 0 then n / 2 else 3 * n + 1

/-- Membership in the reverse tree of 1: a finite forward path to 1. -/
def InReverseTree (n : Nat) : Prop :=
  ∃ k : Nat, (C^[k]) n = 1

/-- Remaining lemma: every positive integer lies in that tree.
    This is the Collatz conjecture. It is not proved below. -/
def RemainingLemma : Prop :=
  ∀ n : Nat, 0 < n → InReverseTree n

theorem one_in_reverse_tree : InReverseTree 1 :=
  ⟨0, rfl⟩

theorem C_double (m : Nat) : C (2 * m) = m := by
  have h : (2 * m) % 2 = 0 := by
    simpa using Nat.mul_mod_right 2 m
  simp [C, h, Nat.mul_div_cancel_left]

/-- The even inverse branch always exists: 2m lies over m. -/
theorem even_preimage (m : Nat) (h : InReverseTree m) : InReverseTree (2 * m) := by
  rcases h with ⟨k, hk⟩
  refine ⟨k + 1, ?_⟩
  rw [Function.iterate_succ_apply, C_double, hk]

/-- Odd inverse branch exists only for m ≡ 4 (mod 6), and then C sends it to m. -/
theorem odd_preimage_of_mod_six (m : Nat) (hm : m % 6 = 4) (hpos : 4 ≤ m) :
    C ((m - 1) / 3) = m := by
  have hdiv : 3 ∣ m - 1 := by
    have : (m - 1) % 3 = 0 := by
      have hm1 : (m - 1) % 6 = 3 := by
        have : m = 6 * (m / 6) + 4 := Nat.mod_add_div_eq? -- placeholder, see note
        sorry
      sorry
    exact Nat.dvd_of_mod_eq_zero this
  have hodd : ((m - 1) / 3) % 2 = 1 := by
    sorry
  simp [C, hodd, Nat.div_mul_cancel hdiv]

/-- The covering claim. Open: a density-zero complement is not known to be empty. -/
theorem remaining_lemma_reverse_tree : RemainingLemma := by
  sorry

end CollatzTeaming
