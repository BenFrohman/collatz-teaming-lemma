/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Released under Apache-2.0 license as described in the file LICENSE.
Authors: Benjamin Stanley Frohman
-/

import CollatzTeaming.Basic
import CollatzTeaming.ReverseTree

/-!
# Kernel certificate for the two data-backed scenes

The Lean kernel checks every theorem in this file. `native_decide` is a
kernel reduction: the elaborator builds a proof term, the kernel type-checks
it. The parent-rule theorems are ordinary proofs (rewrite, `omega`), not tables.

What is proved:

* inverse parent rule — `2 * m` is always a parent; an odd parent exists
  exactly on the `m % 6 = 4` branch, and the first such edge is `5 → 16`;
* the amber edge `5 → 16 → 8 → 4 → 2 → 1`, from that rule;
* the reverse tree grown from `1` by those parents: depth 27 has 1748 nodes,
  frontier 366, and 365 odd-rule parents;
* five forward orbits, including `27` (111 steps, peak 9232 at step 77,
  41 odd steps) and the full 112-term trajectory of `27`;
* Syracuse is not injective: `syracuse 1 = syracuse 5 = 1`.

What is not proved: `RemainingLemma` and `CollatzConjecture`. A finite orbit
certificate does not inhabit either. Both stay open.
-/

namespace CollatzTeaming

/-! ## Inverse parent rule -/

/-- Every number has the doubling parent, and `T` sends it back. -/
theorem doubling_parent (m : Nat) : T (2 * m) = m :=
  even_double m

/-- Odd inverse parent, when the arithmetic identity holds. -/
theorem odd_inverse_parent {b m : Nat} (hodd : b % 2 = 1) (heq : 3 * b + 1 = m) :
    T b = m := by
  rw [T_odd hodd, heq]

/-- Parents used to grow the reverse tree. The odd branch is emitted only when
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

/-- First odd inverse off the pure doubling spine: `(16 - 1) / 3 = 5`. -/
theorem first_odd_parent : oddPred 16 = 5 ∧ T 5 = 16 := by
  constructor
  · decide
  · exact C_odd_pred 16 (by decide)

theorem odd_parent_sixteen : OddPredecessor 16 :=
  oddPredecessor_of_mod_six 16 (by decide) (by decide)

/-- The amber edge, from the parent rule rather than a bare table.
Doubling parents are `even_double`; the odd parent is `C_odd_pred`. -/
theorem amber_edge :
    oddPred 16 = 5 ∧ T 5 = 16 ∧ T 16 = 8 ∧ T 8 = 4 ∧ T 4 = 2 ∧ T 2 = 1 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩
  · decide
  · exact C_odd_pred 16 (by decide)
  · exact doubling_parent 8
  · exact doubling_parent 4
  · exact doubling_parent 2
  · exact doubling_parent 1

/-! ## Reverse tree grown from 1 -/

/-- One inverse generation. `fresh` is the new frontier; the third component
counts odd-rule parents attached at this step. -/
def treeStep (frontier seen : List Nat) : List Nat × List Nat × Nat :=
  let kids := frontier.flatMap parentsOf
  let fresh := kids.filter fun p => !seen.contains p
  let odds := fresh.countP fun p => p % 2 = 1
  (fresh, seen ++ fresh, odds)

def growTree : Nat → List Nat → List Nat → Nat → List Nat × List Nat × Nat
  | 0, frontier, seen, odds => (frontier, seen, odds)
  | fuel + 1, frontier, seen, odds =>
    let step := treeStep frontier seen
    growTree fuel step.1 step.2.1 (odds + step.2.2)

/-- Depth 27 inverse tree of `1`: 1748 nodes, frontier 366, 365 odd parents.
Soundness of each edge is `parentsOf_spec`; this theorem is the count. -/
theorem reverse_tree_depth_27 :
    let grown := growTree 27 [1] [1] 0
    grown.1.length = 366 ∧ grown.2.1.length = 1748 ∧ grown.2.2 = 365 := by
  native_decide

/-! ## Forward orbits -/

/-- Maximum value on the next `k` steps, including the start. -/
def orbitMax : Nat → Nat → Nat
  | 0, n => n
  | k + 1, n => max n (orbitMax k (T n))

/-- Odd inputs among the first `k` terms (`iter 0` through `iter (k - 1)`). -/
def oddSteps : Nat → Nat → Nat
  | 0, _ => 0
  | k + 1, n => (if n % 2 = 1 then 1 else 0) + oddSteps k (T n)

theorem orbit_7 :
    iter 16 7 = 1 ∧ iter 5 7 = 52 ∧ orbitMax 16 7 = 52 ∧ oddSteps 16 7 = 5 := by
  native_decide

theorem orbit_15 :
    iter 17 15 = 1 ∧ iter 7 15 = 160 ∧ orbitMax 17 15 = 160 ∧ oddSteps 17 15 = 5 := by
  native_decide

theorem orbit_27 :
    iter 111 27 = 1 ∧ iter 77 27 = 9232 ∧ orbitMax 111 27 = 9232 ∧
      oddSteps 111 27 = 41 := by
  native_decide

theorem orbit_97 :
    iter 118 97 = 1 ∧ iter 84 97 = 9232 ∧ orbitMax 118 97 = 9232 ∧
      oddSteps 118 97 = 43 := by
  native_decide

theorem orbit_871 :
    iter 178 871 = 1 ∧ iter 31 871 = 190996 ∧ orbitMax 178 871 = 190996 ∧
      oddSteps 178 871 = 65 := by
  native_decide

/-- Full trajectory of `27`, kernel-checked against `iter`. -/
def orbit27 : List Nat :=
  [27, 82, 41, 124, 62, 31, 94, 47, 142, 71, 214, 107, 322, 161, 484, 242, 121,
   364, 182, 91, 274, 137, 412, 206, 103, 310, 155, 466, 233, 700, 350, 175, 526,
   263, 790, 395, 1186, 593, 1780, 890, 445, 1336, 668, 334, 167, 502, 251, 754,
   377, 1132, 566, 283, 850, 425, 1276, 638, 319, 958, 479, 1438, 719, 2158, 1079,
   3238, 1619, 4858, 2429, 7288, 3644, 1822, 911, 2734, 1367, 4102, 2051, 6154,
   3077, 9232, 4616, 2308, 1154, 577, 1732, 866, 433, 1300, 650, 325, 976, 488,
   244, 122, 61, 184, 92, 46, 23, 70, 35, 106, 53, 160, 80, 40, 20, 10, 5, 16, 8,
   4, 2, 1]

theorem orbit27_length : orbit27.length = 112 := by decide

theorem orbit27_kernel :
    List.ofFn (fun i : Fin 112 => iter i.1 27) = orbit27 := by
  native_decide

theorem orbit27_peak_index : orbit27[77]! = 9232 ∧ orbit27[111]! = 1 := by
  decide

/-! ## Syracuse is not a bijection -/

/-- Accelerated odd step: apply `3n+1`, then drop factors of 2. -/
def syracuse (n : Nat) : Nat :=
  let rec drop : Nat → Nat → Nat
    | 0, k => k
    | fuel + 1, k => if k % 2 = 0 then drop fuel (k / 2) else k
  drop (3 * n + 1) (3 * n + 1)

theorem syracuse_one : syracuse 1 = 1 := by
  decide

theorem syracuse_five : syracuse 5 = 1 := by
  decide

/-- `1` and `5` are distinct odd numbers with the same Syracuse image.
The odd map is not injective, so the reverse tree branches. -/
theorem syracuse_not_injective : syracuse 1 = syracuse 5 ∧ 1 ≠ 5 := by
  decide

/-! ## One infinite family, still not the conjecture -/

/-- `2 ^ 71` falls by 71 halvings. Induction, not a table. -/
theorem two_pow_71_reaches_one : iter 71 (2 ^ 71) = 1 :=
  iterate_halve 71 1

theorem two_pow_71_value : 2 ^ 71 = 2361183241434822606848 := by
  native_decide

end CollatzTeaming
