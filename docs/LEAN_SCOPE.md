# Lean 4 scope

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0.

Toolchain on this repo: `leanprover/lean4:v4.34.0` (current stable as of 2026-09-14).
No Mathlib dependency. `lake build` is the checker.

## What is typechecked here

- `T`, trivial orbit `1 → 4 → 2 → 1`
- type dictionary: `blockCount` is `m`, `oddCount` is `K`
- block-map identity `2^{k+ℓ} n' + 2^k = 3^k (n+1)` on `(1,1,1,1)` and `(3,2,0,8)`
- `ExistsNontrivial92` as a `Prop` with no inhabitant
- Rhin / SdW Lemma 12 as citation strings, not theorems

## What is not typechecked

- Lemma 1 / `RemainingLemma` / Collatz
- Rhin 1987 Padé construction
- Hercher Cor. 29 (analytic; cited in docs)
- a 92-tuple `T`
- Hodge, Tate, Navier–Stokes, Kuznetsov partners

`CollatzTeaming/Remaining.lean` no longer contains `sorry`.
A missing inhabitant is not a disproof and not a proof.

## Other Lean repos under BenFrohman

These already ship skeletons. They are statements, not Clay closes:

- `NS_Millennium_Proof` — encoding, not a certified regularity proof
- `HODGE`, `HODGE-DISPROOF` — schema; Clay status OPEN
- `NoetherLefschetz`, `FermatPlanes`, `CubicFourfold` — easy-arrow geometry
- `TateConjecture`, `StandardConjectures` — statements
- `p2q-jumps-lean`, `OmegaZero34` — separate notes
- `Test-Practice-Repo` — archived provenance dump

This pass updates `collatz-teaming-lemma` only.
Replaying Rhin or Hercher inside Mathlib is a paper, not a REPL.
