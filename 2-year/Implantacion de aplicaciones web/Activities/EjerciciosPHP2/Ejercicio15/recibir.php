<?php
include 'includes/header.php';

// Verificar si se ha enviado el formulario por método POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Comprobar existencia de variables usando isset()
    $nombre = isset($_POST['nombre']) ? htmlspecialchars($_POST['nombre']) : '';
    $apellidos = isset($_POST['apellidos']) ? htmlspecialchars($_POST['apellidos']) : '';
    $biografia = isset($_POST['biografia']) ? htmlspecialchars($_POST['biografia']) : '';
    $email = isset($_POST['email']) ? htmlspecialchars($_POST['email']) : '';
    $rol = isset($_POST['rol']) ? htmlspecialchars($_POST['rol']) : '';
    $contraseña = isset($_POST['contraseña']) ? $_POST['contraseña'] : '';

    // Generar hash de la contraseña usando SHA-1
    $contraseña_hash = sha1($contraseña);

    // Procesar imagen si se ha subido
    $imagen_path = '';
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $carpeta_uploads = 'uploads/';
        if (!file_exists($carpeta_uploads)) {
            mkdir($carpeta_uploads, 0777, true);
        }
        
        $imagen_nombre = uniqid() . '_' . basename($_FILES['imagen']['name']);
        $imagen_path = $carpeta_uploads . $imagen_nombre;
        
        move_uploaded_file($_FILES['imagen']['tmp_name'], $imagen_path);
    }

    // Mostrar información procesada
    echo "<div class='container'>";
    echo "<h2>Datos Procesados</h2>";
    echo "<table class='table'>";
    echo "<tr><th>Campo</th><th>Valor</th></tr>";
    echo "<tr><td>Nombre</td><td>$nombre</td></tr>";
    echo "<tr><td>Apellidos</td><td>$apellidos</td></tr>";
    echo "<tr><td>Biografía</td><td>$biografia</td></tr>";
    echo "<tr><td>Email</td><td>$email</td></tr>";
    echo "<tr><td>Rol</td><td>$rol</td></tr>";
    echo "<tr><td>Contraseña (Hash)</td><td>$contraseña_hash</td></tr>";
    
    if ($imagen_path) {
        echo "<tr><td>Imagen</td><td><img src='$imagen_path' alt='Imagen subida' style='max-width:200px;'></td></tr>";
    }
    
    echo "</table>";
    echo "</div>";
}
else {
    // Si se intenta acceder directamente sin enviar formulario
    echo "<p>Acceso no autorizado. Por favor, envíe el formulario.</p>";
}

include 'includes/footer.php';
?>