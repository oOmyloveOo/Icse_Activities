<?php
require_once 'includes/header.php';
require_once 'includes/footer.php';
require_once 'includes/db/functions.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validar los datos
    $nombre = isset($_POST['nombre']) ? trim($_POST['nombre']) : null;
    $apellidos = isset($_POST['apellidos']) ? trim($_POST['apellidos']) : null;
    $email = isset($_POST['email']) ? trim($_POST['email']) : null;
    $password = isset($_POST['password']) ? trim($_POST['password']) : null;
    $bio = isset($_POST['bio']) ? trim($_POST['bio']) : null;
    $rol = isset($_POST['rol']) ? trim($_POST['rol']) : null;

    $imagen = null;
    if (!empty($_FILES['imagen']['tmp_name'])) {
        $imagen = 'uploads/' . basename($_FILES['imagen']['name']);
        move_uploaded_file($_FILES['imagen']['tmp_name'], $imagen);
    }

    // Insertar el usuario
    $resultado = insertarUsuario($nombre, $apellidos, $email, $password, $bio, $rol, $imagen);

    echo $resultado;
} else {
    echo "Método de solicitud no válido.";
}
?>
