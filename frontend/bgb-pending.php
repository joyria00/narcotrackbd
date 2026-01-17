<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Approval Pending | NarcoTrack BD</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<header class="navbar">
    <div class="logo">NarcoTrack BD</div>
    <nav>
        <a href="index.php">Home</a>
    </nav>
</header>

  <!-- PENDING PAGE -->
  <main class="login-wrapper">
    <div class="login-card">
      <h2>Account Pending Approval</h2>

      <p style="margin-top: 15px; font-size: 14px; opacity: 0.85; line-height: 1.6;">
        Your <strong>BGB officer account</strong> has been submitted successfully.
        <br /><br />
        Please wait while a system administrator verifies your credentials and documents.
        You will be notified once your account is approved.
      </p>

      <p style="margin-top: 25px; font-size: 13px; opacity: 0.65;">
        Status: <strong>Pending Verification</strong>
      </p>

      <div style="margin-top: 20px; text-align: center;">
        <a href="index.php" class="btn secondary">Back to Home</a>
      </div>
    </div>
  </main>
<?php
include 'includes/footer.php';
?>

