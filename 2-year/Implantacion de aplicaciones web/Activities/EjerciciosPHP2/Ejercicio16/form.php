<?php 
session_start();
include 'includes/header.php'; 

// Recuperar errores de sesión
$errores = isset($_SESSION['errores']) ? $_SESSION['errores'] : [];
$datos_previos = isset($_SESSION['datos_previos']) ? $_SESSION['datos_previos'] : [];

// Limpiar datos de sesión
unset($_SESSION['errores']);
unset($_SESSION['datos_previos']);
?>

<h1>Formulario de Registro</h1>

<?php 
// Mostrar errores si existen
if (!empty($errores)): ?>
<div class="alert alert-danger">
    <ul>
        <?php foreach ($errores as $error): ?>
            <li><?php echo htmlspecialchars($error); ?></li>
        <?php endforeach; ?>
    </ul>
</div>
<?php endif; ?>

<form action="recibir1.php" method="POST" enctype="multipart/form-data">
    <label for="nombre">Nombre:</label>
    <input type="text" name="nombre" id="nombre" required 
           value="<?php echo isset($datos_previos['nombre']) ? htmlspecialchars($datos_previos['nombre']) : ''; ?>"><br>

    <label for="apellidos">Apellidos:</label>
    <input type="text" name="apellidos" id="apellidos" required
           value="<?php echo isset($datos_previos['apellidos']) ? htmlspecialchars($datos_previos['apellidos']) : ''; ?>"><br>

    <label for="biografia">Biografía:</label>
    <textarea name="biografia" id="biografia" required><?php 
        echo isset($datos_previos['biografia']) ? htmlspecialchars($datos_previos['biografia']) : ''; 
    ?></textarea><br>

    <label for="email">Email:</label>
    <input type="email" name="email" id="email" required
           value="<?php echo isset($datos_previos['email']) ? htmlspecialchars($datos_previos['email']) : ''; ?>"><br>

    <label for="imagen">Imagen:</label>
    <input type="file" name="imagen" id="imagen"><br>

    <label for="contraseña">Contraseña:</label>
    <input type="password" name="contraseña" id="contraseña" required><br>

    <label for="rol">Rol:</label>
    <select name="rol" id="rol">
        <option value="usuario" <?php echo (isset($datos_previos['rol']) && $datos_previos['rol'] === 'usuario') ? 'selected' : ''; ?>>Usuario</option>
        <option value="admin" <?php echo (isset($datos_previos['rol']) && $datos_previos['rol'] === 'admin') ? 'selected' : ''; ?>>Admin</option>
    </select><br>

    <button type="submit">Enviar</button>
</form>

<?php include 'includes/footer.php'; ?>