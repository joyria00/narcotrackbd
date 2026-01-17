<?php
require_once __DIR__ . '/../config/db.php';

$caseId = 1; // sample input

$sql = "
SELECT 
    c.CaseNumber,
    e.EvidenceID,
    e.DrugType,
    e.Quantity,
    e.Weight,
    e.SealNumber
FROM CASE_FILE c
JOIN EVIDENCE e ON c.CaseID = e.CaseID
WHERE c.CaseID = :caseId
";

$stmt = $pdo->prepare($sql);
$stmt->execute(['caseId' => $caseId]);

$result = $stmt->fetchAll();
print_r($result);
