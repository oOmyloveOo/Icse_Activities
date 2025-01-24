<?php
function generarFormularioEmail() {
    return '
        <form action="index.php" method="POST" style="text-align: center; margin-top: 20px;">
            <label for="email">Ingrese su email:</label>
            <input type="email" name="email" id="email" required>
            <button type="submit">Validar</button>
        </form>
    ';
}
?>
