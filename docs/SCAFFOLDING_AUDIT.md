# Scaffolding audit — 24 September 2026

Object audited: the locked Collatz ledger (cycles vs paths, Prop 1.1, Simons, Lemmas 1, 2, L).
NS-alignment checks in the auditor skill do not apply; there is no PDE in this repo.

## Architecture as claimed

    D, R, Prop 1.1          certified pieces
    Simons 2005/2007        no 2-block closed orbits
    Lemma 1                 every closed orbit     OPEN
    Lemma 2                 descent on paths       OPEN
    D + 1 + 2 ⇒ L          implication             claimed
    Lemma L                 every orbit reaches 1  OPEN

## Sound links

- Cycle ≠ path. A block is a path; an m-cycle is m blocks glued until they close. That split is coherent and matches Steiner–Simons.
- Prop 1.1 is a 1-block closed-orbit statement. It sits under Lemma 1, not under Lemma L.
- Simons is a 2-block closed-orbit statement. It also sits under Lemma 1. It does not touch Δ_div.
- The two Δs are independent failure modes. Emptying one does not empty the other.
- If Lemma 1 is “Δ_cyc = ∅” and Lemma 2 is “Δ_div = ∅” (or a true Lyapunov that forces that), then 1+2 ⇒ L is the standard partition of Collatz. That arrow can be sound while 1 and 2 stay open.

## Links that need a written hypothesis

- D and R are named as proved but are not defined in LEDGER.md. Until they are spelled as predicates, “D+1+2 ⇒ L” is a slogan.
- Lemma 2 in the grind is “a V that falls at every odd-to-odd step outside a finite set.” That is stronger than “no divergent path,” and the grind already showed n and log n fail. If Lemma 2 is that V-statement, then 1+2 ⇒ L is not automatic: a failing V is not Δ_div = ∅.
- Using the sign of log along the orbit of 27 after it hits 1 assumes L on that orbit. The grind already marked this circular. Keep it marked.
- Relabeling Simons’ 2-cycle as “K=2 odd terms” would identify two different predicates. That identification is not in the ledger anymore; do not put it back.

## What would be a hidden contradiction

- Discharging Lemma L by citing D+1+2 ⇒ L while Lemma 1 or 2 is still open.
- Treating a finite valuation search as Simons.
- Treating a path to 1 as a cycle, or a 2-block walk that does not close as a 2-cycle.
- Importing a symplectic/NS tether into this implication. Different problem.

## Verdict

The high-level split is coherent. The implication 1+2 ⇒ L is an arrow, not a theorem with discharged hypotheses. Prop 1.1 and Simons occupy two cells under Lemma 1. Lemma 1, Lemma 2, and Lemma L remain open.
