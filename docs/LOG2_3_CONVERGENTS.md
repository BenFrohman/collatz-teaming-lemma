# Continued fraction approximations of log_2 3

Author: Benjamin Stanley Frohman
Email: frohmanbenjamin@gmail.com
ORCID: 0009-0006-7068-3718
GitHub: BenFrohman
X: @Investor0x
Copyright (c) 2026 Benjamin Stanley Frohman. License: CC BY 4.0.
Date: 28 September 2026.

Author of this ledger: Benjamin Stanley Frohman.
Cited: OEIS A028507, A005663, A005664; Simons 2005; Eliahou 1993; Hercher 2023.
Citations are not co-authorship.

## The number

    log_2 3 = 1.584962500721156... = [1; 1, 1, 2, 2, 3, 1, 5, 2, 23, 2, 2, 1, 1, 55, ...]

On a cycle, (K+L)/K sits just above this number.

## Convergents p/q ~ (K+L)/K

| p/q | role |
|---|---|
| 1/1, 2/1, 3/2, 8/5, 19/12 | coarse |
| 65/41, 84/53 | still small |
| 485/306 | Simons 2-cycle candidate |
| 1054/665 | next |
| 24727/15601 | other Simons 2-cycle candidate |
| 301994/190537 | Eliahou upper convergent |
| 17087915/10781274 | Eliahou length floor at X_0=2^40 |

A convergent is a ratio, not a list of n_i.
The 1993 Eliahou triple 301994a+17087915b+85137581c is stale at X_0=2^71.
It is a window, not a cycle.

ExistsNontrivial92 stays uninhabited.
