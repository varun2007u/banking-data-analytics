-- Referential integrity: transactions without a known account
SELECT t.*
FROM analytics.transactions t
LEFT JOIN analytics.accounts a ON a.account_id = t.account_id
WHERE a.account_id IS NULL;

-- Duplicate transaction identifiers
SELECT transaction_id, COUNT(*) AS row_count
FROM analytics.transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

-- Invalid transaction statuses
SELECT *
FROM analytics.transactions
WHERE status NOT IN ('POSTED', 'PENDING', 'REVERSED');

-- Customer records with missing identifiers or invalid status
SELECT *
FROM analytics.customers
WHERE customer_id IS NULL
   OR customer_status NOT IN ('ACTIVE', 'DORMANT', 'CLOSED');
