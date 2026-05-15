
-- ============================================================
-- Supplier Risk Queries
-- ============================================================

-- Top supplier audit priorities
SELECT *
FROM vw_supplier_audit_priorities
LIMIT 20;

-- High-risk suppliers
SELECT
    supplier_id,
    supplier_name,
    supplier_category,
    supplier_country,
    Invoice_Count,
    Total_Invoice_Amount,
    supplier_risk_score,
    supplier_risk_level,
    primary_supplier_risk_driver
FROM supplier_risk_summary
WHERE supplier_risk_level = 'High Supplier Risk'
ORDER BY supplier_risk_score DESC;

-- Suppliers by ML anomaly count
SELECT
    supplier_id,
    supplier_name,
    supplier_category,
    supplier_country,
    Invoice_Count,
    Anomaly_Count,
    Anomaly_Rate,
    Average_Anomaly_Score
FROM supplier_anomaly_summary
ORDER BY Anomaly_Count DESC
LIMIT 20;
