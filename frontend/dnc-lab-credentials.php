<?php
session_start();
require_once __DIR__ . '/backend/app/config/db.php';

if (!isset($_SESSION['dnc_lab_details'])) {
    header("Location: dnc-lab-details.php");
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
            // RoleID 3 = Lab Officer
            $stmtUser = $pdo->prepare("
                INSERT INTO USERS (FullName, Phone, Email, RoleID, ForceID, Status, CreatedAt)
                VALUES (?, ?, ?, 3, 3, 'pending', NOW())
            ");
            $stmtUser->execute([
                $_SESSION['dnc_lab_details']['full_name'],
                $_SESSION['dnc_lab_details']['phone'],
                $_SESSION['dnc_lab_details']['email']
            ]);
            $userId = $pdo->lastInsertId();

            // 2. Insert into USER_CREDENTIALS
            $passwordHash = password_hash($password, PASSWORD_BCRYPT);
            $stmtCred = $pdo->prepare("
                INSERT INTO USER_CREDENTIALS (UserID, Username, PasswordHash, IsActive)
                VALUES (?, ?, ?, 0)
            ");
            $stmtCred->execute([$userId, $username, $passwordHash]);

            // 3. Insert into LAB_OFFICER_DETAILS
            // Look up CityID
            $cityStr = $_SESSION['dnc_lab_details']['posting_city'];
            $stmtCity = $pdo->prepare("SELECT DistrictID FROM DISTRICT WHERE DistrictName LIKE ? LIMIT 1");
            $stmtCity->execute(["%$cityStr%"]);
            $cityId = $stmtCity->fetchColumn() ?: 1;

            $stmtLab = $pdo->prepare("
                INSERT INTO LAB_OFFICER_DETAILS (UserID, LabName, PostingCityID)
                VALUES (?, ?, ?)
            ");
            $stmtLab->execute([
                $userId,
                $_SESSION['dnc_lab_details']['lab_name'],
                $cityId
            ]);

            // 4. Insert into USER_DOCUMENTS
            $docs = $_SESSION['dnc_lab_docs'] ?? [];
            $stmtDoc = $pdo->prepare("
                INSERT INTO USER_DOCUMENTS (UserID, DocumentType, FilePath, UploadedAt, VerificationStatus)
                VALUES (?, ?, ?, NOW(), 'pending')
            ");

            if (!empty($docs['id_card'])) {
                $stmtDoc->execute([$userId, 'DNC Lab ID Card', $docs['id_card']]);
            }
            if (!empty($docs['posting_letter'])) {
                $stmtDoc->execute([$userId, 'Posting Letter', $docs['posting_letter']]);
            }

            $pdo->commit();

            // Clear session data
            unset($_SESSION['dnc_lab_details']);
            unset($_SESSION['dnc_lab_docs']);

            header("Location: dnc-success.php");
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

    <form id="labCredentialsForm" method="POST" action="">

      <label>Username</label>
      <input type="text" name="username" required>

      <label>Password</label>
      <input type="password" name="password" required>

      <label>Confirm Password</label>
      <input type="password" name="confirm_password" required>

      <button class="btn primary full" type="submit">Submit</button>

    </form>
  </div>
</main>

<?php
$extraScripts = ['js/dnc-lab-credentials.js'];
include 'includes/footer.php';
?>

