<?php

function generarFormulario() {
    return '
        <form action="form.php" method="POST" enctype="multipart/form-data" style="max-width: 600px; margin: auto;">
            <div>
                <label for="nombre">Nombre:</label>
                <input type="text" name="nombre" id="nombre" required>
            </div>
            <div>
                <label for="apellidos">Apellidos:</label>
                <input type="text" name="apellidos" id="apellidos" required>
            </div>
            <div>
                <label for="biografia">Biografía:</label>
                <textarea name="biografia" id="biografia" required></textarea>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" required>
            </div>
            <div>
                <label for="imagen">Imagen:</label>
                <input type="file" name="imagen" id="imagen" accept="image/*">
            </div>
            <div>
                <label for="password">Contraseña:</label>
                <input type="password" name="password" id="password" required>
            </div>
            <div>
                <label for="rol">Rol:</label>
                <select name="rol" id="rol" required>
                    <option value="usuario">Usuario</option>
                    <option value="admin">Administrador</option>
                </select>
            </div>
            <div style="margin-top: 10px;">
                <button type="submit">Enviar</button>
            </div>
        </form>
    ';
}
?>
