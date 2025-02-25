<?php
$server = "localhost:3307"; // Tener en cuenta el puerto
$username = "root";
$password = ""; 
$database = "mi_base_datos";

// Crear conexión
$db = new mysqli($server, $username, $password, $database);

// Verificar conexión
if ($db->connect_error) {
    die("Error de conexión: " . $db->connect_error);
}

echo "Conexión exitosa a la base de datos.";
?>
