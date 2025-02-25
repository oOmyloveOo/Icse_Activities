<?php
require_once 'connect.php';

// Crear la tabla users si no existe
$sql = "CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    rol VARCHAR(50) NOT NULL
)";

if ($db->query($sql) === TRUE) {
    echo "✅ Tabla 'users' creada correctamente.";
} else {
    echo "❌ Error al crear la tabla: " . $db->error;
}

// Cerrar conexión
$db->close();
?>
