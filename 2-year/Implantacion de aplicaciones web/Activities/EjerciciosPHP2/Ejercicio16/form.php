<!-- form.php -->
<?php include 'includes/header.php'; ?>

<h1>Formulario de Registro</h1>

<form action="recibir1.php" method="POST" enctype="multipart/form-data">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" required><br>

    <label for="apellidos">Apellidos:</label>
    <input type="text" name="apellidos" id="apellidos" required><br>

    <label for="biografia">Biografía:</label>
    <textarea name="biografia" id="biografia" required></textarea><br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required><br>

    <label for="imagen">Imagen:</label>
    <input type="file" name="imagen" id="imagen"><br>

    <label for="contraseña">Contraseña:</label>
    <input type="password" name="contraseña" id="contraseña" required><br>

    <button type="submit">Enviar</button>
</form>

<?php include 'includes/footer.php'; ?>
