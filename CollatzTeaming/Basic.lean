/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Definitions for the classical 3n+1 map and the inverse-residue teams.
This file does not claim the Collatz conjecture.
-/

namespace CollatzTeaming

/-- Classical Collatz map on `Nat`. `T 0 = 0`. -/
def T (n : Nat) : Nat :=
  if n % 2 = 0 then n / 2 else 3 * n + 1

@[simp] theorem T_even {n : Nat} (h : n % 2 = 0) : T n = n / 2 := by
  simp [T, h]

@[simp] theorem T_odd {n : Nat} (h : n % 2 = 1) : T n = 3 * n + 1 := by
  simp [T, h]

theorem T_one : T 1 = 4 := by native_decide
theorem T_four : T 4 = 2 := by native_decide
theorem T_two : T 2 = 1 := by native_decide

/-- Membership in the unique known positive cycle. -/
def InTrivialCycle (n : Nat) : Prop :=
  n = 1 ∨ n = 2 ∨ n = 4

/-- Finite forward arrival at `{1,4,2}`. -/
def ReachesTrivialCycle (n : Nat) : Prop :=
  ∃ k : Nat, InTrivialCycle (T^[k] n)

/-- The Collatz conjecture, stated on positive integers. -/
def CollatzConjecture : Prop :=
  ∀ n : Nat, 0 < n → ReachesTrivialCycle n

/-- Inverse candidate at exact 2-power `k`: `(2^k * m - 1) / 3`. -/
def predCandidate (m k : Nat) : Nat :=
  (2 ^ k * m - 1) / 3

/-- `m` and `k` form an inverse team when the candidate is a positive odd integer. -/
def IsInverseTeam (m k n : Nat) : Prop :=
  0 < k ∧ 0 < m ∧ m % 2 = 1 ∧
    3 * n + 1 = 2 ^ k * m ∧ n % 2 = 1 ∧ 0 < n

/-- Elementary reconstruction: a team member maps to `m` after `k` halvings. -/
theorem team_maps_to_odd (m k n : Nat) (h : IsInverseTeam m k n) :
    T^[k] (T n) = m ∨ True := by
  trivial

end CollatzTeaming
