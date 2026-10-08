/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/

import CollatzTeaming.Basic
import CollatzTeaming.ReverseTree

/-!
# The length-0 path

`iter 0 n = n`. If `n` is already `1`, `2`, or `4`, the trivial-cycle
predicate holds at step 0. This is not the covering claim.
-/

namespace CollatzTeaming

/-- The path of length 0 is the point itself. -/
theorem zero_path (n : Nat) : iter 0 n = n :=
  iter_zero n

theorem zero_path_one : iter 0 1 = 1 :=
  zero_path 1

theorem zero_path_two : iter 0 2 = 2 :=
  zero_path 2

theorem zero_path_four : iter 0 4 = 4 :=
  zero_path 4

theorem reaches_trivial_at_zero {n : Nat} (h : InTrivialCycle n) :
    ReachesTrivialCycle n :=
  ⟨0, by simpa [iter_zero] using h⟩

theorem one_reaches_trivial_at_zero : ReachesTrivialCycle 1 :=
  reaches_trivial_at_zero (Or.inl rfl)

theorem two_reaches_trivial_at_zero : ReachesTrivialCycle 2 :=
  reaches_trivial_at_zero (Or.inr (Or.inl rfl))

theorem four_reaches_trivial_at_zero : ReachesTrivialCycle 4 :=
  reaches_trivial_at_zero (Or.inr (Or.inr rfl))

/-- `1` is in the reverse tree by the empty path. -/
theorem one_zero_path : InReverseTree 1 :=
  ⟨0, zero_path_one⟩

/-- The fixed point at `0`. Even, so `T 0 = 0 / 2`. Not a positive orbit. -/
theorem zero_fixed : T 0 = 0 := by
  decide

theorem zero_orbit (k : Nat) : iter k 0 = 0 := by
  induction k with
  | zero => exact zero_path 0
  | succ k ih => rw [iter_succ, ih, zero_fixed]

end CollatzTeaming
