-- Posted transaction activity by month and transaction type.
-- This query reports movement, not balances.
SELECT
    DATE_TRUNC('month', CAST(transaction_date AS DATE)) AS activity_month,
    transaction_type,
    COUNT(DISTINCT transaction_id) AS posted_transaction_count,
    SUM(amount) AS posted_amount
FROM analytics.transactions
WHERE status = 'POSTED'
GROUP BY 1, 2
ORDER BY 1, 2;

-- Simple net movement by month and account.
SELECT
    DATE_TRUNC('month', CAST(transaction_date AS DATE)) AS activity_month,
    account_id,
    SUM(CASE
        WHEN transaction_type IN ('DEPOSIT', 'TRANSFER_IN', 'INTEREST') THEN amount
        WHEN transaction_type IN ('WITHDRAWAL', 'TRANSFER_OUT') THEN -amount
        ELSE 0
    END) AS net_posted_movement
FROM analytics.transactions
WHERE status = 'POSTED'
GROUP BY 1, 2
ORDER BY 1, 2;
