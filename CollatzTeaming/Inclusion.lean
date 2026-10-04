/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
License: Apache-2.0

The missing Terras inclusion, with its own type.
A non-dropping `n` on a good affine class lies under the exceptional bound.
This is not `binomial_tail` and not `RemainingLemma`.
-/

import CollatzTeaming.Terras

namespace CollatzTeaming

/-- `n` is under the exceptional threshold of a class with `m` odd steps. -/
def UnderException (k m a n : Nat) : Prop :=
  n * (2 ^ k - 3 ^ m) ≤ a

/-- Good contracting class: the odd-step count satisfies `3 ^ m < 2 ^ k`. -/
def GoodClass (k m : Nat) : Prop :=
  3 ^ m < 2 ^ k

/-- The inclusion. Not a count of words, and not arrival at 1. -/
def TerrasInclusion (n k m a : Nat) : Prop :=
  GoodClass k m →
    iter k n * 2 ^ k = 3 ^ m * n + a →
      NeverDrops n → UnderException k m a n

theorem terras_inclusion (n k m a : Nat) (hk : 0 < k) : TerrasInclusion n k m a := by
  intro hgood himg hnever
  by_contra hbad
  have hlt : a < (2 ^ k - 3 ^ m) * n := by
    simpa [UnderException] using hbad
  have hdrop : FiniteStoppingTime n :=
    drop_of_affine n k m a hk hgood himg hlt
  rcases hdrop with ⟨j, hj, hltn⟩
  exact Nat.not_le_of_gt hltn (hnever j hj)

theorem inclusion_not_binomial_tail
    (h : TerrasInclusion 1 1 0 0 = (badCount (2 ^ 1) 0 * 2 ^ 0 ≤ 3 ^ 1)) : False := by
  sorry

end CollatzTeaming
