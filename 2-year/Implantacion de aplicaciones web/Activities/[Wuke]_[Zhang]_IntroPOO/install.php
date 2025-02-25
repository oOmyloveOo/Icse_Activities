<?php
require_once('includes/db/connect.php'); // Conectarse a la BD

// Verificar si la tabla ya existe
$checkTable = "SHOW TABLES LIKE 'users'";
$result = $db->query($checkTable);

if ($result->num_rows == 0) {
    // La tabla no existe, entonces la creamos
    $sql = "CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        apellido VARCHAR(100) NOT NULL,
        edad INT NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        telefono VARCHAR(20),
        direccion VARCHAR(200),
        fechaNacimiento DATE,
        ciudad VARCHAR(100),
        pais VARCHAR(100),
        genero VARCHAR(10)
    )";

    if ($db->query($sql) === TRUE) {
        echo "✅ Tabla 'users' creada correctamente.<br>";

        // Insertar 4 registros de prueba
        $sqlInsert = "INSERT INTO users (nombre, apellido, edad, email, telefono, direccion, fechaNacimiento, ciudad, pais, genero) VALUES
            ('Juan', 'Pérez', 30, 'juan@example.com', '123456789', 'Calle A #123', '1993-05-15', 'Madrid', 'España', 'M'),
            ('Ana', 'López', 25, 'ana@example.com', '987654321', 'Avenida B #456', '1998-08-22', 'Barcelona', 'España', 'F'),
            ('Carlos', 'García', 40, 'carlos@example.com', '654321987', 'Carrera C #789', '1983-02-10', 'Sevilla', 'España', 'M'),
            ('María', 'Martínez', 35, 'maria@example.com', '321654987', 'Plaza D #101', '1988-11-30', 'Valencia', 'España', 'F')";

        if ($db->query($sqlInsert) === TRUE) {
            echo "✅ 4 registros de prueba insertados en 'users'.<br>";
        } else {
            echo "❌ Error al insertar registros: " . $db->error . "<br>";
        }
    } else {
        echo "❌ Error al crear la tabla: " . $db->error . "<br>";
    }
} else {
    echo "⚠️ La tabla 'users' ya existe en la base de datos.<br>";
}

// Cerrar conexión
$db->close();
?>
