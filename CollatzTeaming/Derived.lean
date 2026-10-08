/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Kernel certificates for the two data-backed scenes: the inverse parent rule,
and five forward orbits. Each closed theorem is checked by the Lean kernel
(`decide` reduces in the kernel; `iterate_halve` is an induction).

This file does not prove `CollatzConjecture`. `remaining_lemma` stays open.
-/

import CollatzTeaming.Basic

namespace CollatzTeaming

/-- Odd inverse parent: if `b` is odd and `3 * b + 1 = m`, then `T b = m`. -/
theorem odd_inverse_parent {b m : Nat} (hodd : b % 2 = 1) (heq : 3 * b + 1 = m) :
    T b = m := by
  rw [T_odd hodd, heq]

/-- First odd inverse off the pure doubling spine: `(16 - 1) / 3 = 5`. -/
theorem first_odd_parent : T 5 = 16 := by
  decide

theorem first_odd_parent_rule : T 5 = 16 :=
  odd_inverse_parent (b := 5) (m := 16) (by decide) (by decide)

/-- Doubling parent, already the general fact: `T (2 * m) = m`. -/
theorem even_parent (m : Nat) : T (2 * m) = m :=
  even_double m

/-- Accelerated odd step. Fuel is `3 * n + 1`, enough to clear every factor of 2. -/
def syracuse (n : Nat) : Nat :=
  let rec drop (k fuel : Nat) : Nat :=
    match fuel with
    | 0 => k
    | fuel + 1 => if k % 2 = 0 then drop (k / 2) fuel else k
  drop (3 * n + 1) (3 * n + 1)

theorem syracuse_one : syracuse 1 = 1 := by
  decide

theorem syracuse_five : syracuse 5 = 1 := by
  decide

/-- The odd map is not injective: `1` and `5` are distinct and both reach `1`. -/
theorem syracuse_not_injective : syracuse 1 = syracuse 5 ∧ 1 ≠ 5 := by
  decide

theorem orbit_7_peak : iter 5 7 = 52 := by
  decide

theorem orbit_7_reaches : iter 16 7 = 1 := by
  decide

theorem orbit_27_peak : iter 77 27 = 9232 := by
  decide

theorem orbit_27_reaches : iter 111 27 = 1 := by
  decide

theorem orbit_97_peak : iter 84 97 = 9232 := by
  decide

theorem orbit_97_reaches : iter 118 97 = 1 := by
  decide

theorem orbit_871_peak : iter 31 871 = 190996 := by
  decide

theorem orbit_871_reaches : iter 178 871 = 1 := by
  decide

theorem orbit_6171_peak : iter 78 6171 = 975400 := by
  decide

theorem orbit_6171_reaches : iter 261 6171 = 1 := by
  decide

/-- `2 ^ 71` falls by 71 halvings. Induction, not a table. -/
theorem orbit_two_pow_71 : iter 71 (2 ^ 71) = 1 :=
  iterate_halve 71 1

theorem two_pow_71_value : 2 ^ 71 = 2361183241434822606848 := by
  decide

/-- These certificates do not discharge the covering claim. -/
theorem derived_does_not_close_collatz :
    (iter 111 27 = 1) ≠ CollatzConjecture := by
  decide

end CollatzTeaming
