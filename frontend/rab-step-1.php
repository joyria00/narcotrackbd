<?php
session_start();

if (isset($_GET['role'])) {
    $_SESSION['rab_selected_role'] = filter_input(INPUT_GET, 'role', FILTER_SANITIZE_SPECIAL_CHARS);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize and Store in Session
    $_SESSION['rab_officer_details'] = [
        'full_name'      => filter_input(INPUT_POST, 'full_name', FILTER_SANITIZE_SPECIAL_CHARS),
        'rank'           => filter_input(INPUT_POST, 'rank', FILTER_SANITIZE_SPECIAL_CHARS),
        'badge_number'   => filter_input(INPUT_POST, 'badge_number', FILTER_SANITIZE_SPECIAL_CHARS),
        'parent_force'   => filter_input(INPUT_POST, 'parent_force', FILTER_SANITIZE_SPECIAL_CHARS),
        'service_no'     => filter_input(INPUT_POST, 'service_no', FILTER_SANITIZE_SPECIAL_CHARS),
        'battalion'      => filter_input(INPUT_POST, 'battalion', FILTER_SANITIZE_SPECIAL_CHARS),
        'wing_unit'      => filter_input(INPUT_POST, 'wing_unit', FILTER_SANITIZE_SPECIAL_CHARS),
        'posting_area'   => filter_input(INPUT_POST, 'posting_area', FILTER_SANITIZE_SPECIAL_CHARS),
        'official_email' => filter_input(INPUT_POST, 'official_email', FILTER_SANITIZE_EMAIL),
        'official_phone' => filter_input(INPUT_POST, 'official_phone', FILTER_SANITIZE_SPECIAL_CHARS),
    ];

    header("Location: rab-step-2.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RAB Verification | NarcoTrack BD</title>
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
  <div class="login-card" style="width:520px">
    <h2>RAB Officer Verification</h2>

    <form id="rabStep1" method="POST" action="">
      <label>Full Name</label>
      <input name="full_name" required>

      <label>Rank</label>
      <input name="rank" required>

      <label>RAB Badge / Force ID</label>
      <input name="badge_number" required>

      <label>Parent Force</label>
      <select name="parent_force" required>
        <option>Police</option>
        <option>Army</option>
        <option>Navy</option>
        <option>Air Force</option>
      </select>

      <label>Parent Force Service No</label>
      <input name="service_no" required>

      <label>RAB Battalion</label>
      <input name="battalion" placeholder="e.g. RAB-3" required>

      <label>Wing / Unit</label>
      <input name="wing_unit" placeholder="Intelligence / Ops / Evidence" value="<?php echo isset($_SESSION['rab_selected_role']) ? ucfirst($_SESSION['rab_selected_role']) : ''; ?>">

      <label>Posting Area</label>
      <input name="posting_area">

      <label>Official Email</label>
      <input name="official_email" type="email" required>

      <label>Official Phone</label>
      <input name="official_phone" required>

      <button type="submit" class="btn primary full">Continue</button>
    </form>
  </div>
</main>

<?php
$extraScripts = ['js/rab-step-1.js'];
include 'includes/footer.php';
?>

