
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NarcoTrack BD</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<header class="navbar">
    <div class="logo">NarcoTrack BD</div>
    <nav>
        <a href="index.php">Home</a>
    </nav>
</header>

  <!-- HERO SECTION -->
  <main class="hero">
    <div class="overlay"></div>

    <div class="hero-content">
      <h1>NarcoTrack BD</h1>
      <h2>National Drug Trafficking Route Intelligence & Case Automation System</h2>
      <p>
        A unified platform for secure case management, seizure documentation,
        forensic verification, and trafficking route intelligence.
      </p>

      <div class="buttons">
        <!-- LOGIN -->
        <a href="login.php" class="btn primary">Login</a>

        <!-- SIGN UP → ROLE SELECTION -->
        <a href="role-select.php" class="btn secondary">Sign Up</a>
      </div>
      
      <div style="margin-top: 30px;">
        <p style="font-size: 0.9rem; opacity: 0.8;">Special Access:</p>
        <a href="seizure-officer.php" style="color: #fff; text-decoration: underline; font-size: 0.85rem;">Seizure Officer Entry (No account required)</a>
      </div>
    </div>
  </main>

<?php
$extraScripts = ['js/main.js'];
include 'includes/footer.php';
?>