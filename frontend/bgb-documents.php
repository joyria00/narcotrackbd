<?php
session_start();

require_once __DIR__ . '/backend/app/helpers/upload_helper.php';

if (!isset($_SESSION['bgb_officer_details'])) {
    header("Location: bgb-officer-details.php");
    exit();
}

$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $idCardPath = handle_registration_upload($_FILES['id_card']);
    $authDocPath = handle_registration_upload($_FILES['auth_doc']);

    if ($idCardPath && $authDocPath) {
        $_SESSION['bgb_docs'] = [
            'id_card' => $idCardPath,
            'auth_doc' => $authDocPath,
        ];

        header("Location: bgb-credentials.php");
        exit();
    } else {
        $error = "Failed to upload documents. Please check file sizes and formats.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BGB Documents | NarcoTrack BD</title>
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

    <form id="bgbDocumentsForm" method="POST" action="" enctype="multipart/form-data">

      <label>BGB ID Card</label>
      <input type="file" name="id_card" required>

      <label>Service Authorization Document</label>
      <input type="file" name="auth_doc" required>

      <button type="submit" class="btn primary full">
        Continue
      </button>

    </form>
  </div>
</main>

<script src="js/bgb-documents.js"></script>
<?php
$extraScripts = ['js/bgb-documents.js'];
include 'includes/footer.php';
?>

