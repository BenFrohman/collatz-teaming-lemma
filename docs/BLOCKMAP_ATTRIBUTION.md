# Block map attribution

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0.

## Not Hercher Theorem 21

Hercher Theorem 21 is the m_2 / K bootstrap (raise odd-count from a verified floor).
It is not the integer block identity.

## What is on disk as BlockMap

Recorded by Benjamin Stanley Frohman in `docs/M92_BLOCK_MAP.md` and `CollatzTeaming/BlockMap.lean`:

    2^{k+ℓ} n' + 2^k = 3^k (n+1).

This is the closed form of k copies of T_1(n)=(3n+1)/2 followed by ℓ extra halves.
Checks: (n,k,ℓ,n') = (1,1,1,1) and (3,2,0,8).
Residue: odd n is 1 or 3 mod 4; k≥2 requires n ≡ 3 (mod 4).

## What is the Frohman finding here

The k=1-only stencil

    [3^k n + (3^k-1)/2] / 2^{k+ℓ}

equals the closed form iff 3^k = 2^{k+1}-1, which holds only at k=1.
At k=2 the stencil yields 31/4 for n=3, not an integer.
That correction, the Lean encoding, and the named Prop `ExistsNontrivial92` are this ledger.

The unrolled identity itself is the Syracuse map written in integers. It is not a new proof of Collatz and it is not Hercher 21.

## ExistsNontrivial92 inhabitant

Type:

    ∃ T : Fin 92 → Block, closes92 T ∧ 1 < (T 0).n

No term of that type is supplied. C_0 = (1,1,1) closes one block and fails 1 < n.
Repeating C_0 is still n=1. No 92-tuple is written.
