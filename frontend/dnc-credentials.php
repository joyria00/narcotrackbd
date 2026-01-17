<?php
session_start();
require_once __DIR__ . '/backend/app/config/db.php';

if (!isset($_SESSION['dnc_details'])) {
    header("Location: dnc-details.php");
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
            // ForceID 3 = DNC
            // RoleID 1 = Officer
            $stmtUser = $pdo->prepare("
                INSERT INTO USERS (FullName, Phone, Email, RoleID, ForceID, Status, CreatedAt)
                VALUES (?, ?, ?, 1, 3, 'pending', NOW())
            ");
            $stmtUser->execute([
                $_SESSION['dnc_details']['full_name'],
                $_SESSION['dnc_details']['phone'],
                $_SESSION['dnc_details']['email']
            ]);
            $userId = $pdo->lastInsertId();

            // 2. Insert into USER_CREDENTIALS
            $passwordHash = password_hash($password, PASSWORD_BCRYPT);
            $stmtCred = $pdo->prepare("
                INSERT INTO USER_CREDENTIALS (UserID, Username, PasswordHash, IsActive)
                VALUES (?, ?, ?, 0)
            ");
            $stmtCred->execute([$userId, $username, $passwordHash]);

            // 3. Insert into DNC_DETAILS
            $stmtDnc = $pdo->prepare("
                INSERT INTO DNC_DETAILS (UserID, Designation, BadgeNumber, PostingUnit)
                VALUES (?, ?, ?, ?)
            ");
            $stmtDnc->execute([
                $userId,
                $_SESSION['dnc_designation'],
                $_SESSION['dnc_details']['badge_number'],
                $_SESSION['dnc_details']['posting_unit']
            ]);

            // 4. Insert into USER_DOCUMENTS
            $docs = $_SESSION['dnc_docs'] ?? [];
            $stmtDoc = $pdo->prepare("
                INSERT INTO USER_DOCUMENTS (UserID, DocumentType, FilePath, UploadedAt, VerificationStatus)
                VALUES (?, ?, ?, NOW(), 'pending')
            ");

            if (!empty($docs['id_card'])) {
                $stmtDoc->execute([$userId, 'DNC ID Card', $docs['id_card']]);
            }
            if (!empty($docs['auth_letter'])) {
                $stmtDoc->execute([$userId, 'Authorization Letter', $docs['auth_letter']]);
            }

            $pdo->commit();

            // Clear session data
            unset($_SESSION['dnc_details']);
            unset($_SESSION['dnc_designation']);
            unset($_SESSION['dnc_docs']);

            header("Location: dnc-success.php");
            exit();

        } catch (Exception $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
            $error = "Registration failed: " . $e->getMessage();
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

    <form id="credForm" method="POST" action="">
      <label>Username</label>
      <input type="text" name="username" required>

      <label>Password</label>
      <input type="password" name="password" required>

      <label>Confirm Password</label>
      <input type="password" name="confirm_password" required>

      <button type="submit" class="btn primary full">Submit</button>
    </form>
  </div>
</main>

<?php
$extraScripts = ['js/dnc-credentials.js'];
include 'includes/footer.php';
?>

