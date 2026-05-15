
-- ============================================================
-- Audit Exception Queries
-- ============================================================

-- High priority transactions
SELECT *
FROM vw_high_priority_transactions
LIMIT 25;

-- Department risk ranking
SELECT *
FROM vw_department_audit_risk;

-- Audit rules summary
SELECT *
FROM audit_rules_summary
ORDER BY Risk_Weight DESC, Flagged_Invoices DESC;

-- Machine learning anomaly distribution
SELECT *
FROM ml_anomaly_distribution;
