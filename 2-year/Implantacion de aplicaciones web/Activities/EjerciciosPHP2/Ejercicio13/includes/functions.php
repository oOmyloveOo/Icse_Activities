<?php
// Función para validar un email
function validarEmail($email) {
    if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
        return true; // Email válido
    } else {
        return false; // Email inválido
    }
}
?>
