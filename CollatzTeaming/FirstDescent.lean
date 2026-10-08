/-
Copyright (c) 2026 Benjamin Frohman. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Benjamin Frohman
-/

import CollatzTeaming.Basic

/-!
# First descent, checked cases

`27` falls below itself at step `96`, to `23`, and reaches `1` at step `111`.
`703` falls below itself at step `132`. These are finite checks. They do not
inhabit `RemainingLemma`.
-/

namespace CollatzTeaming

def staysAbove (n cap : Nat) : Bool :=
  (List.range cap).all fun k => decide (n ≤ iter k n)

theorem descent_27 :
    iter 96 27 = 23 ∧ 23 < 27 ∧ staysAbove 27 96 = true ∧ iter 111 27 = 1 := by
  native_decide

theorem descent_703 :
    iter 132 703 < 703 ∧ staysAbove 703 132 = true := by
  native_decide

end CollatzTeaming
