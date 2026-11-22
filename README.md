# Collatz teaming lemma — Lean skeleton

[![Lean certificate](https://github.com/BenFrohman/collatz-teaming-lemma/actions/workflows/certify.yml/badge.svg?branch=main)](https://github.com/BenFrohman/collatz-teaming-lemma/actions/workflows/certify.yml)
[![Kernel certificate](https://github.com/BenFrohman/collatz-teaming-lemma/actions/workflows/kernel-certificate.yml/badge.svg?branch=main)](https://github.com/BenFrohman/collatz-teaming-lemma/actions/workflows/kernel-certificate.yml)
[![Lean 4](https://github.com/BenFrohman/collatz-teaming-lemma/actions/workflows/lean.yml/badge.svg?branch=main)](https://github.com/BenFrohman/collatz-teaming-lemma/actions/workflows/lean.yml)
[![Lean header](https://github.com/BenFrohman/collatz-teaming-lemma/actions/workflows/lean-header.yml/badge.svg?branch=main)](https://github.com/BenFrohman/collatz-teaming-lemma/actions/workflows/lean-header.yml)

<!-- ZENODO-PROVENANCE-HEADER -->
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23629486.svg)](https://doi.org/10.5281/zenodo.23629486)
[![License: Apache-2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0006--7068--3718-brightgreen.svg)](https://orcid.org/0009-0006-7068-3718)

## Kernel certificate

[certificates/CERTIFICATE.md](certificates/CERTIFICATE.md): commit `134483cd`, `leanprover/lean4:v4.34.0`. `lake build` passes; the sorry/axiom scan finds 0 hits; **126 theorems depend only on `propext`, `Classical.choice`, `Quot.sound`**; 20 of 20 modules replayed through the kernel, 0 failures ([CI run](https://github.com/BenFrohman/collatz-teaming-lemma/actions/runs/44968452979)). `RemainingLemma` is not one of those theorems. The same audit passed again on commit `230089be` ([CI run](https://github.com/BenFrohman/collatz-teaming-lemma/actions/runs/45083068264)). Version 1.1.0, [10.5281/zenodo.24451015](https://doi.org/10.5281/zenodo.24451015), keeps the September PDF and source zip and adds both logs. Record [10.5281/zenodo.23629486](https://doi.org/10.5281/zenodo.23629486) is version 1.0.0 and does not contain them. Neither record is a proof of the Collatz conjecture. The verification PDF in [p2q-jumps-lean](https://github.com/BenFrohman/p2q-jumps-lean) certifies four theorems in that other repository, at commit `821e35e`, Lean 4.26.0. It is not this certificate.

> **Author:** Benjamin Stanley Frohman ([ORCID: 0009-0006-7068-3718](https://orcid.org/0009-0006-7068-3718))  
> **Origin Provenance:** `2026-09-20 15:47:26 CDT (Git Initial Commit)`  
> **Zenodo Archive & DOI:** [`10.5281/zenodo.23629486`](https://doi.org/10.5281/zenodo.23629486) ([Zenodo Record `23629486`](https://zenodo.org/records/23629486))  
> **Primary Manuscript PDF:** [`Frohman_Collatz_Teaming_Lemma_and_Eliahou_Windows_2026.pdf`](./Frohman_Collatz_Teaming_Lemma_and_Eliahou_Windows_2026.pdf)  
> **Copyright & License:** Copyright (c) 2026 Benjamin Stanley Frohman. Licensed under the Apache License, Version 2.0 ([`LICENSE`](./LICENSE), [`NOTICE`](./NOTICE)).
<!-- /ZENODO-PROVENANCE-HEADER -->


**Author:** Benjamin Stanley Frohman (GitHub `BenFrohman`)  
**Email:** frohmanbenjamin@gmail.com  
**ORCID:** [0009-0006-7068-3718](https://orcid.org/0009-0006-7068-3718)  
**Copyright:** © 2026 Benjamin Stanley Frohman. All rights reserved, except as granted by the license.  
**License:** [Apache License 2.0](LICENSE)

**Status: the remaining lemma is not certified.**

This repository records the exact logical status of the remaining lemma on [The 3n+1 Machine](https://slate-terra-autumn-meadow.grok.me):

> every infinite team eventually maps into the cycle `{1,4,2}`.

That sentence is the Collatz conjecture on the positive integers. Lean records the equivalence and leaves the kernel open.


## The kernel-checked equivalence

The theorem the kernel accepts is the equivalence, not the covering claim.

```lean
theorem remaining_lemma_iff_collatz : RemainingLemma ↔ CollatzConjecture
```

`RemainingLemma` is `∀ n, 0 < n → ∃ k, iter k n = 1`. `CollatzConjecture` is the same claim stated as reaching the cycle `{1, 2, 4}`. The proof rewrites one definition into the other. On commit `e211540b`, the kernel-certificate job passed `collectAxioms` for 126 theorems and replayed the modules with `leanchecker`: [run 44968111937](https://github.com/BenFrohman/collatz-teaming-lemma/actions/runs/44968111937). `Lean certificate` and `Lean 4` also passed on that commit.

That equivalence does not prove `RemainingLemma`. The theorem `remaining_lemma` still takes `RemainingLemma` as its hypothesis.

## What is certified

- The classical map `T`.
- The trivial cycle `C0 = (1 → 4 → 2 → 1)`, bound max = 4 on that orbit only.
- Predicates D (dichotomy) and R (reduction to the two Δs).
- The definition of inverse-residue teams.
- `RemainingLemma ↔ CollatzConjecture`, proved as `remaining_lemma_iff_collatz`.
- Proved by `decide +kernel`: the scene certificates in `CollatzTeaming/Kernel.lean`: inverse parent rule, the amber edge, five finite orbits, and the halving family. These do not inhabit `RemainingLemma`.

## What is not certified

`RemainingLemma` is open (it is the Collatz conjecture). It is never assumed globally: every result that needs it takes it as an explicit argument, e.g.

```lean
theorem remaining_lemma (h : RemainingLemma) : RemainingLemma := h
```

`lake build` is clean with 0 `sorry` and no custom axioms; `collectAxioms` over all theorems reports only `propext`, `Classical.choice`, `Quot.sound`. The depth-27 inverse-tree counts are the named Prop `ReverseTreeDepth27`, checked by `#eval`, not by a kernel proof.

Lemma 1 (`Δ_cyc=∅`), Lemma 2 (`Δ_div=∅`), and Lemma L stay open.
A failed Lyapunov (`V=n`, `V=log n` at 27→41) is not Lemma 2 and is not `¬`Lemma 2.
Kind A (no m-cycle for m ≤ 91) is literature (Steiner / Simons / Hercher). Kind B (every m) is Lemma 1 and is open.

## Ledger

See `docs/`. Entry points: `LEDGER.md`, `LEMMA1_CITED.md`, `LMN_SPLIT.md`, `DO_NOT_MISREAD.md`, `SWEAT_AND_LITERATURE.md`.

## Contributing

Read [CONTRIBUTING.md](CONTRIBUTING.md). PRs need @BenFrohman approval. See [COPYRIGHT](COPYRIGHT) and [LICENSE](LICENSE).

No upstream Mathlib pull request until `lake build` is clean, the contributed files contain no `sorry`, and the statement matches what the author can defend. A finite orbit certificate is not a Mathlib contribution of Collatz.

## Circularity note

Any argument that assumes every infinite team already falls into `{1,4,2}` in order to prove the remaining lemma is circular. The realized negative log-mean on the orbit of 27 is in that class.

## Zenodo

No preprint claiming a proof of Collatz is deposited. Version 1.1.0 attaches the kernel logs and leaves RemainingLemma open. A paper titled as a proof of Collatz would be false on the present kernel.

Companions: [the-3n-plus-1-machine](https://github.com/BenFrohman/the-3n-plus-1-machine), [3n-plus-c-cycle-census](https://github.com/BenFrohman/3n-plus-c-cycle-census).

## Zenodo archive

- [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23629485.svg)](https://doi.org/10.5281/zenodo.23629485) Negative Expected Drift Does Not Imply a Unique Attractor at 1: Eliahou Windows, Rhin Linear Forms in Logarithms, and the Collatz Teaming Lemma in Lean 4 — all versions: [10.5281/zenodo.23629485](https://doi.org/10.5281/zenodo.23629485); version 1.0.0: [10.5281/zenodo.23629486](https://doi.org/10.5281/zenodo.23629486); version 1.1.0, with the 22 November kernel logs: [10.5281/zenodo.24451015](https://doi.org/10.5281/zenodo.24451015)
- [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23867506.svg)](https://doi.org/10.5281/zenodo.23867506) Negative Expected Drift Does Not Imply a Unique Attractor at 1: Eliahou Windows, Rhin Linear Forms in Logarithms, and the Collatz Teaming Lemma in Lean 4 — all versions: [10.5281/zenodo.23867506](https://doi.org/10.5281/zenodo.23867506); latest version: [10.5281/zenodo.23932497](https://doi.org/10.5281/zenodo.23932497)
