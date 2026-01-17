<?php
session_start();

require_once __DIR__ . '/backend/app/helpers/upload_helper.php';

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $rabIdPath = handle_registration_upload($_FILES['rab_id']);
    $postingOrderPath = handle_registration_upload($_FILES['posting_order']);
    $parentForceIdPath = isset($_FILES['parent_force_id']) ? handle_registration_upload($_FILES['parent_force_id']) : null;

    if ($rabIdPath && $postingOrderPath) {
        $_SESSION['rab_officer_docs'] = [
            'rab_id'           => $rabIdPath,
            'posting_order'    => $postingOrderPath,
            'parent_force_id'  => $parentForceIdPath,
        ];

        header("Location: rab-step-3.php");
        exit();
    } else {
        $error = "Failed to upload required documents. Please check file sizes and formats.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RAB Document Verification | NarcoTrack BD</title>
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
    <h2>Upload Verification Documents</h2>

    <?php if (isset($error)): ?>
        <div class="alert error" style="background: rgba(220, 53, 69, 0.1); color: #dc3545; padding: 10px; border-radius: 5px; margin-bottom: 20px; border: 1px solid #dc3545;">
            <?php echo $error; ?>
        </div>
    <?php endif; ?>

    <form id="rabStep2" method="POST" action="" enctype="multipart/form-data">
      <label>RAB ID Card</label>
      <input type="file" name="rab_id" required>

      <label>Posting Order</label>
      <input type="file" name="posting_order" required>

      <label>Parent Force ID (Optional)</label>
      <input type="file" name="parent_force_id">

      <button type="submit" class="btn primary full">Proceed</button>
    </form>
  </div>
</main>

<script src="js/rab-step-2.js"></script>
<?php
$extraScripts = ['js/rab-step-2.js'];
include 'includes/footer.php';
?>

