# Kernel certificate: collatz-teaming-lemma

This file records a machine check of the Lean 4 development in this repository. Lean does not issue a signed certificate. The numbers below are copied from GitHub Actions run [44968452979](https://github.com/BenFrohman/collatz-teaming-lemma/actions/runs/44968452979), artifact `kernel-certificate`.

| Item | Value |
|---|---|
| Repository | https://github.com/BenFrohman/collatz-teaming-lemma |
| Commit | `134483cd3beacf2b817528a611802b60a8e135a5` |
| lean-toolchain | `leanprover/lean4:v4.34.0` |
| Lean | Lean (version 4.34.0, x86_64-unknown-linux-gnu, commit 293d5d0c0c3f3dded4688b3ccd6a33939ac5102b, Release) |
| Lake | 5.0.0-src+293d5d0 |
| Mathlib | none |
| Date (UTC) | 2026-11-22T00:49:16Z |
| CI run | https://github.com/BenFrohman/collatz-teaming-lemma/actions/runs/44968452979 |
| `lake build` | `Build completed successfully (22 jobs).` ([build.log](build.log)) |
| sorry / admit / native_decide / axiom scan | `RESULT: 0 hits` ([sorry-scan.txt](sorry-scan.txt)) |
| `#print axioms` | `AUDIT PASS: 126 theorems in 18 modules depend only on propext, Classical.choice, Quot.sound (or on no axioms)` ([axioms.txt](axioms.txt)) |
| Kernel replay | `RESULT: 20 of 20 modules replayed through the kernel, 0 failures` ([leanchecker.txt](leanchecker.txt)) |

## What this certificate is not

`RemainingLemma` is `∀ n, 0 < n → ∃ k, iter k n = 1`. It is not one of the 126 theorems. `remaining_lemma_iff_collatz` proves that this sentence is equivalent to `CollatzConjecture`. The equivalence does not prove either side.

[10.5281/zenodo.23629486](https://doi.org/10.5281/zenodo.23629486) is version 1.0.0, the 20 September 2026 preprint and source zip. It does not contain this log. [10.5281/zenodo.24451015](https://doi.org/10.5281/zenodo.24451015) is version 1.1.0 of the same concept, [10.5281/zenodo.23629485](https://doi.org/10.5281/zenodo.23629485). It keeps that PDF and zip and adds this log together with the recheck on commit `230089be` ([run 45083068264](https://github.com/BenFrohman/collatz-teaming-lemma/actions/runs/45083068264)). [10.5281/zenodo.23932497](https://doi.org/10.5281/zenodo.23932497) is a later copy of the September preprint and says to cite the original. [10.5281/zenodo.24429710](https://doi.org/10.5281/zenodo.24429710) is a different note, the trajectory of 7. The verification PDF in p2q-jumps-lean certifies four theorems in that other repository, at commit `821e35e`, Lean 4.26.0. None of these records is a proof of the Collatz conjecture.

## Rebuild

```sh
git clone https://github.com/BenFrohman/collatz-teaming-lemma.git
cd collatz-teaming-lemma
git checkout 134483cd3beacf2b817528a611802b60a8e135a5
lake build
python3 certificates/tools/sorry_scan.py
python3 certificates/tools/gen_audit.py /tmp/KernelCertificateAudit.lean /tmp/modules.txt
lake env lean /tmp/KernelCertificateAudit.lean > /tmp/axioms.raw.txt
python3 certificates/tools/check_audit.py /tmp/axioms.raw.txt
```
