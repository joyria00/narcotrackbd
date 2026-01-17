<?php
require_once __DIR__ . '/../config/db.php';

$sql = "
SELECT
    r.RoleName,
    f.ForceName,
    rf.RankName,
    rf.CanCreateAccount,
    GROUP_CONCAT(
        p.PermissionCode
        ORDER BY p.PermissionCode
        SEPARATOR ', '
    ) AS Permissions
FROM ROLE_FORCE rf
JOIN ROLES r
    ON rf.RoleID = r.RoleID
JOIN FORCES f
    ON rf.ForceID = f.ForceID
JOIN ROLE_PERMISSIONS rp
    ON rf.RoleForceID = rp.RoleForceID
JOIN PERMISSIONS p
    ON rp.PermissionID = p.PermissionID
GROUP BY
    r.RoleName,
    f.ForceName,
    rf.RankName,
    rf.CanCreateAccount
ORDER BY
    r.RoleID,
    f.ForceName,
    rf.RankName
";

$stmt = $pdo->prepare($sql);
$stmt->execute();

$result = $stmt->fetchAll();

header('Content-Type: application/json');
echo json_encode($result, JSON_PRETTY_PRINT);
