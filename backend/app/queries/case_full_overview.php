<?php
require_once __DIR__ . '/../config/db.php';

$sql = "
SELECT 
    c.CaseNumber,
    c.CaseStatus,
    u.FullName AS CreatedBy,
    d.DistrictName,
    t.ThanaName,
    COUNT(e.EvidenceID) AS TotalEvidence
FROM CASE_FILE c
JOIN USERS u ON c.CreatedBy = u.UserID
JOIN CASE_LOCATION cl ON c.CaseID = cl.CaseID
JOIN DISTRICT d ON cl.DistrictID = d.DistrictID
JOIN THANA t ON cl.ThanaID = t.ThanaID
LEFT JOIN EVIDENCE e ON c.CaseID = e.CaseID
GROUP BY c.CaseID
";

$stmt = $pdo->query($sql);
print_r($stmt->fetchAll());
