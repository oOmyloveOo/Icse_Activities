<?php
require_once 'includes/header.php';
require_once 'includes/functions/function.php';

// Array para almacenar errores
$errores = [];

// Procesar formulario si es POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Limpiar y validar cada campo
    $nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : '';
    $apellidos = isset($_POST['apellidos']) ? trim($_POST['apellidos']) : '';
    $biografia = isset($_POST['biografia']) ? trim($_POST['biografia']) : '';
    $email = isset($_POST['email']) ? trim($_POST['email']) : '';
    $contraseña = isset($_POST['contraseña']) ? $_POST['contraseña'] : '';
    $rol = isset($_POST['rol']) ? $_POST['rol'] : '';
    $imagen = isset($_FILES['imagen']) ? $_FILES['imagen'] : ['error' => UPLOAD_ERR_NO_FILE];

    // Validaciones
    if (!validarNombre($nombre)) {
        $errores[] = "Nombre inválido. Solo letras, máximo 20 caracteres.";
    }

    if (!validarApellidos($apellidos)) {
        $errores[] = "Apellidos inválidos. Solo letras permitidas.";
    }

    if (!validarBiografia($biografia)) {
        $errores[] = "Biografía no puede estar vacía.";
    }

    if (!validarEmail($email)) {
        $errores[] = "Email inválido.";
    }

    if (!validarContraseña($contraseña)) {
        $errores[] = "Contraseña debe tener más de 6 caracteres.";
    }

    if (!validarImagen($imagen)) {
        $errores[] = "Imagen inválida. Formatos permitidos: JPG, PNG, GIF. Máximo 5MB.";
    }

    // Si hay errores, redirigir de vuelta al formulario con los errores
    if (!empty($errores)) {
        // Guardar errores en sesión
        session_start();
        $_SESSION['errores'] = $errores;
        $_SESSION['datos_previos'] = $_POST;
        
        // Redirigir al formulario
        header("Location: form.php");
        exit();
    }

    // Si no hay errores, procesar datos (similar al script anterior)
    $contraseña_hash = sha1($contraseña);

    // Mostrar datos procesados
    echo "<div class='container'>";
    echo "<h2>Datos Procesados</h2>";
    echo "<table class='table'>";
    echo "<tr><th>Campo</th><th>Valor</th></tr>";
    echo "<tr><td>Nombre</td><td>$nombre</td></tr>";
    echo "<tr><td>Apellidos</td><td>$apellidos</td></tr>";
    echo "<tr><td>Biografía</td><td>$biografia</td></tr>";
    echo "<tr><td>Email</td><td>$email</td></tr>";
    echo "<tr><td>Rol</td><td>$rol</td></tr>";
    echo "<tr><td>Contraseña (Hash)</td><td>$contraseña_hash</td></tr>";
    echo "</table>";
    echo "</div>";
}
else {
    echo "<p>Acceso no autorizado.</p>";
}

require_once 'includes/footer.php';
?>