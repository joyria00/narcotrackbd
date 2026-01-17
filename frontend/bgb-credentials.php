<?php
session_start();
require_once __DIR__ . '/backend/app/config/db.php';

if (!isset($_SESSION['bgb_officer_details'])) {
    header("Location: bgb-officer-details.php");
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
            // ForceID 4 = BGB
            // RoleID 1 = Officer
            $stmtUser = $pdo->prepare("
                INSERT INTO USERS (FullName, Phone, Email, RoleID, ForceID, Status, CreatedAt)
                VALUES (?, ?, ?, 1, 4, 'pending', NOW())
            ");
            $stmtUser->execute([
                $_SESSION['bgb_officer_details']['full_name'],
                $_SESSION['bgb_officer_details']['phone'],
                $_SESSION['bgb_officer_details']['email']
            ]);
            $userId = $pdo->lastInsertId();

            // 2. Insert into USER_CREDENTIALS
            $passwordHash = password_hash($password, PASSWORD_BCRYPT);
            $stmtCred = $pdo->prepare("
                INSERT INTO USER_CREDENTIALS (UserID, Username, PasswordHash, IsActive)
                VALUES (?, ?, ?, 0)
            ");
            $stmtCred->execute([$userId, $username, $passwordHash]);

            // 3. Insert into BGB_DETAILS
            $stmtBgb = $pdo->prepare("
                INSERT INTO BGB_DETAILS (UserID, BadgeNumber, BattalionNumber, Sector, BorderArea)
                VALUES (?, ?, ?, ?, ?)
            ");
            $stmtBgb->execute([
                $userId,
                $_SESSION['bgb_officer_details']['badge_number'],
                $_SESSION['bgb_officer_details']['battalion'],
                $_SESSION['bgb_officer_details']['sector'],
                $_SESSION['bgb_officer_details']['sector'] // BorderArea placeholder
            ]);

            // 4. Insert into USER_DOCUMENTS
            $docs = $_SESSION['bgb_docs'] ?? [];
            $stmtDoc = $pdo->prepare("
                INSERT INTO USER_DOCUMENTS (UserID, DocumentType, FilePath, UploadedAt, VerificationStatus)
                VALUES (?, ?, ?, NOW(), 'pending')
            ");

            if (!empty($docs['id_card'])) {
                $stmtDoc->execute([$userId, 'BGB ID Card', $docs['id_card']]);
            }
            if (!empty($docs['auth_doc'])) {
                $stmtDoc->execute([$userId, 'Authorization Document', $docs['auth_doc']]);
            }

            $pdo->commit();

            // Clear session data
            unset($_SESSION['bgb_officer_details']);
            unset($_SESSION['bgb_role']);
            unset($_SESSION['bgb_docs']);

        header("Location: bgb-pending.php");
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

<!-- CONTENT -->
<main class="login-wrapper">
  <div class="login-card">
    <h2>Create Login Credentials</h2>
    <p class="subtext">
      Set your username and password.  
      Account will be pending admin approval.
    </p>

    <?php if ($error): ?>
        <div style="color: red; margin-bottom: 15px; text-align: center;">
            <?php echo htmlspecialchars($error); ?>
        </div>
    <?php endif; ?>

    <form id="bgbCredentialsForm" method="POST" action="">
      <label>Username</label>
      <input type="text" name="username" id="username" required>
    
      <label>Password</label>
      <input type="password" name="password" id="password" required>
    
      <label>Confirm Password</label>
      <input type="password" name="confirm_password" id="confirmPassword" required>
    
      <button class="btn primary full" type="submit">
        Submit
      </button>
    </form>
  </div>
</main>

<script src="js/bgb-credentials.js"></script>
<?php
$extraScripts = ['js/bgb-credentials.js'];
include 'includes/footer.php';
?>

