
-- ============================================================
-- Executive Audit KPI Queries
-- ============================================================

-- Global audit KPIs
SELECT
    COUNT(*) AS total_invoices,
    ROUND(SUM(invoice_amount), 2) AS total_invoice_amount,
    ROUND(AVG(audit_risk_score), 2) AS average_audit_risk_score,
    SUM(CASE WHEN audit_rule_count > 0 THEN 1 ELSE 0 END) AS invoices_with_exceptions,
    ROUND(
        SUM(CASE WHEN audit_rule_count > 0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS exception_rate_percentage,
    SUM(CASE WHEN audit_risk_level IN ('High Risk', 'Critical Risk') THEN 1 ELSE 0 END) AS high_risk_invoices,
    SUM(ml_anomaly_flag) AS ml_detected_anomalies
FROM fact_audit_transactions;

-- Risk level distribution
SELECT
    audit_risk_level,
    COUNT(*) AS invoices,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_audit_transactions), 2) AS percentage
FROM fact_audit_transactions
GROUP BY audit_risk_level
ORDER BY invoices DESC;

-- Monthly audit risk trend
SELECT
    invoice_year,
    invoice_month,
    COUNT(*) AS invoice_count,
    ROUND(SUM(invoice_amount), 2) AS total_invoice_amount,
    ROUND(AVG(audit_risk_score), 2) AS average_risk_score,
    SUM(CASE WHEN audit_rule_count > 0 THEN 1 ELSE 0 END) AS exception_invoices
FROM fact_audit_transactions
GROUP BY invoice_year, invoice_month
ORDER BY invoice_year, invoice_month;
