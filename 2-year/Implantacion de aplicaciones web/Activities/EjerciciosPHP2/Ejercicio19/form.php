<form action="recibir.php" method="POST" enctype="multipart/form-data">
    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" required><br>

    <label for="apellidos">Apellidos:</label>
    <input type="text" id="apellidos" name="apellidos" required><br>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br>

    <label for="password">Contraseña:</label>
    <input type="password" id="password" name="password" required><br>

    <label for="bio">Biografía:</label>
    <textarea id="bio" name="bio" required></textarea><br>

    <label for="rol">Rol:</label>
    <select id="rol" name="rol" required>
        <option value="admin">Admin</option>
        <option value="user">User</option>
        <option value="editor">Editor</option>
    </select><br>

    <label for="imagen">Imagen:</label>
    <input type="file" id="imagen" name="imagen"><br>

    <button type="submit">Enviar</button>
</form>
