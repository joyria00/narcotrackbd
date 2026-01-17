<?php
session_start();
require_once __DIR__ . '/backend/app/config/db.php';

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
            // ForceID 2 = RAB, RoleID 1 = Officer
            $stmtUser = $pdo->prepare("
                INSERT INTO USERS (FullName, Phone, Email, RoleID, ForceID, Status, CreatedAt)
                VALUES (?, ?, ?, 1, 2, 'pending', NOW())
            ");
            $stmtUser->execute([
                $_SESSION['rab_officer_details']['full_name'],
                $_SESSION['rab_officer_details']['official_phone'],
                $_SESSION['rab_officer_details']['official_email']
            ]);
            $userId = $pdo->lastInsertId();

            // 2. Insert into USER_CREDENTIALS
            $passwordHash = password_hash($password, PASSWORD_BCRYPT);
            $stmtCred = $pdo->prepare("
                INSERT INTO USER_CREDENTIALS (UserID, Username, PasswordHash, IsActive)
                VALUES (?, ?, ?, 0)
            ");
            $stmtCred->execute([$userId, $username, $passwordHash]);

            // 3. Insert into RAB_DETAILS
            $stmtRab = $pdo->prepare("
                INSERT INTO RAB_DETAILS (UserID, RankName, RabBadgeNumber, Battalion, Wing)
                VALUES (?, ?, ?, ?, ?)
            ");
            $stmtRab->execute([
                $userId,
                $_SESSION['rab_officer_details']['rank'],
                $_SESSION['rab_officer_details']['badge_number'],
                $_SESSION['rab_officer_details']['battalion'],
                $_SESSION['rab_selected_role'] ?? $_SESSION['rab_officer_details']['wing_unit']
            ]);

            // 4. Insert into USER_DOCUMENTS
            $docs = $_SESSION['rab_officer_docs'] ?? [];
            $stmtDoc = $pdo->prepare("
                INSERT INTO USER_DOCUMENTS (UserID, DocumentType, FilePath, UploadedAt, VerificationStatus)
                VALUES (?, ?, ?, NOW(), 'pending')
            ");

            if (!empty($docs['rab_id'])) {
                $stmtDoc->execute([$userId, 'RAB ID Card', $docs['rab_id']]);
            }
            if (!empty($docs['posting_order'])) {
                $stmtDoc->execute([$userId, 'Posting Order', $docs['posting_order']]);
            }
            if (!empty($docs['parent_force_id'])) {
                $stmtDoc->execute([$userId, 'Parent Force ID', $docs['parent_force_id']]);
            }

            $pdo->commit();

            // Clear session data after successful registration
            unset($_SESSION['rab_officer_details']);
            header("Location: rab-step-4.php");
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
    <title>Create Credentials | NarcoTrack BD</title>
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

    <form id="rabStep3" method="POST" action="">
      <label>Username</label>
      <input name="username" required>

      <label>Password</label>
      <input name="password" type="password" required>

      <label>Confirm Password</label>
      <input name="confirm_password" type="password" required>

      <button type="submit" class="btn primary full">Submit</button>
    </form>
  </div>
</main>

<script src="js/rab-step-3.js"></script>
<?php
$extraScripts = ['js/rab-step-3.js'];
include 'includes/footer.php';
?>

