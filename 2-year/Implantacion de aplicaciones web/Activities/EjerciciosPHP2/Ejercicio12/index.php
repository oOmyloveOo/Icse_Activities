<?php
// Incluimos el archivo header.php utilizando require_once
require_once 'includes/header.php';
?>

<main style="padding: 20px; text-align: center;">
    <h2>Ejemplo de Include y Require</h2>
    <p>Esta es una página básica que utiliza <code>include</code> y <code>require</code> para separar el contenido en diferentes archivos.</p>
    <p>El encabezado y el pie de página se encuentran en la carpeta <strong>includes</strong>.</p>
</main>

<?php
// Incluimos el archivo footer.php utilizando include_once
include_once 'includes/footer.php';
?>
