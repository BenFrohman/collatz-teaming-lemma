/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/

import CollatzTeaming.Basic
import CollatzTeaming.ReverseTree

/-!
# Parent rule

The piece that could later move. Four facts, no covering claim.

* `doubling_parent`: every `m` has parent `2 * m`.
* `odd_inverse_parent`: an odd `b` with `3 * b + 1 = m` is a parent of `m`.
* `parentsOf_spec`: every parent emitted by `parentsOf` maps back under `T`.
* `iterate_halve`: `k` halvings undo `2 ^ k * m`.

This file does not inhabit `RemainingLemma` or `CollatzConjecture`.
-/

namespace CollatzTeaming

/-- Every number has the doubling parent, and `T` sends it back. -/
theorem doubling_parent (m : Nat) : T (2 * m) = m :=
  even_double m

/-- Odd inverse parent, when the arithmetic identity holds. -/
theorem odd_inverse_parent {b m : Nat} (hodd : b % 2 = 1) (heq : 3 * b + 1 = m) :
    T b = m := by
  rw [T_odd hodd, heq]

/-- Parents used by the reverse tree. The odd branch is emitted only when
`m % 6 = 4` and `(m - 1) / 3` is a positive odd integer. -/
def parentsOf (m : Nat) : List Nat :=
  if m % 6 = 4 ∧ (m - 1) / 3 % 2 = 1 ∧ 0 < (m - 1) / 3 then
    [2 * m, (m - 1) / 3]
  else
    [2 * m]

theorem parentsOf_spec {m p : Nat} (hmem : p ∈ parentsOf m) : T p = m := by
  unfold parentsOf at hmem
  split at hmem
  · simp only [List.mem_cons, List.not_mem_nil, or_false] at hmem
    rcases hmem with rfl | rfl
    · exact doubling_parent m
    · rename_i h
      simpa [oddPred] using C_odd_pred m h.1
  · simp only [List.mem_cons, List.not_mem_nil, or_false] at hmem
    subst hmem
    exact doubling_parent m

/-- `k` doublings fall by `k` halvings. Induction, not a table. -/
theorem iterate_halve_parent (k m : Nat) : iter k (2 ^ k * m) = m :=
  iterate_halve k m

end CollatzTeaming
