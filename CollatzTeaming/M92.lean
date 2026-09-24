/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

A 92-cycle is a Prop. No inhabitant is supplied.
-/

import CollatzTeaming.Types
import CollatzTeaming.BlockMap

namespace CollatzTeaming

/-- 92 blocks indexed mod 92. -/
def Cycle92 := Fin 92 → Block

/-- The 92 local identities plus wrap-around. -/
def closes92 (T : Cycle92) : Prop :=
  ∀ i : Fin 92, blockClose (T i).n (T i).k (T i).ell (T (i + 1)).n

/-- Nontrivial 92-cycle: closes and the first minimum exceeds 1. -/
def ExistsNontrivial92 : Prop :=
  ∃ T : Cycle92, closes92 T ∧ 1 < (T 0).n

/-- Status lock. Do not inhabit this. -/
def existsNontrivial92Status : String := "unwritten"

/-- The only cycle-tuple we record is C_0, excluded by n>1. -/
def C0_block : Block :=
  { n := 1, k := 1, ell := 1, odd := by decide, kpos := by decide }

theorem C0_closes_one : blockClose C0_block.n C0_block.k C0_block.ell C0_block.n :=
  trivial_block

end CollatzTeaming
