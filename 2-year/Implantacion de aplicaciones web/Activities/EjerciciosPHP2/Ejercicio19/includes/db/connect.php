<!-- includes/connect.php -->
<?php
$server = "localhost"; // Cambia si tienes otro servidor
$username = "root";    // Cambia según tu usuario de MySQL
$password = "";        // Cambia según la contraseña de MySQL
$database = "mi_base_datos"; // Cambia por el nombre de tu base de datos

// Crear conexión
$db = new mysqli($server, $username, $password, $database);

// Verificar la conexión
if ($db->connect_error) {
    die("Error de conexión: " . $db->connect_error);
}

echo "Conexión exitosa a la base de datos.";
?>
