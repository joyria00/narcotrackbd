<?php
session_start();
require_once __DIR__ . '/backend/app/config/db.php';

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usernameOrEmail = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_SPECIAL_CHARS);
    $password = $_POST['password'] ?? '';

    if (empty($usernameOrEmail) || empty($password)) {
        $error = "Please enter both username/email and password.";
    } else {
        try {
            // Find user credentials first
            $stmt = $pdo->prepare("
                SELECT uc.UserID, uc.PasswordHash, uc.IsActive, u.FullName, r.RoleName
                FROM USER_CREDENTIALS uc
                JOIN USERS u ON uc.UserID = u.UserID
                JOIN ROLES r ON u.RoleID = r.RoleID
                WHERE uc.Username = ? OR u.Email = ?
            ");
            $stmt->execute([$usernameOrEmail, $usernameOrEmail]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user && password_verify($password, $user['PasswordHash'])) {
                if ($user['IsActive'] == 0) {
                    $error = "Your account is pending approval.";
                } else {
                    // Set session variables
                    $_SESSION['user_id'] = $user['UserID'];
                    $_SESSION['full_name'] = $user['FullName'];
                    $_SESSION['role'] = $user['RoleName'];

                    // Redirect based on role
                    switch (strtolower($user['RoleName'])) {
                        case 'admin':
                            header("Location: admin-dashboard.php");
                            break;
                        case 'analyst':
                            header("Location: analyst-dashboard.php");
                            break;
                        case 'lab officer':
                            header("Location: lab-dashboard.php");
                            break;
                        case 'auditor':
                            header("Location: audit-dashboard.php");
                            break;
                        default:
                            header("Location: officer-dashboard.php");
                    }
                    exit();
                }
            } else {
                $error = "Invalid username or password.";
            }
        } catch (Exception $e) {
            $error = "Error: " . $e->getMessage();
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login | NarcoTrack BD</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<header class="navbar">
    <div class="logo">NarcoTrack BD</div>
    <nav>
        <a href="index.php">Home</a>
    </nav>
</header>

  <!-- LOGIN -->
  <main class="login-wrapper">
    <div class="login-card">
      <h2>Login to Your Account</h2>

      <?php if ($error): ?>
        <div style="color: #ff4d4d; background: #ffe6e6; border: 1px solid #ffcccc; padding: 10px; border-radius: 4px; margin-bottom: 20px; text-align: center; font-size: 14px;">
            <?php echo htmlspecialchars($error); ?>
        </div>
      <?php endif; ?>

      <form id="loginForm" method="POST" action="">

        <label>Email / Username</label>
        <input
          type="text"
          name="username"
          id="username"
          placeholder="Enter your official email or username"
          required
        />

        <label>Password</label>
        <div class="password-box">
          <input
            type="password"
            name="password"
            id="password"
            placeholder="Enter your password"
            required
          />
          <span class="eye" onclick="togglePassword()">👁</span>
        </div>

        <div class="forgot">
          <a href="#">Forgot password?</a>
        </div>

        <button type="submit" class="btn primary full">Login</button>

        <p class="signup-text">
          Don’t have an account?
          <a href="role-select.php">Create one</a>
        </p>

        <p class="signup-text admin-link">
          Admin? <a href="login.php?role=admin">Login here</a>
        </p>

      </form>
    </div>
  </main>

  <?php 
$extraScripts = ['js/login.js'];
include 'includes/footer.php'; 
?>

