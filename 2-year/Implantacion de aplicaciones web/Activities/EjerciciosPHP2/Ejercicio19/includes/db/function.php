<?php
require_once 'connect.php';

function insertarUsuario($nombre, $apellidos, $email, $password, $bio, $rol, $imagen = null) {
    global $db;

    // Preparar la consulta
    $stmt = $db->prepare("
        INSERT INTO users (nombre, apellidos, email, password, bio, rol, imagen)
        VALUES (?, ?, ?, SHA1(?), ?, ?, ?)
    ");
    $stmt->bind_param('sssssss', $nombre, $apellidos, $email, $password, $bio, $rol, $imagen);

    if ($stmt->execute()) {
        return "Usuario insertado correctamente.";
    } else {
        return "Error al insertar usuario: " . $stmt->error;
    }
}
?>
