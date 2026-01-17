<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration Successful | NarcoTrack BD</title>
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
      <h2>Account Pending Approval</h2>

      <p class="subtext">
        Your Analyst account has been submitted successfully.
        <br><br>
        Your application is now under review by the Narcotic Control Administration.
        Access will be granted once your identity is verified.
      </p>

      <div style="margin-top: 20px; text-align: center;">
        <a href="index.php" class="btn secondary">Back to Home</a>
      </div>
    </div>
  </main>
<?php
include 'includes/footer.php';
?>

