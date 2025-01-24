<?php
require_once 'includes/header.php';
require_once 'includes/functionHTML.php';
require_once 'includes/functions.php';

echo "<main style='padding: 20px; text-align: center;'>";
echo "<h2>Validador de Email</h2>";
echo generarFormularioEmail();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'] ?? '';
    if (validarEmail($email)) {
        echo "<p><strong>$email</strong>: <span style='color: green;'>Email válido.</span></p>";
    } else {
        echo "<p><strong>$email</strong>: <span style='color: red;'>Email inválido.</span></p>";
    }
}

echo "</main>";

require_once 'includes/footer.php';
?>
