<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Persona</title>
</head>
<body>
    <h2>Formulario de Persona</h2>
    <form action="recibir.php" method="POST">
        <label>Nombre: <input type="text" name="nombre" required></label><br>
        <label>Apellido: <input type="text" name="apellido" required></label><br>
        <label>Edad: <input type="number" name="edad" required></label><br>
        <label>Email: <input type="email" name="email" required></label><br>
        <label>Teléfono: <input type="text" name="telefono" required></label><br>
        <label>Dirección: <input type="text" name="direccion" required></label><br>
        <label>Fecha de Nacimiento: <input type="date" name="fechaNacimiento" required></label><br>
        <label>Ciudad: <input type="text" name="ciudad" required></label><br>
        <label>País: <input type="text" name="pais" required></label><br>
        <label>Género: <input type="text" name="genero" required></label><br>
        <input type="submit" value="Enviar">
    </form>
</body>
</html>
