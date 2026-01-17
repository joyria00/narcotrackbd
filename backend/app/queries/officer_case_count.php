<?php
require_once __DIR__ . '/../config/db.php';

$sql = "
SELECT 
    u.FullName,
    COUNT(c.CaseID) AS TotalCases
FROM USERS u
JOIN CASE_FILE c ON u.UserID = c.CreatedBy
GROUP BY u.UserID
ORDER BY TotalCases DESC
";

$stmt = $pdo->query($sql);
print_r($stmt->fetchAll());
