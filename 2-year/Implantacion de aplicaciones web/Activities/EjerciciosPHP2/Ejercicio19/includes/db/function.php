<?php
require_once 'connect.php';

/**
 * Inserta un nuevo usuario en la base de datos
 * 
 * @param string $nombre Nombre del usuario
 * @param string $apellidos Apellidos del usuario
 * @param string $bio Biografía del usuario
 * @param string $email Email del usuario
 * @param string $password Contraseña sin encriptar
 * @param string $rol Rol del usuario (admin/user)
 * @param string|null $imagen Ruta de la imagen de perfil
 * @return array Resultado de la operación con status y mensaje
 */
function insertarUsuario($nombre, $apellidos, $bio, $email, $password, $rol, $imagen = null) {
    global $db;
    
    try {
        // Validaciones básicas
        if (empty($nombre) || empty($apellidos) || empty($email) || empty($password)) {
            return [
                'status' => 'error',
                'message' => 'Todos los campos obligatorios deben estar completos'
            ];
        }

        // Validar email
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return [
                'status' => 'error',
                'message' => 'El formato del email no es válido'
            ];
        }

        // Verificar si el email ya existe
        $check_email = $db->prepare("SELECT id FROM users WHERE email = ?");
        $check_email->bind_param("s", $email);
        $check_email->execute();
        $result = $check_email->get_result();
        
        if ($result->num_rows > 0) {
            return [
                'status' => 'error',
                'message' => 'El email ya está registrado'
            ];
        }

        // Preparar la contraseña como un hash SHA-256
        $hashed_password = hash('sha256', $password);

        // Validar rol
        $rol = strtolower($rol);
        if (!in_array($rol, ['admin', 'user'])) {
            $rol = 'user'; // Rol por defecto
        }

        // Consulta de inserción
        $sql = "INSERT INTO users (nombre, apellidos, bio, email, password, rol, imagen) 
                VALUES (?, ?, ?, ?, ?, ?, ?)";

        $stmt = $db->prepare($sql);
        $stmt->bind_param("sssssss", $nombre, $apellidos, $bio, $email, $hashed_password, $rol, $imagen);

        // Ejecutar la consulta
        if ($stmt->execute()) {
            return [
                'status' => 'success',
                'message' => 'Usuario insertado correctamente'
            ];
        } else {
            throw new Exception($stmt->error);
        }
    } catch (Exception $e) {
        return [
            'status' => 'error',
            'message' => 'Error al insertar usuario: ' . $e->getMessage()
        ];
    } finally {
        if (isset($stmt)) {
            $stmt->close();
        }
    }
}