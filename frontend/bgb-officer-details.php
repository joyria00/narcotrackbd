<?php
session_start();

if (!isset($_SESSION['bgb_role'])) {
    header("Location: bgb-category.php");
    exit();
}

$selectedRole = $_SESSION['bgb_role'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $_SESSION['bgb_officer_details'] = [
        'full_name'    => filter_input(INPUT_POST, 'full_name', FILTER_SANITIZE_SPECIAL_CHARS),
        'badge_number' => filter_input(INPUT_POST, 'badge_number', FILTER_SANITIZE_SPECIAL_CHARS),
        'battalion'    => filter_input(INPUT_POST, 'battalion', FILTER_SANITIZE_SPECIAL_CHARS),
        'sector'       => filter_input(INPUT_POST, 'sector', FILTER_SANITIZE_SPECIAL_CHARS),
        'email'        => filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL),
        'phone'        => filter_input(INPUT_POST, 'phone', FILTER_SANITIZE_SPECIAL_CHARS),
    ];

        header("Location: bgb-documents.php");
        exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BGB Verification | NarcoTrack BD</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<header class="navbar">
    <div class="logo">NarcoTrack BD</div>
    <nav>
        <a href="index.php">Home</a>
    </nav>
</header>

  <!-- MAIN CONTENT -->
  <main class="login-wrapper">
    <div class="login-card">
      <h2>BGB Officer Verification</h2>
      <p class="subtext" id="selectedRole"><?php echo htmlspecialchars($selectedRole); ?></p>

      <form id="bgbOfficerForm" method="POST" action="">

        <label>Full Name</label>
        <input type="text" name="full_name" required>

        <label>BGB Force ID / Badge Number</label>
        <input type="text" name="badge_number" required>

        <label>Battalion Number</label>
        <input type="text" name="battalion" required>

        <label>Sector / Border Area</label>
        <input type="text" name="sector" required>

        <label>Official Email</label>
        <input type="email" name="email" required>

        <label>Phone Number</label>
        <input type="tel" name="phone" required>

        <button class="btn primary full" type="submit">Next</button>
      </form>
    </div>
  </main>

  <script src="js/bgb-officer-details.js"></script>
<?php
$extraScripts = ['js/bgb-officer-details.js'];
include 'includes/footer.php';
?>

