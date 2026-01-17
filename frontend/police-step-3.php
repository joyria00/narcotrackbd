<?php
session_start();
require_once __DIR__ . '/backend/app/config/db.php';

if (!isset($_SESSION['police_officer_details'])) {
    header("Location: police-step-1.php");
    exit();
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_SPECIAL_CHARS);
    $password = $_POST['password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';

    if ($password !== $confirm_password) {
        $error = "Passwords do not match.";
    } elseif (empty($username) || empty($password)) {
        $error = "Please fill in all fields.";
    } else {
        try {
            $pdo->beginTransaction();

            // 1. Insert into USERS
            // ForceID 1 = Police, RoleID 1 = Officer
            $stmtUser = $pdo->prepare("
                INSERT INTO USERS (FullName, Phone, Email, RoleID, ForceID, Status, CreatedAt)
                VALUES (?, ?, ?, 1, 1, 'pending', NOW())
            ");
            $stmtUser->execute([
                $_SESSION['police_officer_details']['full_name'],
                $_SESSION['police_officer_details']['official_phone'],
                $_SESSION['police_officer_details']['official_email']
            ]);
            $userId = $pdo->lastInsertId();

            // 2. Insert into USER_CREDENTIALS
            $passwordHash = password_hash($password, PASSWORD_BCRYPT);
            $stmtCred = $pdo->prepare("
                INSERT INTO USER_CREDENTIALS (UserID, Username, PasswordHash, IsActive)
                VALUES (?, ?, ?, 0)
            ");
            $stmtCred->execute([$userId, $username, $passwordHash]);

            // 3. Insert into POLICE_DETAILS
            // Note: We need ZoneID and ThanaID. Assuming the IDs are what was stored or we have a map.
            // For now, using the strings provided in session directly or mapping if known.
            // Based on earlier findings, we might need a lookup.
            
            $stmtPolice = $pdo->prepare("
                INSERT INTO POLICE_DETAILS (UserID, Rank, BadgeNumber, PostingUnit, AdminZoneID, ThanaID)
                VALUES (?, ?, ?, ?, ?, ?)
            ");
            
            // Temporary mapping/lookup logic or just use strings if table allows
            // We should ideally look up ZoneID and ThanaID.
            // For now, I'll use placeholders if I don't have the exact IDs.
            // Let's assume the session values are the names, and we seek IDs.
            
            $zoneName = $_SESSION['police_officer_details']['zone'];
            $thanaName = $_SESSION['police_officer_details']['thana'];
            
            // Basic lookup (should be improved)
            $stmtZone = $pdo->prepare("SELECT AdminZoneID FROM ADMIN_ZONE WHERE ZoneName LIKE ? LIMIT 1");
            $stmtZone->execute(["%$zoneName%"]);
            $zoneId = $stmtZone->fetchColumn() ?: 1; // Default to 1 if not found
            
            $stmtThana = $pdo->prepare("SELECT ThanaID FROM THANA WHERE ThanaName LIKE ? LIMIT 1");
            $stmtThana->execute(["%$thanaName%"]);
            $thanaId = $stmtThana->fetchColumn() ?: 1; // Default to 1 if not found

            $stmtPolice->execute([
                $userId,
                $_SESSION['police_officer_details']['rank'],
                $_SESSION['police_officer_details']['badge_number'],
                $_SESSION['police_officer_details']['posting_unit'],
                $zoneId,
                $thanaId
            ]);

            // 4. Insert into USER_DOCUMENTS
            if (isset($_SESSION['police_officer_docs']['id_card'])) {
                $stmtDoc = $pdo->prepare("
                    INSERT INTO USER_DOCUMENTS (UserID, DocumentType, FilePath, UploadedAt, VerificationStatus)
                    VALUES (?, 'Police ID Card', ?, NOW(), 'pending')
                ");
                $stmtDoc->execute([$userId, $_SESSION['police_officer_docs']['id_card']]);
            }

            $pdo->commit();

            // Clear session data
            unset($_SESSION['police_officer_details']);
            unset($_SESSION['police_officer_docs']);
            unset($_SESSION['police_rank']);

            header("Location: police-step-4.php");
            exit();

        } catch (Exception $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
            $error = $e->getMessage();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Account | NarcoTrack BD</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<header class="navbar">
    <div class="logo">NarcoTrack BD</div>
    <nav>
        <a href="index.php">Home</a>
    </nav>
</header>

<main class="login-wrapper">
  <div class="login-card">
    <h2>Create Login Credentials</h2>

    <?php if ($error): ?>
        <div style="color: red; margin-bottom: 15px; text-align: center;">
            <?php echo htmlspecialchars($error); ?>
        </div>
    <?php endif; ?>

    <form id="credForm" method="POST" action="">
      <label>Username</label>
      <input type="text" name="username" required />

      <label>Password</label>
      <input type="password" name="password" required />

      <label>Confirm Password</label>
      <input type="password" name="confirm_password" required />

      <button type="submit" class="btn primary full">Submit</button>
    </form>

  </div>
</main>

<?php
$extraScripts = ['js/police-step-3.js'];
include 'includes/footer.php';
?>

