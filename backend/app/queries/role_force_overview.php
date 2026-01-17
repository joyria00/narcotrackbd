<?php
require_once __DIR__ . '/../config/db.php';

$sql = "
SELECT
    r.RoleID,
    r.RoleName,
    f.ForceName,
    rf.RankName,
    rf.CanCreateAccount
FROM ROLE_FORCE rf
JOIN ROLES r
    ON rf.RoleID = r.RoleID
JOIN FORCES f
    ON rf.ForceID = f.ForceID
ORDER BY
    r.RoleID,
    f.ForceName,
    rf.RankName
";

$stmt = $pdo->prepare($sql);
$stmt->execute();

$results = $stmt->fetchAll();

echo '<pre>';
print_r($results);
echo '</pre>';
