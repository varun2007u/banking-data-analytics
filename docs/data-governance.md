# Data governance notes

This case study uses three logical data assets: Customer, Account, and Transaction.

## Ownership model (illustrative)
- **Business data owner:** accountable for the business meaning, permitted use, and quality expectations.
- **Data steward:** maintains definitions, reference values, issue triage, and metadata.
- **Data custodian / engineering:** implements ingestion, access controls, retention, and technical monitoring.
- **Report owner:** confirms KPI logic and communicates limitations to report consumers.

## Critical data elements and controls

| Element | Why it matters | Example control |
|---|---|---|
| customer_id | Joins customer to accounts | Not null; unique in customer master |
| account_id | Identifies an account | Not null; unique in account master |
| transaction_id | Identifies a movement | Not null; duplicate detection |
| transaction_date | Drives period reporting | Valid date; not beyond agreed future tolerance |
| amount | Drives monetary metrics | Numeric; non-negative at source unless signed entries are explicitly supported |
| status | Determines inclusion | Conformed reference domain; only POSTED included in posted activity |
| currency | Makes monetary totals comparable | Valid ISO currency and consistent conversion policy |

## Lineage sketch

`Source transaction system -> landing -> validated transaction fact -> monthly aggregate -> BI semantic model -> dashboard`

Each hand-off should retain source identifiers, ingestion timestamps, transformation version, and reconciliation evidence.

## Issue management
For every failed control, record the affected asset and period, severity, impacted downstream metrics, accountable owner, root cause, remediation, and closure evidence. A failed control should not silently disappear merely because a dashboard refresh succeeds.
