<?php 
require_once 'includes/header.php';  // Incluye el encabezado
require_once 'includes/functions/functionHTML.php';  // Incluye la función para generar el formulario
?>

<h1>Formulario de Registro</h1>
<?php
    echo generarFormulario();  // Llama la función para mostrar el formulario
?>

<?php 
require_once 'includes/footer.php';  // Incluye el pie de página
?>
