# Metric dictionary

| Metric | Definition | Grain | Notes |
|---|---|---|---|
| Active customers | Distinct customers with ACTIVE status | Onboarding cohort month, segment, region | This groups the supplied current-status snapshot by onboarding month; it is not a historical month-end active-customer series |
| Open accounts | Count of accounts with OPEN status | Month, product | Account-level measure; not interchangeable with customer count |
| Posted transaction volume | Sum of amounts for POSTED transactions | Month, transaction type | Reversed and pending rows are excluded |
| Posted transaction count | Count of POSTED transaction IDs | Month, transaction type | Count distinct IDs if source duplicates are possible |
| Net posted movement | Deposits + transfer in + interest - withdrawals - transfer out | Month, account | A movement measure, not an account balance |
| Month-end balance | Closing balance at the final calendar day of a month | Month, account | Requires a dated balance snapshot or a complete opening-balance-and-movements ledger |

## Calculation cautions
- Do not add balances across multiple snapshot dates.
- Do not count accounts when the business question asks for customers.
- Confirm whether the reporting definition includes pending, reversed, or backdated transactions.
- Agree a single reporting currency or apply a governed FX conversion before aggregating currencies.
- Document whether customer status is point-in-time or current-state.
