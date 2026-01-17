<?php
session_start();

require_once __DIR__ . '/backend/app/helpers/upload_helper.php';

if (!isset($_SESSION['auditor_details'])) {
    header("Location: auditor-details.php");
    exit();
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $authLetterPath = handle_registration_upload($_FILES['auth_letter']);
    $idCardPath = isset($_FILES['id_card']) ? handle_registration_upload($_FILES['id_card']) : null;

    if ($authLetterPath) {
        $_SESSION['auditor_docs'] = [
            'auth_letter' => $authLetterPath,
            'id_card' => $idCardPath,
        ];

        header("Location: auditor-credentials.php");
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
    <title>Upload Documents | NarcoTrack BD</title>
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

    <form id="auditorDocsForm" method="POST" action="" enctype="multipart/form-data">
      <label>Appointment / Authorization Letter</label>
      <input type="file" name="auth_letter" required />

      <label>Official ID Card</label>
      <input type="file" name="id_card" />

      <button type="submit" class="btn primary full">Next</button>
    </form>
  </div>
</main>

<script src="js/auditor.js"></script>
<?php
include 'includes/footer.php';
?>

