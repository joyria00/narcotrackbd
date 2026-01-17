<?php
session_start();

if (isset($_GET['rank'])) {
    $_SESSION['police_rank'] = filter_input(INPUT_GET, 'rank', FILTER_SANITIZE_SPECIAL_CHARS);
    header("Location: police-step-1.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Select Rank | NarcoTrack BD</title>
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
    <h2>Select Your Rank</h2>

    <div class="role-grid">
      <a href="?rank=ASI" class="role-box-link" style="text-decoration: none; color: inherit;"><div class="role-box">ASI</div></a>
      <a href="?rank=SI" class="role-box-link" style="text-decoration: none; color: inherit;"><div class="role-box">SI</div></a>
      <a href="?rank=Inspector" class="role-box-link" style="text-decoration: none; color: inherit;"><div class="role-box">Inspector</div></a>
      <a href="?rank=ASP" class="role-box-link" style="text-decoration: none; color: inherit;"><div class="role-box">ASP</div></a>
      <a href="?rank=SP" class="role-box-link" style="text-decoration: none; color: inherit;"><div class="role-box">SP</div></a>
      <a href="?rank=DIG" class="role-box-link" style="text-decoration: none; color: inherit;"><div class="role-box">DIG</div></a>
    </div>
  </div>
</main>


<?php 
$extraScripts = ['js/rank-select-police.js'];
include 'includes/footer.php';
?>
