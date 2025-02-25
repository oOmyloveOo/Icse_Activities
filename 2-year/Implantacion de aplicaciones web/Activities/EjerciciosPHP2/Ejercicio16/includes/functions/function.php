<?php
function validarNombre($nombre) {
    // Solo letras, máximo 20 caracteres
    return preg_match('/^[a-zA-ZáéíóúÁÉÍÓÚñÑ]{1,20}$/', $nombre) === 1;
}

function validarApellidos($apellidos) {
    // Solo letras 
    return preg_match('/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{1,}$/', $apellidos) === 1;
}

function validarBiografia($biografia) {
    // No vacío
    return !empty(trim($biografia));
}

function validarEmail($email) {
    // Validación de email
    return filter_var($email, FILTER_VALIDATE_EMAIL) !== false;
}

function validarContraseña($contraseña) {
    // Longitud mayor que 6
    return strlen($contraseña) > 6;
}

function validarImagen($imagen) {
    // La imagen puede estar vacía, si no lo está, verificamos
    if ($imagen['error'] === UPLOAD_ERR_NO_FILE) {
        return true;
    }

    // Verificar si es una imagen
    $tiposPermitidos = ['image/jpeg', 'image/png', 'image/gif'];
    $tamañoMaximo = 5 * 1024 * 1024; // 5MB

    return (
        $imagen['error'] === UPLOAD_ERR_OK &&
        in_array($imagen['type'], $tiposPermitidos) &&
        $imagen['size'] <= $tamañoMaximo
    );
}
?>