<!-- install.php -->
<?php
// Incluir el archivo de conexión
include 'connect.php';

// SQL para crear la tabla `users`
$sql = "
CREATE TABLE IF NOT EXISTS users (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    biografia TEXT NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    imagen VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
";

// Ejecutar la consulta
$respuesta = $db->query($sql);

// Verificar si la tabla fue creada exitosamente
if ($respuesta) {
    echo "La tabla 'users' se ha creado correctamente.";
} else {
    echo "Error al crear la tabla: " . $db->error;
}
?>
