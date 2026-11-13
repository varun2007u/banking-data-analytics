# Banking Data Analytics

A portfolio case study using a small synthetic retail-banking dataset to explore customer activity, balances, product mix, and operational data controls.

## Business questions
- How many active customers do we have by month?
- What is the month-end deposit balance and its movement?
- Which products contribute most to the deposit base?
- Are the customer, account, and transaction records complete and internally consistent?

## Repository guide
- `data/` — synthetic customer, account, and transaction examples
- `sql/` — analytical queries for monthly KPIs and data controls
- `docs/metric-dictionary.md` — KPI definitions and calculation choices
- `docs/data-governance.md` — ownership, critical elements, quality rules, and lineage notes

## Important modelling choices
- The account table has one row per account.
- The transaction table has one row per posted transaction.
- Balances are end-of-day snapshots; do not sum daily snapshots across dates.
- Only transactions with `status = 'POSTED'` are included in posted activity.
- Customer counts are distinct customer IDs, not account counts.

## Run it
The SQL uses broadly portable ANSI-style syntax. Adapt date functions and schema names for your warehouse (for example, PostgreSQL, SQL Server, Snowflake, or BigQuery).

All data in this repository is invented for demonstration. It does not represent a real bank, customer, account, or transaction. Monetary amounts are illustrative and use INR as the reporting currency.

## Suggested extensions
1. Add a slowly changing dimension for customer attributes.
2. Add a reconciliation between opening balance, posted movements, and closing balance.
3. Add a monthly data-quality scorecard with thresholds and trend history.
4. Implement row-level access and masking for sensitive customer attributes in a real environment.
