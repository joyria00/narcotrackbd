<?php
session_start();

if (isset($_GET['designation'])) {
    $_SESSION['dnc_designation'] = filter_input(INPUT_GET, 'designation', FILTER_SANITIZE_SPECIAL_CHARS);
    header("Location: dnc-details.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DNC Designation | NarcoTrack BD</title>
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
    <h2>Select DNC Designation</h2>
    <p class="subtext">Choose your official designation</p>

    <div class="role-grid">
      <a href="?designation=Inspector" class="role-box-link" style="text-decoration: none; color: inherit;">
        <div class="role-box">
          <h3>Inspector</h3>
          <p>Investigation & seizures</p>
        </div>
      </a>

      <a href="?designation=Assistant+Director" class="role-box-link" style="text-decoration: none; color: inherit;">
        <div class="role-box">
          <h3>Assistant Director</h3>
          <p>Operations & supervision</p>
        </div>
      </a>

      <a href="?designation=Deputy+Director" class="role-box-link" style="text-decoration: none; color: inherit;">
        <div class="role-box">
          <h3>Deputy Director</h3>
          <p>Regional oversight</p>
        </div>
      </a>

      <a href="?designation=Director" class="role-box-link" style="text-decoration: none; color: inherit;">
        <div class="role-box">
          <h3>Director</h3>
          <p>Strategic authority</p>
        </div>
      </a>
    </div>
  </div>
</main>

<?php
$extraScripts = ['js/dnc-designation.js'];
include 'includes/footer.php';
?>
