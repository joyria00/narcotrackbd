<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['auditor_details'] = [
        'full_name'    => filter_input(INPUT_POST, 'full_name', FILTER_SANITIZE_SPECIAL_CHARS),
        'designation'  => filter_input(INPUT_POST, 'designation', FILTER_SANITIZE_SPECIAL_CHARS),
        'authority'    => filter_input(INPUT_POST, 'authority', FILTER_SANITIZE_SPECIAL_CHARS),
        'employee_id'  => filter_input(INPUT_POST, 'employee_id', FILTER_SANITIZE_SPECIAL_CHARS),
        'email'        => filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL),
        'phone'        => filter_input(INPUT_POST, 'phone', FILTER_SANITIZE_SPECIAL_CHARS),
    ];

    header("Location: auditor-documents.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Auditor Details | NarcoTrack BD</title>
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

<h2>Auditor Verification</h2>

<form id="auditorDetailsForm" method="POST" action="">
  <label>Full Name</label>
  <input type="text" name="full_name" required />

  <label>Designation</label>
  <select name="designation" required>
    <option value="">Select</option>
    <option>Auditor</option>
    <option>Senior Auditor</option>
    <option>Compliance Officer</option>
  </select>

  <label>Affiliated Authority</label>
  <select name="authority" required>
    <option value="">Select</option>
    <option>DNC Audit Wing</option>
    <option>Police HQ Audit</option>
    <option>Government Oversight Body</option>
  </select>

  <label>Auditor / Employee ID</label>
  <input type="text" name="employee_id" required />

  <label>Official Email</label>
  <input type="email" name="email" required />

  <label>Phone Number</label>
  <input type="tel" name="phone" required />

  <button type="submit" class="btn primary full">Next</button>
</form>
  </div>
</main>

<?php
$extraScripts = ['js/auditor.js'];
include 'includes/footer.php';
?>

