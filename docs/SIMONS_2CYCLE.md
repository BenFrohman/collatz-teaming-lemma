# Simons on 2-cycles — checked 24 September 2026

Terminology first. In Steiner–Simons an m-cycle is m blocks, each a run of odd (ascent) steps followed by a run of even (descent) steps. A 2-cycle is two such blocks. Total odd count K = k1+k2 may be large. That is not “two odd integers.”

The grind identity

    n0(2^{a+b}−9)=2^a+3,    n1(2^{a+b}−9)=2^b+3

is the corner of a 2-cycle in which each block has one odd term (k1=k2=1). The search a,b≤30 is a finite slice of that corner.

## What is in the literature

- Steiner (1977). The only positive 1-cycle is 1→4→2→1. This is Proposition 1.1.
- Simons, Math. Comp. 74 (2005), 1565–1572. No nontrivial 2-cycles. Proof: Diophantine system on the two odd local minima; (K+L)/K must be a convergent of log2 3; Laurent–Mignotte–Nesterenko upper bound vs growth lower bound; finite continued-fraction window, then a check of the remaining pairs (306,485) and (15601,24727).
- Simons, J. Number Theory 123 (2007), 10–17. Same theorem, inductive on Steiner: product a0 a1 has a numerical lower bound and an explicit upper bound that drop below 4. No exterior size bound on the xi is required. Cite this paper for “Simons already excluded every 2-cycle.”
- Later: Simons–de Weger on larger m; Hercher, no m-cycle for m≤91. Still not Collatz.

## Ceiling

- Proposition 1.1 stands.
- The a,b≤30 search is obsolete as a 2-cycle claim. It does not replace Simons and is not needed once Simons is cited.
- Lemma 1 (all cycles, all K) is not Simons’ theorem. An m-cycle with large m is still allowed in principle.
- Lemma 2 and Lemma L stay open. Naive Lyapunovs still fail on v=1.
- Δ_cyc and Δ_div are not empty.
