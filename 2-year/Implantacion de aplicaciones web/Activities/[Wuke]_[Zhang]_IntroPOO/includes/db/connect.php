<?php
$servername = "localhost:3306";
$username = "root"; 
$password = ""; 
$dbname = "mi_base_datos"; 

// Crear conexión
$db = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($db->connect_error) {
    die("Error de conexión: " . $db->connect_error);
}

?>
