<!-- recibir1.php -->
<?php
include 'includes/header.php';

// Validar formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $errores = [];

    // Validar nombre
    if (!isset($_POST['nombre']) || empty($_POST['nombre']) || !preg_match("/^[a-zA-Z\s]{1,20}$/", $_POST['nombre'])) {
        $errores[] = "El nombre debe contener solo letras y tener una longitud máxima de 20 caracteres.";
    }

    // Validar apellidos
    if (!isset($_POST['apellidos']) || empty($_POST['apellidos']) || !preg_match("/^[a-zA-Z\s]+$/", $_POST['apellidos'])) {
        $errores[] = "Los apellidos deben contener solo letras.";
    }

    // Validar biografía
    if (!isset($_POST['biografia']) || empty($_POST['biografia'])) {
        $errores[] = "La biografía no puede estar vacía.";
    }

    // Validar email
    if (!isset($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
        $errores[] = "El email debe ser válido.";
    }

    // Validar contraseña
    if (!isset($_POST['contraseña']) || strlen($_POST['contraseña']) <= 6) {
        $errores[] = "La contraseña debe tener más de 6 caracteres.";
    }

    // Procesar si no hay errores
    if (empty($errores)) {
        $nombre = htmlspecialchars($_POST['nombre']);
        $apellidos = htmlspecialchars($_POST['apellidos']);
        $biografia = htmlspecialchars($_POST['biografia']);
        $email = htmlspecialchars($_POST['email']);
        $contraseña = sha1($_POST['contraseña']); // O usar hash('sha256', $contraseña)

        echo "<h2>Datos válidos procesados correctamente:</h2>";
        echo "<p><strong>Nombre:</strong> $nombre</p>";
        echo "<p><strong>Apellidos:</strong> $apellidos</p>";
        echo "<p><strong>Biografía:</strong> $biografia</p>";
        echo "<p><strong>Email:</strong> $email</p>";
        echo "<p><strong>Contraseña (encriptada):</strong> $contraseña</p>";

        // Procesar la imagen si fue cargada
        if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === 0) {
            $imagen = $_FILES['imagen'];
            echo "<p><strong>Imagen cargada:</strong> " . htmlspecialchars($imagen['name']) . "</p>";
        } else {
            echo "<p><strong>No se ha subido ninguna imagen.</strong></p>";
        }
    } else {
        // Mostrar errores
        echo "<h2>Errores encontrados:</h2>";
        echo "<ul>";
        foreach ($errores as $error) {
            echo "<li>$error</li>";
        }
        echo "</ul>";
    }
} else {
    echo "<p>No se ha enviado ningún formulario.</p>";
}

include 'includes/footer.php';
?>
