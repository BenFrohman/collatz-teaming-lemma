# The 92 local identities

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0.
Date: 28 September 2026.

This file is the author's ledger of the Diophantine circle for a hypothetical 92-block Collatz cycle. Cited papers are not co-authorship.

Cited:
- C. Hercher, There are no Collatz m-cycles with m ≤ 91, J. Integer Sequences 26 (2023), Article 23.3.5.
- R. P. Steiner, A theorem on the Syracuse problem, Proc. 7th Manitoba Conf. Numerical Math. and Computing (1977).
- J. Simons and B. de Weger, Theoretical and computational bounds for m-cycles of the 3n+1-problem, Acta Arith. 117 (2005), 51–70.

## Type

$$
T=(n_i,k_i,\ell_i)_{i=1}^{92}
$$

with each $n_i$ a positive odd local minimum, $k_i\ge 1$, $\ell_i\ge 0$, $n_{93}:=n_1>1$.

A term of this type would inhabit $\operatorname{ExistsNontrivial92}$. No such term is written.

## Local identity

For each $i=1,\ldots,92$,

$$
2^{k_i+\ell_i}n_{i+1}+2^{k_i}=3^{k_i}(n_i+1).
$$

Solved for the next minimum:

$$
n_{i+1}=\frac{3^{k_i}(n_i+1)-2^{k_i}}{2^{k_i+\ell_i}}.
$$

Integrality: $2^{k_i+\ell_i}$ divides $3^{k_i}(n_i+1)-2^{k_i}$.

Simons form $n_i=a_i 2^{k_i}-1$ is the statement that the first $k_i$ factors of $2$ already divide $n_i+1$. The leftover $\ell_i$ halves are the extra descent.

## Residue cut

$T_1(n)=(3n+1)/2$ is odd iff $n\equiv 3\pmod{4}$. Hence:

- if $n_i\equiv 1\pmod{4}$, then $k_i=1$ is forced;
- if $k_i\ge 2$, then $n_i\equiv 3\pmod{4}$.

Local on each pair $(n_i,k_i)$, not a global cycle.

## Computed instances (not 92)

| input | identity | output | close? |
|---|---|---|---|
| $n=1,\,k=1,\,\ell=1$ | $4n'+2=6$ | $n'=1$ | yes, $C_0$ |
| $n=3,\,k=2,\,\ell=0$ | $4n'+4=36$ | $n'=8$ | no |

The second fires and still fails to be a cycle: $8$ is even, so it is not the next odd minimum.

## Unrolled close

$$
n_1\bigl(2^{K+L}-3^{K}\bigr)=S(k,\ell),\qquad K=\sum k_i,\quad L=\sum\ell_i,\quad n_1>1.
$$

$S$ is forced by the 92 local identities. After composing and moving $n_1\cdot 3^{K}$ to the left,

$$
S(k,\ell)=\sum_{i=1}^{92} 3^{K_i}\,2^{L_i}\bigl(2^{k_i}-3^{k_i}\bigr),
$$

where $K_i$ (resp. $L_i$) is the total odd-count (resp. extra-halves) after block $i$, wrapping around the cycle. $S$ is a function of the widths alone.

One-block check: $k=1$, $\ell=1$, $K=1$, $L=1$:

$$
n_1(2^{2}-3^{1})=n_1.
$$

Local identity gives $S=1$ when $n_1=1$, so $1=1$. That is $C_0$. Steiner: $n(2^{L}-3)=1$ forces $n=1$, $L=2$ for a 1-cycle.

## Entity

The equation is locked. The entity is **not** supplied.

No widths $(k_i,\ell_i)$ and no $n_1>1$ are written that close the 92-circle. $\operatorname{ExistsNontrivial92}$ stays empty.

## Walls (cited, not re-proved)

If $m=92\le 98$, then $K>7.76\times 10^{19}$ (Hercher Cor. 24).
If $X_0\ge 3\cdot 2^{69}$, then $K>1.375\times 10^{11}$ (Hercher Cor. 29).
Those bound $\sum k_i$. They do not list the $n_i$.

## What the identities do not do

- They do not pick $k_i,\ell_i$.
- They do not produce 92 odd integers.
- They do not inhabit $\operatorname{ExistsNontrivial92}$.
- They do not prove Collatz.

The 92 local identities are a Diophantine circle. The only written point on that circle is the 1-block point $C_0$, which is the wrong length.
