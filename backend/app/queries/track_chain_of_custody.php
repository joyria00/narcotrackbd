<?php
require_once __DIR__ . '/../config/db.php';

$evidenceId = 1;

$sql = "
SELECT 
    coc.TransferTime,
    u1.FullName AS FromOfficer,
    u2.FullName AS ToOfficer,
    coc.Location
FROM CHAIN_OF_CUSTODY coc
JOIN USERS u1 ON coc.FromUser = u1.UserID
JOIN USERS u2 ON coc.ToUser = u2.UserID
WHERE coc.EvidenceID = :evidenceId
ORDER BY coc.TransferTime
";

$stmt = $pdo->prepare($sql);
$stmt->execute(['evidenceId' => $evidenceId]);

print_r($stmt->fetchAll());
