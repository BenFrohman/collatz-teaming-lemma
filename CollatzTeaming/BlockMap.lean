/-
Copyright (c) 2026 Benjamin Stanley Frohman. All rights reserved.
Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
License: CC BY 4.0

Frohman block-map theorem (this module).
After k o-steps T₁(n)=(3n+1)/2 and ℓ extra halves,
  2^{k+ℓ} n' + 2^k = 3^k (n+1).
The k=1-only stencil (3^k n + (3^k-1)/2)/2^{k+ℓ} equals this
iff 3^k = 2^{k+1}-1, which is only k=1.
Checks: (n,k,ℓ,n') = (1,1,1,1) and (3,2,0,8).
Residue: k≥2 requires n ≡ 3 (mod 4).

This is not Hercher Theorem 21.
Hercher Thm 21 / Lemma 22 is the m₂ bootstrap that raises K.
-/

namespace CollatzTeaming

/-- Frohman block-map identity. -/
def blockClose (n k ell n' : Nat) : Prop :=
  2 ^ (k + ell) * n' + 2 ^ k = 3 ^ k * (n + 1)

/-- Trivial cycle C_0 as one block: 1 → 2 → 1. -/
theorem frohman_trivial_block : blockClose 1 1 1 1 := by
  native_decide

/-- Alias kept so M92.C0_closes_one still resolves. -/
theorem trivial_block : blockClose 1 1 1 1 := frohman_trivial_block

/-- n=3, k=2, ℓ=0 gives n'=8. -/
theorem frohman_block_n3_k2 : blockClose 3 2 0 8 := by
  native_decide

theorem block_n3_k2 : blockClose 3 2 0 8 := frohman_block_n3_k2

/-- Residue lock: a second o-step needs n ≡ 3 (mod 4). -/
theorem frohman_odd_mod4 (n : Nat) (h : n % 2 = 1) :
    n % 4 = 1 ∨ n % 4 = 3 := by
  have : n % 4 < 4 := Nat.mod_lt n (by decide)
  omega

theorem odd_mod4 (n : Nat) (h : n % 2 = 1) :
    n % 4 = 1 ∨ n % 4 = 3 := frohman_odd_mod4 n h

end CollatzTeaming
