<?php
require_once 'includes/functions.php';

// Pruebas de la función validarEmail
$emails = [
    "usuario@dominio.com",
    "usuario@dominio",
    "usuario@@dominio.com",
    "@dominio.com",
    "usuario@dominio.co.uk",
    "usuario.dominio.com"
];

echo "<h1>Pruebas de Validación de Emails</h1>";
foreach ($emails as $email) {
    if (validarEmail($email)) {
        echo "<p><strong>$email</strong>: <span style='color: green;'>Válido</span></p>";
    } else {
        echo "<p><strong>$email</strong>: <span style='color: red;'>Inválido</span></p>";
    }
}
?>
