<?php
require_once __DIR__ . '/../config/db.php';

/*
=================================================
Query 1: Document Verification Audit Trail
=================================================
Shows:
- User name
- Document type
- Verification status
- Verifying officer
- Verification time
*/

$query1 = "
SELECT
    u.FullName AS UserName,
    ud.DocumentType,
    ud.VerificationStatus,
    v.FullName AS VerifiedBy,
    ud.VerifiedAt
FROM USER_DOCUMENTS ud
JOIN USERS u
    ON ud.UserID = u.UserID
LEFT JOIN USERS v
    ON ud.VerifiedBy = v.UserID
ORDER BY ud.VerifiedAt DESC
";

$stmt1 = $pdo->query($query1);
$documentAudit = $stmt1->fetchAll();

/*
=================================================
Query 2: Fully Verified Active Users
=================================================
Logic:
- User must be active
- User must have credentials
- User must NOT have any unverified documents
  (NULL or not equal to 'Verified')
*/

$query2 = "
SELECT
    u.UserID,
    u.FullName,
    u.Email,
    uc.Username
FROM USERS u
JOIN USER_CREDENTIALS uc
    ON u.UserID = uc.UserID
WHERE uc.IsActive = 1
AND NOT EXISTS (
    SELECT 1
    FROM USER_DOCUMENTS ud
    WHERE ud.UserID = u.UserID
      AND (
            ud.VerificationStatus IS NULL
            OR ud.VerificationStatus != 'Verified'
          )
)
";

$stmt2 = $pdo->query($query2);
$verifiedUsers = $stmt2->fetchAll();

/*
=================================================
Temporary Output (for testing)
=================================================
You can later replace this with frontend rendering
*/

echo "<h2>Document Verification Audit</h2><pre>";
print_r($documentAudit);
echo "</pre>";

echo "<h2>Fully Verified Active Users</h2><pre>";
print_r($verifiedUsers);
echo "</pre>";
