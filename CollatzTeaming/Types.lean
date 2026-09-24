/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Type dictionary. m ≠ K ≠ n ≠ L ≠ CardΩ.
-/

namespace CollatzTeaming

/-- One ascent-then-descent block. `n` is an odd local minimum. -/
structure Block where
  n   : Nat
  k   : Nat
  ell : Nat
  odd : n % 2 = 1
  kpos : 0 < k

/-- Block-count. Hercher Def. 6. Not odd-count. -/
def blockCount {m : Nat} (_T : Fin m → Block) : Nat := m

/-- Odd-count K = sum of the k_i. Not m. -/
def oddCount {m : Nat} (T : Fin m → Block) : Nat :=
  (List.ofFn fun i : Fin m => (T i).k).sum

/-- Even-count L = sum of the extra ℓ_i. -/
def evenExtra {m : Nat} (T : Fin m → Block) : Nat :=
  (List.ofFn fun i : Fin m => (T i).ell).sum

theorem blockCount_eq {m : Nat} (T : Fin m → Block) :
    blockCount T = m := rfl

end CollatzTeaming
