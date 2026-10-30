# Named hypothesis, not an axiom

Author: Benjamin Stanley Frohman
Copyright (c) 2026 Benjamin Stanley Frohman

The repository has no custom axioms. `RemainingLemma` (`∀ n, 0 < n → InReverseTree n`) is a named Prop, passed as an explicit argument:

```lean
theorem remaining_lemma_from_assumption (h : RemainingLemma) : RemainingLemma := h
```

Any theorem with `(h : RemainingLemma)` is conditional on it. Discharging it means proving `RemainingLemma` with no hypothesis, which is the Collatz conjecture.

The local rules `even_preimage`, `C_odd_pred`, and `mod_six_of_odd_step` do not have type `RemainingLemma`.
