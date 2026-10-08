/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache-2.0 license as described in the file LICENSE.
Author: Benjamin Stanley Frohman

Kernel certificates for the two data-backed scenes: five forward orbits,
and the reverse-tree parent rule on the amber edge 5 → 16 → 8 → 4 → 2 → 1.

`decide` builds a proof the kernel checks. None of these theorems is an
inhabitant of `RemainingLemma` or `CollatzConjecture`. Those stay open.
-/

import CollatzTeaming.Basic
import CollatzTeaming.ReverseTree

namespace CollatzTeaming

/-- Maximum value on the next `k` steps, including the start. -/
def orbitMax : Nat → Nat → Nat
  | 0, n => n
  | k + 1, n => max n (orbitMax k (T n))

/-- Number of odd inputs among the next `k` steps. -/
def oddSteps : Nat → Nat → Nat
  | 0, _ => 0
  | k + 1, n => (if n % 2 = 1 then 1 else 0) + oddSteps k (T n)

theorem orbit_7 :
    iter 16 7 = 1 ∧ iter 5 7 = 52 ∧ orbitMax 16 7 = 52 ∧ oddSteps 16 7 = 5 := by
  decide

theorem orbit_15 :
    iter 17 15 = 1 ∧ iter 7 15 = 160 ∧ orbitMax 17 15 = 160 ∧ oddSteps 17 15 = 5 := by
  decide

theorem orbit_27 :
    iter 111 27 = 1 ∧ iter 77 27 = 9232 ∧ orbitMax 111 27 = 9232 ∧ oddSteps 111 27 = 41 := by
  decide

theorem orbit_97 :
    iter 118 97 = 1 ∧ iter 84 97 = 9232 ∧ orbitMax 118 97 = 9232 ∧ oddSteps 118 97 = 43 := by
  decide

theorem orbit_255 :
    iter 47 255 = 1 ∧ iter 15 255 = 13120 ∧ orbitMax 47 255 = 13120 ∧ oddSteps 47 255 = 15 := by
  decide

theorem orbit_703 :
    iter 170 703 = 1 ∧ iter 82 703 = 250504 ∧ orbitMax 170 703 = 250504 ∧
      oddSteps 170 703 = 62 := by
  decide

theorem orbit_871 :
    iter 178 871 = 1 ∧ iter 31 871 = 190996 ∧ orbitMax 178 871 = 190996 ∧
      oddSteps 178 871 = 65 := by
  decide

theorem orbit_6171 :
    iter 261 6171 = 1 ∧ iter 78 6171 = 975400 ∧ orbitMax 261 6171 = 975400 ∧
      oddSteps 261 6171 = 96 := by
  decide

theorem head_7 :
    T 7 = 22 ∧ T 22 = 11 ∧ T 11 = 34 ∧ T 34 = 17 ∧ T 17 = 52 := by
  decide

/-- Accelerated odd step. Not a bijection. -/
def syracuse (n : Nat) : Nat :=
  let rec halve : Nat → Nat → Nat
    | 0, x => x
    | f + 1, x => if x % 2 = 0 then halve f (x / 2) else x
  halve (n + 1) (3 * n + 1)

theorem syracuse_one : syracuse 1 = 1 := by decide

theorem syracuse_five : syracuse 5 = 1 := by decide

theorem syracuse_not_injective : syracuse 1 = syracuse 5 ∧ 1 ≠ 5 := by decide

/-- The first odd inverse edge off the pure doubling chain. -/
theorem amber_edge : T 5 = 16 ∧ T 16 = 8 ∧ T 8 = 4 ∧ T 4 = 2 ∧ T 2 = 1 := by
  decide

theorem five_is_odd_parent_of_sixteen : oddPred 16 = 5 ∧ C 5 = 16 := by
  decide

theorem sixteen_mod_six : (16 : Nat) % 6 = 4 := by decide

theorem odd_parent_sixteen : OddPredecessor 16 :=
  oddPredecessor_of_mod_six 16 sixteen_mod_six (by decide)

/-- Pure powers of two fall by halving. This is one orbit, not the conjecture. -/
theorem two_pow_71_reaches_one : iter 71 (2 ^ 71) = 1 :=
  iterate_halve 71 1

end CollatzTeaming
