<?php
session_start();
require_once __DIR__ . '/backend/app/config/db.php';

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $full_name = filter_input(INPUT_POST, 'full_name', FILTER_SANITIZE_SPECIAL_CHARS);
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
    $phone = filter_input(INPUT_POST, 'phone', FILTER_SANITIZE_SPECIAL_CHARS);
    $department = filter_input(INPUT_POST, 'department', FILTER_SANITIZE_SPECIAL_CHARS);
    $analyst_code = filter_input(INPUT_POST, 'analyst_code', FILTER_SANITIZE_SPECIAL_CHARS);
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_SPECIAL_CHARS);
    $password = $_POST['password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';

    if ($password !== $confirm_password) {
        $error = "Passwords do not match.";
    } elseif (empty($full_name) || empty($email) || empty($username) || empty($password)) {
        $error = "Please fill in all required fields.";
    } else {
        try {
            $pdo->beginTransaction();

            // 1. Insert into USERS
            // RoleID 2 = Analyst
            // ForceID 7 = Administrative Authority (Default for specialized roles)
            $stmtUser = $pdo->prepare("
                INSERT INTO USERS (FullName, Phone, Email, RoleID, ForceID, Status, CreatedAt)
                VALUES (?, ?, ?, 2, 7, 'pending', NOW())
            ");
            $stmtUser->execute([$full_name, $phone, $email]);
            $userId = $pdo->lastInsertId();

            // 2. Insert into USER_CREDENTIALS
            $passwordHash = password_hash($password, PASSWORD_BCRYPT);
            $stmtCred = $pdo->prepare("
                INSERT INTO USER_CREDENTIALS (UserID, Username, PasswordHash, IsActive)
                VALUES (?, ?, ?, 0)
            ");
            $stmtCred->execute([$userId, $username, $passwordHash]);

            // 3. Insert into ANALYST_DETAILS
            $stmtAnalyst = $pdo->prepare("
                INSERT INTO ANALYST_DETAILS (UserID, AnalystCode)
                VALUES (?, ?)
            ");
            $stmtAnalyst->execute([$userId, $analyst_code]);

            $pdo->commit();

            header("Location: analyst-success.php");
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
    <title>Analyst Sign Up | NarcoTrack BD</title>
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
      <h2>Create Analyst Account</h2>

      <?php if ($error): ?>
          <div style="color: red; margin-bottom: 15px; text-align: center;">
              <?php echo htmlspecialchars($error); ?>
          </div>
      <?php endif; ?>

      <form id="analystSignupForm" method="POST" action="">

        <label>Role</label>
        <input type="text" value="Analyst" readonly>

        <label>Department</label>
        <select name="department" required>
          <option value="">Select Department</option>
          <option value="dnc-intel">DNC Intelligence Wing</option>
          <option value="police-intel">Police Intelligence Branch</option>
          <option value="narcotics-analysis">National Narcotics Analysis Cell</option>
        </select>

        <label>Analyst ID</label>
        <input type="text" name="analyst_code" placeholder="ANA-XXXX" required>

        <label>Full Name</label>
        <input type="text" name="full_name" placeholder="Enter full name" required>

        <label>Official Email</label>
        <input type="email" name="email" placeholder="name@gov.bd" required>

        <label>Official Phone</label>
        <input type="tel" name="phone" placeholder="01XXXXXXXXX" required>

        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Confirm Password</label>
        <input type="password" name="confirm_password" required>

        <button type="submit" class="btn primary full">Create Analyst Account</button>

        <p class="signup-text">
          Already have an account?
          <a href="login.php">Login</a>
        </p>

      </form>
    </div>
  </main>

  <script src="js/analyst-signup.js"></script>
<?php
$extraScripts = ['js/analyst-signup.js'];
include 'includes/footer.php';
?>

