/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman

Rhin 1987 is cited, not proved. Simons Lemma 12 is a rewrite.
This file does not formalize Padé approximants.
-/

namespace CollatzTeaming

/-- Citation tag only. The analysis lives in docs/RHIN_DERIVATION.md. -/
def rhin1987Citation : String :=
  "Rhin, Approximants de Padé et mesures effectives d'irrationalité, Prog. Math. 71 (1987)"

/-- Simons–de Weger Lemma 12 stencil, as a named constant, not a theorem. -/
def sdwLemma12Stencil : String :=
  "| (K+L) log 2 - K log 3 | > exp(-13.3 (0.46057 + log K))"

/-- Recorded first-iterate comparison at Cor.29 start. Data, not a proof of Rhin. -/
def cor29StartK : Nat := 137500000000

def rhinDoesNotBanM92 : String :=
  "At K > 1.375e11 the Rhin lower ~1.59e-151 sits below the cycle Λ-upper 1.26e-20. No ban."

end CollatzTeaming
