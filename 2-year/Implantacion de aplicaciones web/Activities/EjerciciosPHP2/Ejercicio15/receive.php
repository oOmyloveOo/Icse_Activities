<!-- recibir.php -->
<?php
include 'includes/header.php';

// Verificar si el formulario fue enviado y procesar los datos
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validar campos
    if (isset($_POST['nombre'], $_POST['apellidos'], $_POST['biografia'], $_POST['email'], $_POST['contraseña'], $_POST['rol'])) {
        $nombre = htmlspecialchars($_POST['nombre']);
        $apellidos = htmlspecialchars($_POST['apellidos']);
        $biografia = htmlspecialchars($_POST['biografia']);
        $email = htmlspecialchars($_POST['email']);
        $contraseña = $_POST['contraseña'];
        $rol = htmlspecialchars($_POST['rol']);

        // Encriptar contraseña
        $contraseña_encriptada = sha1($contraseña); // También puedes usar hash('sha256', $contraseña);

        // Mostrar los datos recibidos
        echo "<h2>Datos recibidos del formulario:</h2>";
        echo "<p><strong>Nombre:</strong> $nombre</p>";
        echo "<p><strong>Apellidos:</strong> $apellidos</p>";
        echo "<p><strong>Biografía:</strong> $biografia</p>";
        echo "<p><strong>Email:</strong> $email</p>";
        echo "<p><strong>Rol:</strong> $rol</p>";
        echo "<p><strong>Contraseña (encriptada):</strong> $contraseña_encriptada</p>";

        // Procesar la imagen si se ha subido
        if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === 0) {
            $imagen = $_FILES['imagen
