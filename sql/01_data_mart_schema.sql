
-- ============================================================
-- Financial Audit Risk Analytics Platform
-- SQLite Data Mart Schema
-- ============================================================

-- Core fact table
SELECT
    invoice_id,
    invoice_number,
    supplier_id,
    department_id,
    invoice_date,
    invoice_amount,
    currency,
    audit_rule_count,
    audit_risk_score,
    audit_risk_level,
    ml_anomaly_flag,
    ml_anomaly_score,
    combined_review_priority_score,
    ml_review_priority
FROM fact_audit_transactions
LIMIT 10;

-- Supplier dimension
SELECT *
FROM dim_suppliers
LIMIT 10;

-- Department dimension
SELECT *
FROM dim_departments
LIMIT 10;

-- Purchase order dimension
SELECT *
FROM dim_purchase_orders
LIMIT 10;
