<?php include 'includes/header.php'; ?>
<form action="recibir.php" method="POST" enctype="multipart/form-data">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" required><br>

    <label for="apellidos">Apellidos:</label>
    <input type="text" name="apellidos" id="apellidos" required><br>

    <label for="bio">Biografía:</label>
    <textarea name="bio" id="bio" required></textarea><br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required><br>

    <label for="password">Contraseña:</label>
    <input type="password" name="password" id="password" required><br>

    <label for="rol">Rol:</label>
    <select name="rol" id="rol" required>
        <option value="admin">Admin</option>
        <option value="user">User</option>
    </select><br>

    <label for="imagen">Imagen:</label>
    <input type="file" name="imagen" id="imagen"><br>

    <input type="submit" value="Enviar">
</form>
<?php include 'includes/footer.php'; ?>
