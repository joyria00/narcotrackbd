<?php
session_start();

if (isset($_GET['role'])) {
    $_SESSION['bgb_role'] = filter_input(INPUT_GET, 'role', FILTER_SANITIZE_SPECIAL_CHARS);
    header("Location: bgb-officer-details.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BGB Category | NarcoTrack BD</title>
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
  <div class="login-card role-card">
    <h2>Select Your BGB Designation</h2>
    <p class="subtext">Authorized BGB officers only</p>

    <div class="role-grid">

      <a href="?role=Field+Intelligence+Officer" class="role-box-link" style="text-decoration: none; color: inherit;">
        <div class="role-box">
          <h3>Field Intelligence Officer</h3>
          <p>Border seizure & intelligence reporting</p>
        </div>
      </a>

      <a href="?role=Operations+Officer" class="role-box-link" style="text-decoration: none; color: inherit;">
        <div class="role-box">
          <h3>Operations Officer</h3>
          <p>Patrol operations & seizure validation</p>
        </div>
      </a>

      <a href="?role=Battalion+Commander" class="role-box-link" style="text-decoration: none; color: inherit;">
        <div class="role-box">
          <h3>Battalion Commander</h3>
          <p>Sector oversight & analytics approval</p>
        </div>
      </a>

    </div>
  </div>
</main>

<?php
$extraScripts = ['js/bgb-category.js'];
include 'includes/footer.php';
?>
