<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>RAB Role Choice | NarcoTrack BD</title>
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
    <div class="login-card role-card">
  
      <h2>Select Your RAB Role</h2>
      <p class="subtext">
        Only authorized RAB officers can create an account
      </p>
  
      <div class="role-grid">
  
        <a href="rab-step-1.php?role=intelligence" class="role-box-link" style="text-decoration: none; color: inherit;">
          <div class="role-box">
            <h3>Intelligence Officer</h3>
            <p>Handles confidential intelligence, suspects, and routes</p>
          </div>
        </a>
  
        <a href="rab-step-1.php?role=operations" class="role-box-link" style="text-decoration: none; color: inherit;">
          <div class="role-box">
            <h3>Operations Officer</h3>
            <p>Plans and executes raids and arrests</p>
          </div>
        </a>
  
        <a href="rab-step-1.php?role=evidence" class="role-box-link" style="text-decoration: none; color: inherit;">
          <div class="role-box">
            <h3>Evidence Officer</h3>
            <p>Manages seizure records and chain of custody</p>
          </div>
        </a>
  
        <a href="rab-step-1.php?role=command" class="role-box-link" style="text-decoration: none; color: inherit;">
          <div class="role-box">
            <h3>Commanding Officer</h3>
            <p>Approves operations and oversees cases</p>
          </div>
        </a>
  
      </div>
    </div>
  </main>
  
  <?php 
$extraScripts = ['js/rab-roles.js'];
include 'includes/footer.php';
?>
