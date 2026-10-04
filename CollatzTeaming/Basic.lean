/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Local structure of the classical 3n+1 map. No covering claim.
-/

namespace CollatzTeaming

def T (n : Nat) : Nat :=
  if n % 2 = 0 then n / 2 else 3 * n + 1

def iter (k n : Nat) : Nat :=
  match k with
  | 0 => n
  | k + 1 => T (iter k n)

@[simp] theorem iter_zero (n : Nat) : iter 0 n = n := rfl

@[simp] theorem iter_succ (k n : Nat) : iter (k + 1) n = T (iter k n) := rfl

theorem iter_succ' (k n : Nat) : iter (k + 1) n = iter k (T n) := by
  induction k generalizing n with
  | zero => rfl
  | succ k ih =>
    rw [iter_succ, ih, iter_succ]

@[simp] theorem T_even {n : Nat} (h : n % 2 = 0) : T n = n / 2 := by
  simp [T, h]

@[simp] theorem T_odd {n : Nat} (h : n % 2 = 1) : T n = 3 * n + 1 := by
  simp [T, h]

theorem T_one : T 1 = 4 := by decide
theorem T_four : T 4 = 2 := by decide
theorem T_two : T 2 = 1 := by decide

theorem trivial_cycle : T 1 = 4 ∧ T 4 = 2 ∧ T 2 = 1 := by
  exact ⟨T_one, T_four, T_two⟩

def InTrivialCycle (n : Nat) : Prop :=
  n = 1 ∨ n = 2 ∨ n = 4

def ReachesTrivialCycle (n : Nat) : Prop :=
  ∃ k : Nat, InTrivialCycle (iter k n)

def CollatzConjecture : Prop :=
  ∀ n : Nat, 0 < n → ReachesTrivialCycle n

theorem two_mul_even (m : Nat) : (2 * m) % 2 = 0 :=
  Nat.mul_mod_right 2 m

theorem even_double (m : Nat) : T (2 * m) = m := by
  simp [T, two_mul_even m, Nat.mul_div_cancel_left m (by decide : 0 < 2)]

theorem iterate_halve (k m : Nat) : iter k (2 ^ k * m) = m := by
  induction k with
  | zero => simp
  | succ k ih =>
    rw [iter_succ', Nat.pow_succ, Nat.mul_comm (2 ^ k) 2, Nat.mul_assoc]
    have h : (2 * (2 ^ k * m)) % 2 = 0 := two_mul_even _
    rw [T_even h, Nat.mul_div_cancel_left _ (by decide : 0 < 2), ih]

def IsInverseTeam (m k n : Nat) : Prop :=
  0 < k ∧ 0 < m ∧ m % 2 = 1 ∧
    3 * n + 1 = 2 ^ k * m ∧ n % 2 = 1 ∧ 0 < n

theorem team_maps_to_odd (m k n : Nat) (h : IsInverseTeam m k n) :
    iter k (T n) = m := by
  rcases h with ⟨_hk, _hm, _hmod, heq, hodd, _hpos⟩
  have hT : T n = 2 ^ k * m := by
    rw [T_odd hodd, heq]
  rw [hT]
  exact iterate_halve k m

end CollatzTeaming
