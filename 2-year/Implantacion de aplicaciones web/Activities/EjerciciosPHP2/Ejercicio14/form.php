<?php 
require_once 'includes/header.php';  // Incluye el encabezado
require_once 'includes/functions/function.php';  // Incluye las funciones generales
require_once 'includes/functions/functionHTML.php';  // Incluye la función para generar el formulario

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Aquí validas los campos del formulario.
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $biografia = $_POST['biografia'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $rol = $_POST['rol'];

    // Validación del email
    if (validarEmail($email)) {
        echo "Email válido: " . $email;
    } else {
        echo "El email no es válido.";
    }

}

?>

<h1>Formulario de Registro</h1>
<?php
    echo generarFormulario(); 
?>

<?php 
require_once 'includes/footer.php';  
?>
