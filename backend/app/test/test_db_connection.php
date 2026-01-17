<?php
require_once __DIR__ . '/../config/db.php';

try {
    $pdo->query("SELECT 1");
    echo "Database connection successful";
} catch (Exception $e) {
    echo "Database connection failed";
}
