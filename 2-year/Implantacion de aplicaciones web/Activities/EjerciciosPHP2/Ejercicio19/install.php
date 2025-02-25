<?php
// Primero mostramos errores para debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Incluimos la conexión a la base de datos con la ruta correcta
require_once 'includes/db/connect.php';

// Creamos la base de datos si no existe
$sql_database = "CREATE DATABASE IF NOT EXISTS mi_base_datos";
if ($db->query($sql_database)) {
    echo "Base de datos creada o ya existente.<br>";
    
    // Seleccionamos la base de datos
    $db->select_db("mi_base_datos");
    
    // Creamos la tabla users
    $sql_table = "CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        apellidos VARCHAR(50) NOT NULL,
        bio TEXT NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        password VARCHAR(64) NOT NULL,
        rol VARCHAR(20) NOT NULL,
        imagen VARCHAR(255),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )";

    if ($db->query($sql_table)) {
        echo "Tabla 'users' creada correctamente.<br>";
    } else {
        echo "Error al crear la tabla: " . $db->error . "<br>";
    }
} else {
    echo "Error al crear la base de datos: " . $db->error . "<br>";
}
?>

<p><a href="index.php">Volver al inicio</a></p>