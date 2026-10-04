# Named axiom, not a certificate

Author: Benjamin Stanley Frohman
Copyright (c) 2026 Benjamin Stanley Frohman

`CollatzTeaming/Axiom.lean` records

```lean
axiom remaining_lemma_assumption : RemainingLemma
```

where `RemainingLemma` is `∀ n, 0 < n → InReverseTree n`.

This axiom is an explicit unproved assumption. It is not a proof. `#print axioms remaining_lemma_from_assumption` reports `remaining_lemma_assumption`. Any later theorem that uses it depends on that assumption.

Discharge, when a proof exists, means:

1. Delete the axiom.
2. Replace it with `theorem remaining_lemma_assumption : RemainingLemma := ...` built without `sorry` and without this axiom.
3. Confirm `#print axioms` on the resulting theorem lists only the standard kernel axioms (`propext`, `Classical.choice`, `Quot.sound`), not this name and not `sorryAx`.

The local rules `even_preimage`, `C_odd_pred`, and `mod_six_of_odd_step` do not have type `RemainingLemma`, so they cannot discharge this axiom.
