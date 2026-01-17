<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Coast Guard Registration | NarcoTrack BD</title>
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
    <h2>Coast Guard Verification</h2>
    <p class="subtext">This registration flow is currently under development.</p>
    
    <div style="text-align: center; margin-top: 20px;">
        <a href="select-force.php" class="btn secondary">Back to Agency Selection</a>
    </div>
  </div>
</main>

<?php
include 'includes/footer.php';
?>
