-- Monthly customer activity by segment and region.
-- Adapt DATE_TRUNC syntax to the target SQL platform.
SELECT
    DATE_TRUNC('month', CAST(onboard_date AS DATE)) AS onboarding_month,
    segment,
    region,
    COUNT(DISTINCT customer_id) AS customers_onboarded,
    COUNT(DISTINCT CASE WHEN customer_status = 'ACTIVE' THEN customer_id END) AS active_customers_in_snapshot
FROM analytics.customers
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3;
