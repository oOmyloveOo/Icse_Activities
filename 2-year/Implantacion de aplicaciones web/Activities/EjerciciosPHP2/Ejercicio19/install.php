<?php
require_once 'includes/db/connect.php';

$sql = "
    CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellidos VARCHAR(50) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        password VARCHAR(255) NOT NULL,
        bio TEXT,
        rol VARCHAR(20),
        imagen VARCHAR(255)
    )
";

if ($db->query($sql)) {
    echo "Tabla 'users' creada o ya existe.<br>";
} else {
    echo "Error creando tabla: " . $db->error;
}

// Insertar registros
$insert_sql = "
    INSERT INTO users (nombre, apellidos, email, password, bio, rol, imagen) VALUES
    ('John', 'Doe', 'john.doe@example.com', SHA1('password1'), 'Bio de John', 'admin', NULL),
    ('Jane', 'Smith', 'jane.smith@example.com', SHA1('password2'), 'Bio de Jane', 'user', NULL),
    ('Alice', 'Johnson', 'alice.johnson@example.com', SHA1('password3'), 'Bio de Alice', 'editor', NULL),
    ('Bob', 'Brown', 'bob.brown@example.com', SHA1('password4'), 'Bio de Bob', 'user', NULL)
";

if ($db->query($insert_sql)) {
    echo "Registros insertados correctamente.<br>";
} else {
    echo "Error al insertar registros: " . $db->error;
}

$db->close();
?>
