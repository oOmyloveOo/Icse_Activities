<?php
require_once 'includes/db/function.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitizar entradas
    $nombre = filter_var($_POST['nombre'] ?? '', FILTER_SANITIZE_STRING);
    $apellidos = filter_var($_POST['apellidos'] ?? '', FILTER_SANITIZE_STRING);
    $bio = filter_var($_POST['bio'] ?? '', FILTER_SANITIZE_STRING);
    $email = filter_var($_POST['email'] ?? '', FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'] ?? '';
    $rol = filter_var($_POST['rol'] ?? 'user', FILTER_SANITIZE_STRING);
    $imagen = null;

    // Procesar la imagen si existe
    if (!empty($_FILES['imagen']['tmp_name'])) {
        $upload_dir = 'uploads/';
        
        // Crear el directorio si no existe
        if (!file_exists($upload_dir)) {
            mkdir($upload_dir, 0777, true);
        }

        // Generar nombre único para la imagen
        $imagen_nombre = uniqid() . '_' . basename($_FILES['imagen']['name']);
        $imagen_ruta = $upload_dir . $imagen_nombre;

        // Validar tipo de archivo
        $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
        if (in_array($_FILES['imagen']['type'], $allowed_types)) {
            if (move_uploaded_file($_FILES['imagen']['tmp_name'], $imagen_ruta)) {
                $imagen = $imagen_ruta;
            }
        }
    }

    // Insertar el usuario
    $resultado = insertarUsuario($nombre, $apellidos, $bio, $email, $password, $rol, $imagen);

    // Mostrar resultado
    if ($resultado['status'] === 'success') {
        echo '<div style="color: green; padding: 10px; border: 1px solid green; margin: 10px;">';
        echo $resultado['message'];
        echo '</div>';
    } else {
        echo '<div style="color: red; padding: 10px; border: 1px solid red; margin: 10px;">';
        echo $resultado['message'];
        echo '</div>';
    }
} else {
    echo "Método no permitido.";
}